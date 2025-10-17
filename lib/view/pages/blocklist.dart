import 'package:flutter/material.dart';

class BlockListPage extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController mobileController;
  final TextEditingController reasonController;

  const BlockListPage({
    super.key,
    required this.nameController,
    required this.mobileController,
    required this.reasonController,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: const Color(0xFFECEFF1),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(
                    190,
                    0,
                    0,
                    0,
                  ), // ✅ Darker background
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  'Add person to Block',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white, // ✅ White text
                  ),
                ),
              ),
              const SizedBox(height: 20),

              SizedBox(
                width: screenWidth * 0.6,
                child: _buildTextField('Add Name', nameController),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: screenWidth * 0.6,
                child: _buildTextField('Add Mobile Number', mobileController),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: screenWidth * 0.6,
                child: _buildTextField('Add Reason to block', reasonController),
              ),
              const SizedBox(height: 20),

              _buildUploadButton('Upload Aadhaar'),
              const SizedBox(height: 12),
              _buildUploadButton('Upload Photo'),
              const SizedBox(height: 30),

              SizedBox(
                width: screenWidth * 0.4,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    String name = nameController.text.trim();
                    String mobile = mobileController.text.trim();
                    String reason = reasonController.text.trim();

                    debugPrint('Name: $name');
                    debugPrint('Mobile: $mobile');
                    debugPrint('Reason: $reason');

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Saved successfully!')),
                    );
                  },
                  child: const Text(
                    'Save',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, TextEditingController controller) {
    return TextField(
      controller: controller,
      keyboardType: hint.contains('Mobile')
          ? TextInputType.number
          : TextInputType.text,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.blue),
        ),
      ),
    );
  }

  Widget _buildUploadButton(String text) {
    return SizedBox(
      width: 200,
      height: 45,
      child: ElevatedButton.icon(
        icon: const Icon(Icons.photo_camera, color: Colors.black87),
        label: Text(text, style: const TextStyle(color: Colors.black87)),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFE0E0E0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 0,
        ),
        onPressed: () {
          // TODO: Add upload logic here
        },
      ),
    );
  }
}








// ==========================
// import 'package:flutter/material.dart';

// class BlockListPage extends StatelessWidget {
//   final TextEditingController nameController;
//   final TextEditingController mobileController;
//   final TextEditingController reasonController;

//   const BlockListPage({
//     super.key,
//     required this.nameController,
//     required this.mobileController,
//     required this.reasonController,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final double screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//               decoration: BoxDecoration(
//                 color: Colors.blue.shade100,
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: const Text(
//                 'Add person to Block',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//               ),
//             ),
//             const SizedBox(height: 20),

//             _buildTextField('Add Name', nameController),
//             const SizedBox(height: 12),
//             _buildTextField('Add Mobile Number', mobileController),
//             const SizedBox(height: 12),
//             _buildTextField('Add Reason to block', reasonController),
//             const SizedBox(height: 20),

//             _buildUploadButton('Upload Aadhaar'),
//             const SizedBox(height: 12),
//             _buildUploadButton('Upload Photo'),
//             const SizedBox(height: 30),

//             SizedBox(
//               width: screenWidth * 0.4,
//               height: 45,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.green,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                 ),
//                 onPressed: () {
//                   String name = nameController.text.trim();
//                   String mobile = mobileController.text.trim();
//                   String reason = reasonController.text.trim();

//                   debugPrint('Name: $name');
//                   debugPrint('Mobile: $mobile');
//                   debugPrint('Reason: $reason');

//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text('Saved successfully!')),
//                   );
//                 },
//                 child: const Text(
//                   'Save',
//                   style: TextStyle(fontSize: 16, color: Colors.white),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       backgroundColor: const Color(0xFFFAFAFA),
//     );
//   }

//   Widget _buildTextField(String hint, TextEditingController controller) {
//     return TextField(
//       controller: controller,
//       keyboardType: hint.contains('Mobile')
//           ? TextInputType.number
//           : TextInputType.text,
//       decoration: InputDecoration(
//         hintText: hint,
//         contentPadding: const EdgeInsets.symmetric(
//           horizontal: 15,
//           vertical: 10,
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: const BorderSide(color: Colors.grey),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: const BorderSide(color: Colors.blue),
//         ),
//       ),
//     );
//   }

//   Widget _buildUploadButton(String text) {
//     return SizedBox(
//       width: 200,
//       height: 45,
//       child: ElevatedButton.icon(
//         icon: const Icon(Icons.photo_camera, color: Colors.black87),
//         label: Text(text, style: const TextStyle(color: Colors.black87)),
//         style: ElevatedButton.styleFrom(
//           backgroundColor: const Color(0xFFE0E0E0),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(30),
//           ),
//           elevation: 0,
//         ),
//         onPressed: () {
//           // Upload logic here
//         },
//       ),
//     );
//   }
// }







































// ----------------------------

// import 'package:flutter/material.dart';

// class BlockListPage extends StatelessWidget {
//   final TextEditingController nameController;
//   final TextEditingController mobileController;
//   final TextEditingController reasonController;

//   const BlockListPage({
//     super.key,
//     required this.nameController,
//     required this.mobileController,
//     required this.reasonController,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final double screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//               decoration: BoxDecoration(
//                 color: Colors.blue.shade100,
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: const Text(
//                 'Add person to Block',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//               ),
//             ),
//             const SizedBox(height: 20),

//             _buildTextField('Add Name', nameController),
//             const SizedBox(height: 12),
//             _buildTextField('Add Mobile Number', mobileController),
//             const SizedBox(height: 12),
//             _buildTextField('Add Reason to block', reasonController),
//             const SizedBox(height: 20),

//             _buildUploadButton('Upload Aadhaar'),
//             const SizedBox(height: 12),
//             _buildUploadButton('Upload Photo'),
//             const SizedBox(height: 30),

//             SizedBox(
//               width: screenWidth * 0.4,
//               height: 45,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.green,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                 ),
//                 onPressed: () {
//                   String name = nameController.text.trim();
//                   String mobile = mobileController.text.trim();
//                   String reason = reasonController.text.trim();

//                   debugPrint('Name: $name');
//                   debugPrint('Mobile: $mobile');
//                   debugPrint('Reason: $reason');

//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text('Saved successfully!')),
//                   );
//                 },
//                 child: const Text(
//                   'Save',
//                   style: TextStyle(fontSize: 16, color: Colors.white),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       backgroundColor: const Color(0xFFFAFAFA),
//     );
//   }

//   Widget _buildTextField(String hint, TextEditingController controller) {
//     return TextField(
//       controller: controller,
//       decoration: InputDecoration(
//         hintText: hint,
//         contentPadding: const EdgeInsets.symmetric(
//           horizontal: 15,
//           vertical: 10,
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: const BorderSide(color: Colors.grey),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: const BorderSide(color: Colors.blue),
//         ),
//       ),
//     );
//   }

//   Widget _buildUploadButton(String text) {
//     return SizedBox(
//       width: 200,
//       height: 45,
//       child: ElevatedButton.icon(
//         icon: const Icon(Icons.photo_camera, color: Colors.black87),
//         label: Text(text, style: const TextStyle(color: Colors.black87)),
//         style: ElevatedButton.styleFrom(
//           backgroundColor: const Color(0xFFE0E0E0),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(30),
//           ),
//           elevation: 0,
//         ),
//         onPressed: () {
//           // Upload logic
//         },
//       ),
//     );
//   }
// }



















// ----------------------------------------


// import 'package:flutter/material.dart';

// class BlockListPage extends StatelessWidget {
//   const BlockListPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final double screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//               decoration: BoxDecoration(
//                 color: Colors.blue.shade100,
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: const Text(
//                 'Add person to Block',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//               ),
//             ),
//             const SizedBox(height: 20),

//             _buildTextField('Add Name'),
//             const SizedBox(height: 12),
//             _buildTextField('Add Mobile Number'),
//             const SizedBox(height: 12),
//             _buildTextField('Add Reason to block'),
//             const SizedBox(height: 20),

//             _buildUploadButton('Upload Aadhaar'),
//             const SizedBox(height: 12),
//             _buildUploadButton('Upload Photo'),
//             const SizedBox(height: 30),

//             SizedBox(
//               width: screenWidth * 0.4,
//               height: 45,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.green,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                 ),
//                 onPressed: () {
//                   // Save logic here
//                 },
//                 child: const Text(
//                   'Save',
//                   style: TextStyle(fontSize: 16, color: Colors.white),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       backgroundColor: const Color(0xFFFAFAFA), // softer white / light grey
//     );
//   }

//   Widget _buildTextField(String hint) {
//     return TextField(
//       decoration: InputDecoration(
//         hintText: hint,
//         contentPadding: const EdgeInsets.symmetric(
//           horizontal: 15,
//           vertical: 10,
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: const BorderSide(color: Colors.grey),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: const BorderSide(color: Colors.blue),
//         ),
//       ),
//     );
//   }

//   Widget _buildUploadButton(String text) {
//     return SizedBox(
//       width: 200,
//       height: 45,
//       child: ElevatedButton.icon(
//         icon: const Icon(Icons.photo_camera, color: Colors.black87),
//         label: Text(text, style: const TextStyle(color: Colors.black87)),
//         style: ElevatedButton.styleFrom(
//           backgroundColor: const Color(0xFFE0E0E0),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(30),
//           ),
//           elevation: 0,
//         ),
//         onPressed: () {
//           // Upload logic
//         },
//       ),
//     );
//   }
// }
