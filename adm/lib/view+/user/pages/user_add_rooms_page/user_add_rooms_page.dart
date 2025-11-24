import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// Simple model for one room row
class UserRoomField {
  final TextEditingController controller;
  String sharing;

  UserRoomField({required this.controller, this.sharing = '1'});
}

class UserAddRoomsPage extends StatelessWidget {
  UserAddRoomsPage({super.key});

  // Holds all dynamic room rows
  final ValueNotifier<List<UserRoomField>> roomFieldsNotifier =
      ValueNotifier<List<UserRoomField>>([
        UserRoomField(controller: TextEditingController(), sharing: '1'),
      ]);

  /// Add a new room row
  void addRoomField() {
    roomFieldsNotifier.value = [
      ...roomFieldsNotifier.value,
      UserRoomField(controller: TextEditingController(), sharing: '1'),
    ];
  }

  /// Dispose controllers when leaving page
  void disposeAll() {
    for (final room in roomFieldsNotifier.value) {
      room.controller.dispose();
    }
  }

  void submitUiOnly(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('UI only: Submit All tapped')));
  }

  @override
  Widget build(BuildContext context) {
    // Dispose when page is popped
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ModalRoute.of(context)?.addScopedWillPopCallback(() async {
        disposeAll();
        return true;
      });
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'Add Rooms',
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              color: Colors.grey.shade100,
              child: Padding(
                padding: EdgeInsets.all(3.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header row like Add PG
                    Row(
                      children: [
                        Icon(
                          Icons.meeting_room_rounded,
                          size: 22.sp,
                          color: Colors.teal.shade800,
                        ),
                        SizedBox(width: 2.w),
                        Text(
                          "Room Details",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.teal.shade700,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 3.h,
                      thickness: 1,
                      color: Colors.grey.shade300,
                    ),
                    SizedBox(height: 1.h),

                    // 🔹 Dynamic room rows via ValueListenableBuilder
                    ValueListenableBuilder<List<UserRoomField>>(
                      valueListenable: roomFieldsNotifier,
                      builder: (context, roomFields, _) {
                        return Column(
                          children: roomFields.asMap().entries.map((entry) {
                            final index = entry.key;
                            final room = entry.value;

                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 1.h),
                              child: Row(
                                children: [
                                  // Room No
                                  Expanded(
                                    flex: 2,
                                    child: TextFormField(
                                      controller: room.controller,
                                      decoration: InputDecoration(
                                        labelText: 'Room No',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 3.w),

                                  // Sharing dropdown
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 3.w,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: Colors.grey.shade400,
                                        ),
                                        color: Colors.white,
                                      ),
                                      child: DropdownButton<String>(
                                        value: room.sharing,
                                        isExpanded: true,
                                        underline: const SizedBox(),
                                        items: ['1', '2', '3', '4']
                                            .map(
                                              (e) => DropdownMenuItem(
                                                value: e,
                                                child: Text('$e Sharing'),
                                              ),
                                            )
                                            .toList(),
                                        onChanged: (val) {
                                          if (val == null) return;
                                          room.sharing = val;
                                          roomFieldsNotifier.notifyListeners();
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        );
                      },
                    ),

                    SizedBox(height: 2.h),

                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton.icon(
                        onPressed: addRoomField,
                        icon: const Icon(Icons.add),
                        label: Text(
                          'Add Room',
                          style: TextStyle(fontSize: 11.sp),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 3.h),

            // Submit button like in Add PG
            Center(
              child: SizedBox(
                width: 60.w,
                height: 6.h,
                child: ElevatedButton(
                  onPressed: () => submitUiOnly(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Submit All',
                    style: TextStyle(fontSize: 12.sp, color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 2.h),
          ],
        ),
      ),
    );
  }
}
