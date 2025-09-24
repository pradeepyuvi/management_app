import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_text_field.dart';
import '../services/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddCustomerDetailsPage extends StatefulWidget {
  const AddCustomerDetailsPage({super.key});

  @override
  State<AddCustomerDetailsPage> createState() => _AddCustomerDetailsPageState();
}

class _AddCustomerDetailsPageState extends State<AddCustomerDetailsPage> {
  final nameController = TextEditingController();
  final aadhaarController = TextEditingController();
  final mobileController = TextEditingController();
  final addressController = TextEditingController();
  final roomNoController = TextEditingController();
  final genderNotifier = ValueNotifier<String>('');
  final sharingNotifier = ValueNotifier<String>('');
  final checkInDateNotifier = ValueNotifier<DateTime?>(null);
  String? imageUrl;
  final firestoreService = FirestoreService();

  bool isNameValid = true;
  bool isAadhaarValid = true;
  // bool isMobileValid = true;
  bool isAddressValid = true;
  bool isGenderValid = true;
  // bool isImageValid = true;
  bool isRoomNoValid = true;
  bool isSharingValid = true;
  bool isCheckInValid = true;

  Future<void> submit() async {
    setState(() {
      isNameValid =
          nameController.text.trim().isNotEmpty &&
          RegExp(r"^[a-zA-Z ]+$").hasMatch(nameController.text.trim());
      isAadhaarValid = RegExp(
        r"^\d{12}$",
      ).hasMatch(aadhaarController.text.trim());
      // isMobileValid = RegExp(
      //   r"^\d{10}$",
      // ).hasMatch(aadhaarController.text.trim());
      isAddressValid = addressController.text.trim().isNotEmpty;
      isGenderValid = genderNotifier.value.isNotEmpty;
      // isImageValid = imageUrl != null && imageUrl!.isNotEmpty;
      isRoomNoValid = RegExp(
        r"^[0-9]+$",
      ).hasMatch(roomNoController.text.trim());
      isSharingValid = sharingNotifier.value.isNotEmpty;
      isCheckInValid = checkInDateNotifier.value != null;
    });

    // ✅ Then check if any field is invalid
    if (!isNameValid ||
        !isAadhaarValid ||
        // !isMobileValid ||
        !isAddressValid ||
        !isGenderValid ||
        // !isImageValid ||
        !isRoomNoValid ||
        !isSharingValid ||
        !isCheckInValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all mandatory fields correctly'),
        ),
      );
      return;
    }

    // 🔒 Mandatory field validation
    if (nameController.text.trim().isEmpty ||
        aadhaarController.text.trim().isEmpty ||
        // mobileController.text.trim().isEmpty ||
        addressController.text.trim().isEmpty ||
        genderNotifier.value.isEmpty ||
        // imageUrl == null ||
        // imageUrl!.isEmpty ||
        roomNoController.text.trim().isEmpty ||
        sharingNotifier.value.isEmpty ||
        checkInDateNotifier.value == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all mandatory fields')),
      );
      return;
    }

    // 🔠 Format validations
    if (!RegExp(r"^[a-zA-Z ]+$").hasMatch(nameController.text.trim())) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Name must contain only letters')),
      );
      return;
    }

    if (!RegExp(r"^[0-9]{12}$").hasMatch(aadhaarController.text.trim())) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Aadhaar must be a 12-digit number')),
      );
      return;
    }

    // if (!RegExp(r"^[0-9]{10}$").hasMatch(mobileController.text.trim())) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(content: Text('Mobile must be a 10-digit number')),
    //   );
    //   return;
    // }

    if (!RegExp(r"^[0-9]+$").hasMatch(roomNoController.text.trim())) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Room No must be numeric')));
      return;
    }

    // ✅ Existing logic (unchanged)
    final customerData = {
      'name': nameController.text.trim(),
      'aadhaar': aadhaarController.text.trim(),
      'mobile': mobileController.text.trim(),
      'address': addressController.text.trim(),
      'gender': genderNotifier.value,
      'roomNo': roomNoController.text.trim(),
      'sharing': sharingNotifier.value,
      'checkIn': checkInDateNotifier.value?.toIso8601String() ?? '',
      'checkOut': null,
      'imageUrl': imageUrl ?? '',
      'createdAt': FieldValue.serverTimestamp(),
    };

    await FirebaseFirestore.instance
        .collection('customerDetails')
        .add(customerData);

    await FirebaseFirestore.instance.collection('paymentsPage').add({
      ...customerData,
      'paymentStatus': 'not paid',
    });

    await FirebaseFirestore.instance
        .collection('recentCheckOuts')
        .add(customerData);

    await firestoreService.updateCustomerCount();
    await FirestoreService().updateUnpaidCustomerCount();
    await FirestoreService().updateTotalBedsCount();

    final now = DateTime.now();
    final year = now.year.toString();
    final month = now.month.toString().padLeft(2, '0');
    final analyticsRef = FirebaseFirestore.instance
        .collection('analytics')
        .doc('$year-$month');
    await analyticsRef.set({
      'year': year,
      'month': month,
      'count': FieldValue.increment(1),
    }, SetOptions(merge: true));

    final roomNo = roomNoController.text.trim();
    final roomQuery = await FirebaseFirestore.instance
        .collection('availableRooms')
        .where('roomNo', isEqualTo: roomNo)
        .limit(1)
        .get();

    if (roomQuery.docs.isNotEmpty) {
      final doc = roomQuery.docs.first;
      final currentBedCount = int.tryParse(doc['bedcount'].toString()) ?? 0;
      final updatedBedCount = currentBedCount > 0 ? currentBedCount - 1 : 0;

      await doc.reference.update({'bedcount': updatedBedCount});
      await firestoreService.updateTotalBedsCount();
    }

    Navigator.pop(context);
  }

  Future<void> pickImage() async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Image picker not implemented')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Add Customer Details'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Customer Info",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 2.h),
            CustomTextField(
              label: 'Name',
              controller: nameController,
              borderColor: isNameValid ? null : Colors.red,
            ),
            SizedBox(height: 2.h),
            CustomTextField(
              label: 'Aadhaar',
              controller: aadhaarController,
              keyboardType: TextInputType.number,
              borderColor: isAadhaarValid ? null : Colors.red,
            ),
            SizedBox(height: 2.h),
            CustomTextField(
              label: 'Mobile',
              controller: mobileController,
              keyboardType: TextInputType.phone,
              // borderColor: isMobileValid ? null : Colors.red,
            ),
            SizedBox(height: 2.h),
            CustomTextField(
              label: 'Address',
              controller: addressController,
              borderColor: isNameValid ? null : Colors.red,
            ),
            SizedBox(height: 2.h),
            ValueListenableBuilder<String>(
              valueListenable: genderNotifier,
              builder: (_, value, __) => DropdownButtonFormField<String>(
                initialValue: value.isEmpty ? null : value,
                decoration: const InputDecoration(labelText: 'Gender'),
                items: ['Male', 'Female', 'Other']
                    .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                    .toList(),
                onChanged: (val) => genderNotifier.value = val ?? '',
              ),
            ),
            SizedBox(height: 2.h),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: pickImage,
                  icon: const Icon(Icons.photo_camera),
                  label: const Text('Upload Photo'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                ),
                SizedBox(width: 2.w),
                if (imageUrl != null && imageUrl!.isNotEmpty)
                  const Icon(Icons.check_circle, color: Colors.green)
                else
                  const SizedBox(),
              ],
            ),
            SizedBox(height: 3.h),
            Text(
              "Room Info",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 2.h),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    label: 'Room No',
                    controller: roomNoController,
                    keyboardType: TextInputType.text,
                    borderColor: isNameValid ? null : Colors.red,
                  ),
                ),
                SizedBox(width: 4.w),
                Expanded(
                  child: ValueListenableBuilder<String>(
                    valueListenable: sharingNotifier,
                    builder: (_, value, __) => DropdownButtonFormField<String>(
                      initialValue: value.isEmpty ? null : value,
                      decoration: const InputDecoration(labelText: 'Sharing'),
                      items: ['1', '2', '3', '4']
                          .map(
                            (s) => DropdownMenuItem(value: s, child: Text(s)),
                          )
                          .toList(),
                      onChanged: (val) => sharingNotifier.value = val ?? '',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            ValueListenableBuilder<DateTime?>(
              valueListenable: checkInDateNotifier,
              builder: (_, date, __) => InkWell(
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2023),
                    lastDate: DateTime(2030),
                  );
                  if (picked != null) checkInDateNotifier.value = picked;
                },
                child: InputDecorator(
                  decoration: const InputDecoration(labelText: 'Check-in Date'),
                  child: Text(
                    date == null
                        ? 'Select Date'
                        : '${date.day}/${date.month}/${date.year}',
                  ),
                ),
              ),
            ),
            SizedBox(height: 3.h),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 40.w,
                height: 5.h,
                child: ElevatedButton(
                  onPressed: submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    textStyle: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    elevation: 4,
                  ),
                  child: const Text("Submit"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
// import '../widgets/custom_app_bar.dart';
// import '../widgets/custom_text_field.dart';
// import '../services/firestore_service.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class AddCustomerDetailsPage extends StatefulWidget {
//   const AddCustomerDetailsPage({super.key});

//   @override
//   State<AddCustomerDetailsPage> createState() => _AddCustomerDetailsPageState();
// }

// class _AddCustomerDetailsPageState extends State<AddCustomerDetailsPage> {
//   final nameController = TextEditingController();
//   final aadhaarController = TextEditingController();
//   final mobileController = TextEditingController();
//   final addressController = TextEditingController();
//   final roomNoController = TextEditingController();
//   final genderNotifier = ValueNotifier<String>('');
//   final sharingNotifier = ValueNotifier<String>('');
//   final checkInDateNotifier = ValueNotifier<DateTime?>(null);
//   String? imageUrl;
//   final firestoreService = FirestoreService();

//   Future<void> submit() async {
//     final customerData = {
//       'name': nameController.text.trim(),
//       'aadhaar': aadhaarController.text.trim(),
//       'mobile': mobileController.text.trim(),
//       'address': addressController.text.trim(),
//       'gender': genderNotifier.value,
//       'roomNo': roomNoController.text.trim(),
//       'sharing': sharingNotifier.value,
//       'checkIn': checkInDateNotifier.value?.toIso8601String() ?? '',
//       'checkOut': null,
//       'imageUrl': imageUrl ?? '',
//       'createdAt': FieldValue.serverTimestamp(),
//     };

//     // Add to customer-related collections
//     await FirebaseFirestore.instance
//         .collection('customerDetails')
//         .add(customerData);

//     await FirebaseFirestore.instance.collection('paymentsPage').add({
//       ...customerData,
//       'paymentStatus': 'not paid',
//     });

//     await FirebaseFirestore.instance
//         .collection('recentCheckOuts')
//         .add(customerData);

//     await firestoreService.updateCustomerCount();
//     await FirestoreService().updateUnpaidCustomerCount();

//     await FirestoreService().updateTotalBedsCount();

//     // 🔥 Add to analytics collection
//     final now = DateTime.now();
//     final year = now.year.toString();
//     final month = now.month.toString().padLeft(2, '0');
//     final analyticsRef = FirebaseFirestore.instance
//         .collection('analytics')
//         .doc('$year-$month');
//     await analyticsRef.set({
//       'year': year,
//       'month': month,
//       'count': FieldValue.increment(1),
//     }, SetOptions(merge: true));

//     // 🛏️ Reduce bedcount in availableRooms
//     final roomNo = roomNoController.text.trim();
//     final roomQuery = await FirebaseFirestore.instance
//         .collection('availableRooms')
//         .where('roomNo', isEqualTo: roomNo)
//         .limit(1)
//         .get();

//     if (roomQuery.docs.isNotEmpty) {
//       final doc = roomQuery.docs.first;
//       final currentBedCount = int.tryParse(doc['bedcount'].toString()) ?? 0;
//       final updatedBedCount = currentBedCount > 0 ? currentBedCount - 1 : 0;

//       await doc.reference.update({'bedcount': updatedBedCount});
//       await firestoreService.updateTotalBedsCount();
//     }

//     Navigator.pop(context);
//   }

//   Future<void> pickImage() async {
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('Image picker not implemented')),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const CustomAppBar(title: 'Add Customer Details'),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Customer Info",
//               style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 2.h),
//             CustomTextField(label: 'Name', controller: nameController),
//             SizedBox(height: 2.h),
//             CustomTextField(
//               label: 'Aadhaar',
//               controller: aadhaarController,
//               keyboardType: TextInputType.number,
//             ),
//             SizedBox(height: 2.h),
//             CustomTextField(
//               label: 'Mobile',
//               controller: mobileController,
//               keyboardType: TextInputType.phone,
//             ),
//             SizedBox(height: 2.h),
//             CustomTextField(label: 'Address', controller: addressController),
//             SizedBox(height: 2.h),
//             ValueListenableBuilder<String>(
//               valueListenable: genderNotifier,
//               builder: (_, value, __) => DropdownButtonFormField<String>(
//                 initialValue: value.isEmpty ? null : value,
//                 decoration: const InputDecoration(labelText: 'Gender'),
//                 items: ['Male', 'Female', 'Other']
//                     .map((g) => DropdownMenuItem(value: g, child: Text(g)))
//                     .toList(),
//                 onChanged: (val) => genderNotifier.value = val ?? '',
//               ),
//             ),
//             SizedBox(height: 2.h),
//             Row(
//               children: [
//                 ElevatedButton.icon(
//                   onPressed: pickImage,
//                   icon: const Icon(Icons.photo_camera),
//                   label: const Text('Upload Photo'),
//                   style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
//                 ),
//                 SizedBox(width: 2.w),
//                 if (imageUrl != null && imageUrl!.isNotEmpty)
//                   const Icon(Icons.check_circle, color: Colors.green)
//                 else
//                   const SizedBox(),
//               ],
//             ),
//             SizedBox(height: 3.h),
//             Text(
//               "Room Info",
//               style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 2.h),
//             Row(
//               children: [
//                 Expanded(
//                   child: CustomTextField(
//                     label: 'Room No',
//                     controller: roomNoController,
//                     keyboardType: TextInputType.text,
//                   ),
//                 ),
//                 SizedBox(width: 4.w),
//                 Expanded(
//                   child: ValueListenableBuilder<String>(
//                     valueListenable: sharingNotifier,
//                     builder: (_, value, __) => DropdownButtonFormField<String>(
//                       initialValue: value.isEmpty ? null : value,
//                       decoration: const InputDecoration(labelText: 'Sharing'),
//                       items: ['1', '2', '3', '4']
//                           .map(
//                             (s) => DropdownMenuItem(value: s, child: Text(s)),
//                           )
//                           .toList(),
//                       onChanged: (val) => sharingNotifier.value = val ?? '',
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 2.h),
//             ValueListenableBuilder<DateTime?>(
//               valueListenable: checkInDateNotifier,
//               builder: (_, date, __) => InkWell(
//                 onTap: () async {
//                   final picked = await showDatePicker(
//                     context: context,
//                     initialDate: DateTime.now(),
//                     firstDate: DateTime(2023),
//                     lastDate: DateTime(2030),
//                   );
//                   if (picked != null) checkInDateNotifier.value = picked;
//                 },
//                 child: InputDecorator(
//                   decoration: const InputDecoration(labelText: 'Check-in Date'),
//                   child: Text(
//                     date == null
//                         ? 'Select Date'
//                         : '${date.day}/${date.month}/${date.year}',
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 3.h),
//             Align(
//               alignment: Alignment.center,
//               child: SizedBox(
//                 width: 40.w,
//                 height: 5.h,
//                 child: ElevatedButton(
//                   onPressed: submit,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.teal,
//                     foregroundColor: Colors.white,
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 32,
//                       vertical: 14,
//                     ),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     textStyle: TextStyle(
//                       fontSize: 15.sp,
//                       fontWeight: FontWeight.w600,
//                     ),
//                     elevation: 4,
//                   ),
//                   child: const Text("Submit"),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
