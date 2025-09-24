import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_text_field.dart';
import 'add_rooms_page.dart';

class PgOwnerDetailsPage extends StatefulWidget {
  const PgOwnerDetailsPage({super.key});

  @override
  State<PgOwnerDetailsPage> createState() => _PgOwnerDetailsPageState();
}

class _PgOwnerDetailsPageState extends State<PgOwnerDetailsPage> {
  final ownerNameController = TextEditingController();
  final ownerAadhaarController = TextEditingController();
  final ownerMobileController = TextEditingController();
  final ownerAddressController = TextEditingController();
  final pgNameController = TextEditingController();
  final pgLocationController = TextEditingController();
  final pgAddressController = TextEditingController();
  final roomNoController = TextEditingController();

  String sharingType = '1';
  final checkInDateNotifier = ValueNotifier<DateTime?>(null);
  String? imageUrl;

  Future<void> pickImage() async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Image picker not implemented')),
    );
  }

  void goToAddRoomsPage() {
    final ownerPgData = {
      'ownerName': ownerNameController.text.trim(),
      'ownerAadhaar': ownerAadhaarController.text.trim(),
      'ownerMobile': ownerMobileController.text.trim(),
      'ownerAddress': ownerAddressController.text.trim(),
      'pgName': pgNameController.text.trim(),
      'pgLocation': pgLocationController.text.trim(),
      'pgAddress': pgAddressController.text.trim(),
      'checkIn': checkInDateNotifier.value?.toIso8601String() ?? '',
      'imageUrl': imageUrl ?? '',
      'createdAt': DateTime.now().toIso8601String(),
    };

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddRoomsPage(ownerPgData: ownerPgData),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'PG & Owner Details'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Owner Info",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 2.h),
            CustomTextField(
              label: 'Owner Name',
              controller: ownerNameController,
            ),
            SizedBox(height: 2.h),
            CustomTextField(
              label: 'Owner Aadhaar',
              controller: ownerAadhaarController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 2.h),
            CustomTextField(
              label: 'Owner Mobile',
              controller: ownerMobileController,
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 2.h),
            CustomTextField(
              label: 'Owner Address',
              controller: ownerAddressController,
            ),
            SizedBox(height: 2.h),
            ElevatedButton.icon(
              onPressed: pickImage,
              icon: const Icon(Icons.photo_camera),
              label: const Text('Upload Owner Photo'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
            ),
            SizedBox(height: 3.h),
            Text(
              "PG Info",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 2.h),
            CustomTextField(label: 'PG Name', controller: pgNameController),
            SizedBox(height: 2.h),
            CustomTextField(
              label: 'PG Location',
              controller: pgLocationController,
            ),
            SizedBox(height: 2.h),
            CustomTextField(
              label: 'PG Address',
              controller: pgAddressController,
            ),
            SizedBox(height: 2.h),
            ElevatedButton.icon(
              onPressed: pickImage,
              icon: const Icon(Icons.photo_camera),
              label: const Text('Upload PG Photo'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
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
                  onPressed: goToAddRoomsPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    textStyle: TextStyle(fontSize: 15.sp),
                  ),
                  child: const Text(
                    "Next",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
