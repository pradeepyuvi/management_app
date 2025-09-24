import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_search_bar.dart';
import '../services/firestore_service.dart';
import '../customerdetails/add_customer_details_page.dart';
import '../customerdetails/modify_customer_details_page.dart';

class CustomerDetailsPage extends StatelessWidget {
  const CustomerDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    final ValueNotifier<String> searchQuery = ValueNotifier('');
    final firestoreService = FirestoreService();

    return Scaffold(
      appBar: const CustomAppBar(title: 'Customer Details'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: CustomSearchBar(
              controller: searchController,
              onChanged: (value) => searchQuery.value = value,
              hintText: 'Search by name, Aadhaar, room no, or check-in...',
            ),
          ),
          Expanded(
            child: ValueListenableBuilder<String>(
              valueListenable: searchQuery,
              builder: (context, query, _) {
                return StreamBuilder<QuerySnapshot>(
                  stream: firestoreService.getCustomerDetailsStream(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    final docs = snapshot.data!.docs;

                    final filteredDocs = docs.where((doc) {
                      final data = doc.data() as Map<String, dynamic>;
                      final name = data['name']?.toString().toLowerCase() ?? '';
                      final aadhaar =
                          data['aadhaar']?.toString().toLowerCase() ?? '';
                      final room =
                          data['roomNo']?.toString().toLowerCase() ?? '';
                      final checkIn =
                          data['checkIn']?.toString().toLowerCase() ?? '';
                      final mobile =
                          data['mobile']?.toString().toLowerCase() ?? '';
                      final queryLower = query.toLowerCase();

                      return name.contains(queryLower) ||
                          aadhaar.contains(queryLower) ||
                          room.contains(queryLower) ||
                          checkIn.contains(queryLower) ||
                          mobile.contains(queryLower);
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

                        final checkInDate = data['checkIn'] != null
                            ? DateTime.tryParse(data['checkIn'])?.toLocal()
                            : null;

                        final formattedDate = checkInDate != null
                            ? '${checkInDate.day}/${checkInDate.month}/${checkInDate.year}'
                            : 'N/A';

                        final phone = data['mobile'] ?? '';

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
                                // Image on the left
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
                                // Details in the middle
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
                                      Text('Aadhaar: ${data['aadhaar'] ?? ''}'),
                                      const SizedBox(height: 4),
                                      Text('Room No: ${data['roomNo'] ?? ''}'),
                                      const SizedBox(height: 4),
                                      Text('Check-in Date: $formattedDate'),
                                    ],
                                  ),
                                ),
                                // Action icons on the right
                                Column(
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
                                    IconButton(
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.grey,
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ModifyCustomerPage(
                                                  customerId: doc.id,
                                                ),
                                          ),
                                        );
                                      },
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddCustomerDetailsPage(),
            ),
          );
        },
      ),
    );
  }
}
