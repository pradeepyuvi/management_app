import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_text_field.dart';
import '../services/firestore_service.dart';

class AddRoomsPage extends StatefulWidget {
  final Map<String, dynamic> ownerPgData;
  const AddRoomsPage({super.key, required this.ownerPgData});

  @override
  State<AddRoomsPage> createState() => _AddRoomsPageState();
}

class _AddRoomsPageState extends State<AddRoomsPage> {
  List<Map<String, dynamic>> roomFields = [
    {'controller': TextEditingController(), 'sharing': '1'},
  ];

  void addRoomField() {
    setState(() {
      roomFields.add({'controller': TextEditingController(), 'sharing': '1'});
    });
  }

  Future<void> submitRooms() async {
    // 🔹 Add PG Header data first
    await FirebaseFirestore.instance.collection('pgheader').add({
      'pgImage': widget.ownerPgData['imageUrl'] ?? '',
      'pgName': widget.ownerPgData['pgName'] ?? '',
      'pgAddress': widget.ownerPgData['pgAddress'] ?? '',
      'pgLocation': widget.ownerPgData['pgLocation'] ?? '',
      'createdAt': FieldValue.serverTimestamp(),
    });

    // 🔹 Then loop through rooms and save each
    for (var room in roomFields) {
      final roomNo = room['controller'].text.trim();
      final sharing = room['sharing'];
      final bedcount = int.tryParse(sharing.toString()) ?? 0;

      final fullData = {
        ...widget.ownerPgData,
        'roomNo': roomNo,
        'sharing': sharing,
        'bedcount': bedcount,
        'timestamp': FieldValue.serverTimestamp(),
      };

      await FirebaseFirestore.instance
          .collection('pgandownerdetails')
          .add(fullData);

      await FirebaseFirestore.instance.collection('availableRooms').add({
        'roomNo': roomNo,
        'sharing': sharing,
        'bedcount': bedcount,
        'availability': 'Available',
        'timestamp': FieldValue.serverTimestamp(),
      });
    }

    await FirestoreService().updateTotalBedsCount();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('All details submitted successfully')),
    );
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Add Rooms'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Add Rooms',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ...roomFields.asMap().entries.map((entry) {
              int index = entry.key;
              var room = entry.value;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: CustomTextField(
                        label: 'Room No',
                        controller: room['controller'],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 2,
                      child: DropdownButton<String>(
                        value: room['sharing'],
                        isExpanded: true,
                        items: ['1', '2', '3', '4']
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text('$e Sharing'),
                              ),
                            )
                            .toList(),
                        onChanged: (val) {
                          setState(() {
                            roomFields[index]['sharing'] = val!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              );
            }),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: addRoomField,
                icon: const Icon(Icons.add),
                label: const Text('Add Room'),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: submitRooms,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Submit All',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
