import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_search_bar.dart';
import '../customerdetails/add_customer_details_page.dart';

class AvailableRoomsPage extends StatefulWidget {
  const AvailableRoomsPage({super.key});

  @override
  State<AvailableRoomsPage> createState() => _AvailableRoomsPageState();
}

class _AvailableRoomsPageState extends State<AvailableRoomsPage> {
  final TextEditingController searchController = TextEditingController();
  String searchQuery = '';
  String selectedSharing = 'All';
  String selectedAvailability = 'All';

  final List<String> sharingOptions = ['All', '1', '2', '3', '4'];
  final List<String> availabilityOptions = ['All', 'Available', 'Occupied'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Available Rooms'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomSearchBar(
              controller: searchController,
              hintText: 'Search Room No...',
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    initialValue: selectedSharing,
                    decoration: const InputDecoration(labelText: 'Sharing'),
                    items: sharingOptions.map((type) {
                      return DropdownMenuItem(
                        value: type,
                        child: Text(
                          type == 'All' ? 'All Types' : '$type Sharing',
                        ),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedSharing = val!;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    initialValue: selectedAvailability,
                    decoration: const InputDecoration(
                      labelText: 'Availability',
                    ),
                    items: availabilityOptions.map((status) {
                      return DropdownMenuItem(
                        value: status,
                        child: Text(status),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedAvailability = val!;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('availableRooms')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final rooms = snapshot.data!.docs.where((room) {
                    final roomNo = room['roomNo'].toString().toLowerCase();
                    final sharing = room['sharing'].toString();
                    final bedcount =
                        int.tryParse(room['bedcount'].toString()) ?? 0;
                    String availability = room['availability'].toString();
                    if (bedcount == 0) availability = 'Occupied';

                    final matchesSearch =
                        searchQuery.isEmpty ||
                        roomNo.contains(searchQuery.toLowerCase());
                    final matchesSharing =
                        selectedSharing == 'All' || sharing == selectedSharing;
                    final matchesAvailability =
                        selectedAvailability == 'All' ||
                        availability == selectedAvailability;

                    return matchesSearch &&
                        matchesSharing &&
                        matchesAvailability;
                  }).toList();

                  return GridView.builder(
                    itemCount: rooms.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                    itemBuilder: (context, index) {
                      final room = rooms[index];
                      final roomNo = room['roomNo'];
                      final sharing = room['sharing'];
                      final bedcount =
                          int.tryParse(room['bedcount'].toString()) ?? 0;
                      String availability = room['availability'];
                      if (bedcount == 0) availability = 'Occupied';

                      Color statusColor;
                      if (availability == 'Available') {
                        statusColor = Colors.green;
                      } else if (availability == 'Occupied') {
                        statusColor = Colors.red;
                      } else {
                        statusColor = Colors.orange;
                      }

                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddCustomerDetailsPage(),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Room $roomNo',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text('$sharing Sharing'),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.bed,
                                          color: Colors.grey,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          bedcount.toString(),
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: statusColor,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        availability,
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
