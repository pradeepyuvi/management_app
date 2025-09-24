import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';
import '../services/firestore_service.dart';

class ModifyCustomerPage extends StatelessWidget {
  final String customerId;
  const ModifyCustomerPage({super.key, required this.customerId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modify Customer'),
        backgroundColor: Colors.teal,
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('customerDetails')
            .doc(customerId)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.data!.exists) {
            return const Center(child: Text('Customer not found.'));
          }
          final data = snapshot.data!.data() as Map<String, dynamic>;
          final imageUrl = data['imageUrl'] ?? '';
          final name = data['name'] ?? '';
          final mobile = data['mobile'] ?? '';
          final aadhaar = data['aadhaar'] ?? '';
          final roomNo = data['roomNo'] ?? '';
          final sharing = data['sharing'] ?? '';
          final checkIn = _formatDate(data['checkIn']);
          final checkOut = _formatDate(data['checkOut']);
          final documents = data['documents'] ?? [];

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        imageUrl,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          width: 80,
                          height: 80,
                          color: Colors.grey.shade300,
                          child: const Icon(Icons.person, size: 40),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(mobile, style: const TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _infoRow('Aadhaar', aadhaar),
                _infoRow('Room No', roomNo),
                _infoRow('Sharing', sharing),
                _infoRow('Check-in', checkIn),
                _infoRow('Check-out', checkOut),
                const SizedBox(height: 16),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Documents & Photos',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    for (var doc in documents.take(3))
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Icon(Icons.insert_drive_file, size: 40),
                      ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () => launchUrl(Uri.parse('tel:$mobile')),
                      icon: const Icon(Icons.call),
                      label: const Text('Call'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        _showBlockDialog(context, data);
                      },
                      icon: const Icon(Icons.block),
                      label: const Text('Block'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        _showCheckoutDialog(context, data);
                      },
                      icon: const Icon(Icons.logout),
                      label: const Text('Check-out'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Divider(),
                const Text(
                  'Room Change',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                _roomChangeSection(roomNo, sharing),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      // Save logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                    ),
                    child: const Text('Save', style: TextStyle(fontSize: 16)),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text('$label: $value'),
      ),
    );
  }

  Widget _roomChangeSection(String roomNo, String sharing) {
    final roomController = TextEditingController(text: roomNo);
    final sharingNotifier = ValueNotifier(sharing);
    return Column(
      children: [
        TextField(
          controller: roomController,
          decoration: const InputDecoration(labelText: 'New Room No'),
        ),
        const SizedBox(height: 12),
        ValueListenableBuilder<String>(
          valueListenable: sharingNotifier,
          builder: (_, value, __) => DropdownButtonFormField<String>(
            initialValue: value,
            decoration: const InputDecoration(labelText: 'Sharing'),
            items: [
              '1',
              '2',
              '3',
              '4',
            ].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
            onChanged: (val) => sharingNotifier.value = val ?? sharing,
          ),
        ),
      ],
    );
  }

  static String _formatDate(dynamic dateField) {
    if (dateField == null) return 'NA';
    try {
      if (dateField is Timestamp) {
        final date = dateField.toDate();
        return '${date.day}/${date.month}/${date.year}';
      } else if (dateField is String) {
        final date = DateTime.tryParse(dateField);
        if (date != null) {
          return '${date.day}/${date.month}/${date.year}';
        }
      }
    } catch (_) {}
    return 'NA';
  }

  void _showBlockDialog(
    BuildContext context,
    Map<String, dynamic> customerData,
  ) {
    final TextEditingController reasonController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Block Customer'),
        content: TextField(
          controller: reasonController,
          decoration: const InputDecoration(labelText: 'Reason for blocking'),
          maxLines: 2,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () async {
              final reason = reasonController.text.trim();
              if (reason.isEmpty) return;

              // Add to blocklist
              // await FirebaseFirestore.instance.collection('blocklist').add({
              //   ...customerData,
              //   'reason': reason,
              //   'blockedAt': FieldValue.serverTimestamp(),
              //   'timestamp': FieldValue.serverTimestamp(),
              // });

              await FirestoreService().addBlocklistEntry(
                name: customerData['name'] ?? '',
                aadhaar: customerData['aadhaar'] ?? '',
                reason: reason,
                imageUrl: customerData['imageUrl'] ?? '',
              );

              // Remove from customerDetails
              await FirebaseFirestore.instance
                  .collection('customerDetails')
                  .doc(customerId)
                  .delete();

              // Remove from paymentsPage
              final mobile = customerData['mobile'];
              if (mobile != null) {
                final paymentDocs = await FirebaseFirestore.instance
                    .collection('paymentsPage')
                    .where('mobile', isEqualTo: mobile)
                    .get();
                for (var doc in paymentDocs.docs) {
                  await doc.reference.delete();
                }
              }

              // Increase bed count in availableRooms
              final roomNo = customerData['roomNo'];
              if (roomNo != null) {
                final roomQuery = await FirebaseFirestore.instance
                    .collection('availableRooms')
                    .where('roomNo', isEqualTo: roomNo)
                    .limit(1)
                    .get();
                if (roomQuery.docs.isNotEmpty) {
                  final doc = roomQuery.docs.first;
                  final currentBedCount =
                      int.tryParse(doc['bedcount'].toString()) ?? 0;
                  final updatedBedCount = currentBedCount + 1;
                  await doc.reference.update({'bedcount': updatedBedCount});
                }
              }

              // Update stats
              await FirestoreService().updateCustomerCount();
              await FirestoreService().incrementBlocklistCount();
              await FirestoreService().updateUnpaidCustomerCount();
              await FirestoreService().updateTotalBedsCount();

              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('Block'),
          ),
        ],
      ),
    );
  }

  void _showCheckoutDialog(
    BuildContext context,
    Map<String, dynamic> customerData,
  ) {
    final checkInDate = customerData['checkIn'];
    String formattedCheckIn = 'NA';
    if (checkInDate != null) {
      try {
        if (checkInDate is Timestamp) {
          final date = checkInDate.toDate();
          formattedCheckIn = '${date.day}/${date.month}/${date.year}';
        } else if (checkInDate is String) {
          final date = DateTime.tryParse(checkInDate);
          if (date != null) {
            formattedCheckIn = '${date.day}/${date.month}/${date.year}';
          }
        }
      } catch (_) {}
    }
    final now = DateTime.now();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Check-out'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputDecorator(
              decoration: const InputDecoration(labelText: 'Check-in Date'),
              child: Text(formattedCheckIn),
            ),
            InputDecorator(
              decoration: const InputDecoration(labelText: 'Check-out Date'),
              child: Text('${now.day}/${now.month}/${now.year}'),
            ),

            const SizedBox(height: 16),
            const Text('Are you sure you want to check out this customer?'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            onPressed: () async {
              final now = DateTime.now();
              final updatedData = {
                ...customerData,
                'checkIn': customerData['checkIn'],
                'checkOut': Timestamp.fromDate(now),
                'checkedOutAt': FieldValue.serverTimestamp(),
              };
              final recentDocs = await FirebaseFirestore.instance
                  .collection('recentCheckOuts')
                  .where('aadhaar', isEqualTo: customerData['aadhaar'])
                  .get();
              for (var doc in recentDocs.docs) {
                await doc.reference.update(updatedData);
              }
              await FirebaseFirestore.instance
                  .collection('customerDetails')
                  .doc(customerId)
                  .delete();

              final mobile = customerData['mobile'];
              if (mobile != null) {
                final paymentDocs = await FirebaseFirestore.instance
                    .collection('paymentsPage')
                    .where('mobile', isEqualTo: mobile)
                    .get();
                for (var doc in paymentDocs.docs) {
                  await doc.reference.delete();
                }
              }

              await FirestoreService().updateCustomerCount();
              final roomNo = customerData['roomNo'];
              final roomQuery = await FirebaseFirestore.instance
                  .collection('availableRooms')
                  .where('roomNo', isEqualTo: roomNo)
                  .limit(1)
                  .get();

              if (roomQuery.docs.isNotEmpty) {
                final doc = roomQuery.docs.first;
                final currentBedCount =
                    int.tryParse(doc['bedcount'].toString()) ?? 0;
                final updatedBedCount = currentBedCount + 1;
                await doc.reference.update({'bedcount': updatedBedCount});

                await FirestoreService().updateTotalBedsCount();
              }
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('Check-out'),
          ),
        ],
      ),
    );
  }
}
