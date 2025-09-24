import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_search_bar.dart';

class RecentCheckPage extends StatefulWidget {
  const RecentCheckPage({super.key});

  @override
  State<RecentCheckPage> createState() => _RecentCheckPageState();
}

class _RecentCheckPageState extends State<RecentCheckPage> {
  final TextEditingController searchController = TextEditingController();
  final ValueNotifier<String> searchQuery = ValueNotifier('');
  String filterStatus = 'all'; // 'all', 'check-in', 'check-out'

  DateTime? parseDate(dynamic value) {
    if (value is Timestamp) return value.toDate();
    if (value is String) return DateTime.tryParse(value);
    return null;
  }

  String formatDate(DateTime? date) {
    if (date == null) return 'NA';
    return '${date.day}/${date.month}/${date.year}';
  }

  Future<List<QueryDocumentSnapshot>> getCombinedDocs() async {
    final firestore = FirebaseFirestore.instance;

    final checkInSnapshot = await firestore.collection('customerDetails').get();
    final checkOutSnapshot = await firestore
        .collection('recentCheckOuts')
        .where(
          'checkOut',
          isGreaterThan: Timestamp.fromMillisecondsSinceEpoch(0),
        )
        .get();

    return [...checkInSnapshot.docs, ...checkOutSnapshot.docs];
  }

  Stream<QuerySnapshot> getStream() {
    final firestore = FirebaseFirestore.instance;
    if (filterStatus == 'check-in') {
      return firestore
          .collection('customerDetails')
          .where('checkOut', isNull: true)
          .snapshots();
    } else if (filterStatus == 'check-out') {
      return firestore
          .collection('recentCheckOuts')
          .where(
            'checkOut',
            isGreaterThan: Timestamp.fromMillisecondsSinceEpoch(0),
          )
          .snapshots();
    } else {
      return firestore.collection('customerDetails').snapshots();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Recent Check'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomSearchBar(
                        controller: searchController,
                        onChanged: (value) => searchQuery.value = value,
                        hintText: 'Search by name or Aadhaar...',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ToggleButtons(
                  isSelected: [
                    filterStatus == 'all',
                    filterStatus == 'check-in',
                    filterStatus == 'check-out',
                  ],
                  onPressed: (index) {
                    setState(() {
                      filterStatus = ['all', 'check-in', 'check-out'][index];
                    });
                  },
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text('All'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text('Check-in'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text('Check-out'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ValueListenableBuilder<String>(
              valueListenable: searchQuery,
              builder: (context, query, _) {
                if (filterStatus == 'all') {
                  return FutureBuilder<List<QueryDocumentSnapshot>>(
                    future: getCombinedDocs(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      final docs = snapshot.data!;
                      final filteredDocs = docs.where((doc) {
                        final data = doc.data() as Map<String, dynamic>;
                        final name =
                            data['name']?.toString().toLowerCase() ?? '';
                        final aadhaar =
                            data['aadhaar']?.toString().toLowerCase() ?? '';
                        return name.contains(query.toLowerCase()) ||
                            aadhaar.contains(query.toLowerCase());
                      }).toList();

                      if (filteredDocs.isEmpty) {
                        return const Center(
                          child: Text("No matching entries found."),
                        );
                      }

                      return ListView.builder(
                        itemCount: filteredDocs.length,
                        itemBuilder: (context, index) {
                          final data =
                              filteredDocs[index].data()
                                  as Map<String, dynamic>;
                          final checkIn = parseDate(data['checkIn']);
                          final checkOut = parseDate(data['checkOut']);
                          return Card(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            elevation: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      data['imageUrl'] ?? '',
                                      width: 60,
                                      height: 60,
                                      fit: BoxFit.cover,
                                      errorBuilder: (_, __, ___) =>
                                          const Icon(Icons.person, size: 60),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data['name'] ?? 'No Name',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          'Mobile: ${data['mobile'] ?? 'NA'}',
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          'Aadhaar: ${data['aadhaar'] ?? 'NA'}',
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          'Check-in: ${formatDate(checkIn)}',
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          'Check-out: ${formatDate(checkOut)}',
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                } else {
                  return StreamBuilder<QuerySnapshot>(
                    stream: getStream(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      final docs = snapshot.data!.docs;
                      final filteredDocs = docs.where((doc) {
                        final data = doc.data() as Map<String, dynamic>;
                        final name =
                            data['name']?.toString().toLowerCase() ?? '';
                        final aadhaar =
                            data['aadhaar']?.toString().toLowerCase() ?? '';
                        return name.contains(query.toLowerCase()) ||
                            aadhaar.contains(query.toLowerCase());
                      }).toList();

                      if (filteredDocs.isEmpty) {
                        return const Center(
                          child: Text("No matching entries found."),
                        );
                      }

                      return ListView.builder(
                        itemCount: filteredDocs.length,
                        itemBuilder: (context, index) {
                          final data =
                              filteredDocs[index].data()
                                  as Map<String, dynamic>;
                          final checkIn = parseDate(data['checkIn']);
                          final checkOut = parseDate(data['checkOut']);
                          return Card(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            elevation: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      data['imageUrl'] ?? '',
                                      width: 60,
                                      height: 60,
                                      fit: BoxFit.cover,
                                      errorBuilder: (_, __, ___) =>
                                          const Icon(Icons.person, size: 60),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data['name'] ?? 'No Name',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          'Mobile: ${data['mobile'] ?? 'NA'}',
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          'Aadhaar: ${data['aadhaar'] ?? 'NA'}',
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          'Check-in: ${formatDate(checkIn)}',
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          'Check-out: ${formatDate(checkOut)}',
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
