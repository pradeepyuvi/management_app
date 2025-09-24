// Add these imports
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_search_bar.dart';
import '../services/firestore_service.dart';

class PaymentsPage extends StatefulWidget {
  const PaymentsPage({super.key});

  @override
  State<PaymentsPage> createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsPage> {
  final TextEditingController searchController = TextEditingController();
  final ValueNotifier<String> searchQuery = ValueNotifier('');
  String filterStatus = 'all'; // 'all', 'paid', 'not paid'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Payments'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                CustomSearchBar(
                  controller: searchController,
                  onChanged: (value) => searchQuery.value = value,
                  hintText: 'Search by name, room no',
                ),
                const SizedBox(height: 8),
                ToggleButtons(
                  isSelected: [
                    filterStatus == 'all',
                    filterStatus == 'paid',
                    filterStatus == 'not paid',
                  ],
                  onPressed: (index) {
                    setState(() {
                      filterStatus = ['all', 'paid', 'not paid'][index];
                    });
                  },
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text('All'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text('Paid'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text('Not Paid'),
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
                return StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('paymentsPage')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    final docs = snapshot.data!.docs;

                    final filteredDocs = docs.where((doc) {
                      final data = doc.data() as Map<String, dynamic>;
                      final name = data['name']?.toString().toLowerCase() ?? '';
                      final room =
                          data['roomNo']?.toString().toLowerCase() ?? '';
                      final mobile =
                          data['mobile']?.toString().toLowerCase() ?? '';
                      final status = data['paymentStatus'] ?? 'not paid';
                      final queryLower = query.toLowerCase();

                      final matchesQuery =
                          name.contains(queryLower) ||
                          room.contains(queryLower) ||
                          mobile.contains(queryLower);

                      final matchesStatus =
                          filterStatus == 'all' || status == filterStatus;

                      return matchesQuery && matchesStatus;
                    }).toList();

                    if (filteredDocs.isEmpty) {
                      return const Center(
                        child: Text("No matching entries found."),
                      );
                    }

                    return ListView.builder(
                      itemCount: filteredDocs.length,
                      itemBuilder: (context, index) {
                        final doc = filteredDocs[index];
                        final data = doc.data() as Map<String, dynamic>;
                        final phone = data['mobile'] ?? '';
                        final paymentStatus =
                            data['paymentStatus'] ?? 'not paid';

                        return Card(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    data['imageUrl'] ?? '',
                                    width: 70,
                                    height: 70,
                                    fit: BoxFit.cover,
                                    errorBuilder: (_, __, ___) => Container(
                                      width: 70,
                                      height: 70,
                                      color: Colors.grey.shade300,
                                      child: const Icon(Icons.person, size: 40),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Name: ${data['name'] ?? ''}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text('Mobile: ${data['mobile'] ?? ''}'),
                                      const SizedBox(height: 4),
                                      Text('Room No: ${data['roomNo'] ?? ''}'),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.call,
                                        color: Colors.green,
                                      ),
                                      onPressed: () {
                                        if (phone.isNotEmpty) {
                                          launchUrl(Uri.parse('tel:$phone'));
                                        }
                                      },
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        final isCurrentlyPaid =
                                            paymentStatus == 'paid';
                                        final confirm = await showDialog<bool>(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title: Text(
                                              isCurrentlyPaid
                                                  ? 'Mark as Not Paid?'
                                                  : 'Mark as Paid?',
                                            ),
                                            content: Text(
                                              isCurrentlyPaid
                                                  ? 'Are you sure this person is not paid?'
                                                  : 'Are you sure this person is paid?',
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                  context,
                                                  false,
                                                ),
                                                child: const Text('Cancel'),
                                              ),
                                              ElevatedButton(
                                                onPressed: () => Navigator.pop(
                                                  context,
                                                  true,
                                                ),
                                                child: const Text('Confirm'),
                                              ),
                                            ],
                                          ),
                                        );

                                        if (confirm == true) {
                                          final newStatus = isCurrentlyPaid
                                              ? 'not paid'
                                              : 'paid';

                                          await doc.reference.update({
                                            'paymentStatus': newStatus,
                                          });

                                          final mobile = data['mobile'];
                                          if (mobile != null) {
                                            final customerDocs =
                                                await FirebaseFirestore.instance
                                                    .collection(
                                                      'customerDetails',
                                                    )
                                                    .where(
                                                      'mobile',
                                                      isEqualTo: mobile,
                                                    )
                                                    .get();

                                            for (var customerDoc
                                                in customerDocs.docs) {
                                              await customerDoc.reference
                                                  .update({
                                                    'paymentStatus': newStatus,
                                                  });
                                            }
                                          }

                                          await FirestoreService()
                                              .updateUnpaidCustomerCount();

                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Marked as $newStatus',
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: paymentStatus == 'paid'
                                              ? Colors.greenAccent
                                              : Colors.redAccent,
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 6,
                                        ),
                                        child: Text(
                                          paymentStatus == 'paid'
                                              ? 'Paid'
                                              : 'Not paid',
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
