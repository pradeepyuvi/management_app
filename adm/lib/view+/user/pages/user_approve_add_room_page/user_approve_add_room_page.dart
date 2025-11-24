import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// Model to hold one room row
class RoomField {
  final TextEditingController controller;
  String sharing;

  RoomField({required this.controller, this.sharing = "1"});
}

/// ------------------ STATELESS PAGE ------------------
class UserApproveAddRoomsPage extends StatelessWidget {
  UserApproveAddRoomsPage({super.key});

  // ValueNotifier holds dynamic list
  final ValueNotifier<List<RoomField>> roomFieldsNotifier =
      ValueNotifier<List<RoomField>>([
        RoomField(controller: TextEditingController(), sharing: "1"),
      ]);

  /// Add room
  void addRoomField() {
    roomFieldsNotifier.value = [
      ...roomFieldsNotifier.value,
      RoomField(controller: TextEditingController(), sharing: "1"),
    ];
  }

  /// Submit UI only
  void submitUiOnly(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('UI only: Approve Rooms Submit tapped')),
    );
  }

  /// Dispose all controllers
  void disposeAll() {
    for (final r in roomFieldsNotifier.value) {
      r.controller.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Dispose controllers when page is removed from widget tree
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
          'Approve Rooms',
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// CARD
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
                    /// Title Row
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

                    /// DYNAMIC ROOM LIST
                    ValueListenableBuilder<List<RoomField>>(
                      valueListenable: roomFieldsNotifier,
                      builder: (context, roomFields, _) {
                        return Column(
                          children: roomFields.asMap().entries.map((entry) {
                            int index = entry.key;
                            RoomField room = entry.value;

                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 1.h),
                              child: Row(
                                children: [
                                  /// Room No
                                  Expanded(
                                    flex: 2,
                                    child: TextFormField(
                                      controller: room.controller,
                                      decoration: InputDecoration(
                                        labelText: 'Room No',
                                        suffixIcon: const Icon(
                                          Icons.edit,
                                          size: 18,
                                        ),
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

                                  /// Sharing Dropdown
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 2.w,
                                        vertical: 0.5.h,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: Colors.grey.shade400,
                                        ),
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
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
                                                room.sharing = val!;
                                                roomFieldsNotifier
                                                    .notifyListeners();
                                              },
                                            ),
                                          ),
                                          const Icon(Icons.edit, size: 18),
                                        ],
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

                    /// ADD ROOM BUTTON
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

            /// SUBMIT BUTTON
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
