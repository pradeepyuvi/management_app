import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../services/firestore_service.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_text_field.dart';

class AddBlocklistPage extends StatefulWidget {
  const AddBlocklistPage({super.key});

  @override
  State<AddBlocklistPage> createState() => _AddBlocklistPageState();
}

class _AddBlocklistPageState extends State<AddBlocklistPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController aadhaarController = TextEditingController();
  final TextEditingController reasonController = TextEditingController();

  bool isNameValid = true;
  bool isAadhaarValid = true;
  bool isReasonValid = true;

  final firestoreService = FirestoreService();

  Future<void> submit() async {
    setState(() {
      isNameValid = nameController.text.trim().isNotEmpty;
      isAadhaarValid = RegExp(
        r"^\d{12}$",
      ).hasMatch(aadhaarController.text.trim());
      isReasonValid = reasonController.text.trim().isNotEmpty;
    });

    if (!isNameValid || !isAadhaarValid || !isReasonValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please fill all mandatory fields correctly. Aadhaar must be 12 digits.',
          ),
        ),
      );
      return;
    }

    await firestoreService.incrementBlocklistCount();
    await firestoreService.addBlocklistEntry(
      name: nameController.text.trim(),
      aadhaar: aadhaarController.text.trim(),
      reason: reasonController.text.trim(),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Add Blocklist'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              label: 'Reason',
              controller: reasonController,
              borderColor: isReasonValid ? null : Colors.red,
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    textStyle: TextStyle(fontSize: 15.sp),
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
// import '../services/firestore_service.dart';
// import '../widgets/custom_app_bar.dart';
// import '../widgets/custom_text_field.dart';

// class AddBlocklistPage extends StatelessWidget {
//   const AddBlocklistPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController nameController = TextEditingController();
//     final TextEditingController aadhaarController = TextEditingController();
//     final TextEditingController reasonController = TextEditingController();

//     final firestoreService = FirestoreService();

//     Future<void> submit() async {
//       await firestoreService.incrementBlocklistCount();

//       await firestoreService.addBlocklistEntry(
//         name: nameController.text.trim(),
//         aadhaar: aadhaarController.text.trim(),
//         reason: reasonController.text.trim(),
//       );
//       Navigator.pop(context);
//     }

//     return Scaffold(
//       appBar: const CustomAppBar(title: 'Add Blocklist'),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CustomTextField(label: 'Name', controller: nameController),
//             SizedBox(height: 2.h),
//             CustomTextField(
//               label: 'Aadhaar',
//               controller: aadhaarController,
//               keyboardType: TextInputType.number,
//             ),
//             SizedBox(height: 2.h),
//             CustomTextField(label: 'Reason', controller: reasonController),
//             SizedBox(height: 3.h),
//             Align(
//               alignment: Alignment.center,
//               child: SizedBox(
//                 width: 40.w, // Smaller width for compact button
//                 height: 5.h, // Reduced height
//                 child: ElevatedButton(
//                   onPressed: submit,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.teal,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     textStyle: TextStyle(fontSize: 15.sp),
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
