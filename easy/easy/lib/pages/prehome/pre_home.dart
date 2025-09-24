// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../widgets/custom_text_field.dart';
// import '../pg/pg_owner_details_page.dart';
// import '../home/home_screen.dart';

// class PreHomePage extends StatefulWidget {
//   const PreHomePage({super.key});

//   @override
//   State<PreHomePage> createState() => _PreHomePageState();
// }

// class _PreHomePageState extends State<PreHomePage> {
//   final usernameController = TextEditingController();
//   final passwordController = TextEditingController();

//   Future<void> login() async {
//     final username = usernameController.text.trim();
//     final password = passwordController.text.trim();

//     if (username.isEmpty || password.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please enter username and password')),
//       );
//       return;
//     }

//     final doc = await FirebaseFirestore.instance
//         .collection('users')
//         .doc(username)
//         .get();
//     if (doc.exists) {
//       final data = doc.data();
//       if (data != null && data['password'] == password) {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => HomeScreen(username: username),
//           ),
//         );
//       } else {
//         ScaffoldMessenger.of(
//           context,
//         ).showSnackBar(const SnackBar(content: Text('Incorrect password')));
//       }
//     } else {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(const SnackBar(content: Text('User not found')));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('PG Management'),
//         backgroundColor: Colors.teal,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Login or Create account',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//             CustomTextField(label: 'Username', controller: usernameController),
//             const SizedBox(height: 16),
//             CustomTextField(
//               label: 'Password',
//               controller: passwordController,
//               obscureText: true,
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: login,
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
//               child: const Text('Login'),
//             ),
//             const SizedBox(height: 32),
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const PgOwnerDetailsPage(),
//                   ),
//                 );
//               },
//               child: Container(
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Colors.teal.shade100,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Row(
//                   children: const [
//                     Icon(Icons.home, size: 32, color: Colors.teal),
//                     SizedBox(width: 16),
//                     Text(
//                       'Create Account',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import '../pg/pg_owner_details_page.dart';

// class PreHomePage extends StatelessWidget {
//   const PreHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('PG Management'),
//         backgroundColor: Colors.teal,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Login or Create account',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const PgOwnerDetailsPage(),
//                   ),
//                 );
//               },
//               child: Container(
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Colors.teal.shade100,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Row(
//                   children: const [
//                     Icon(Icons.home, size: 32, color: Colors.teal),
//                     SizedBox(width: 16),
//                     Text(
//                       'Create Account',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
