import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PGHeader extends StatefulWidget {
  const PGHeader({super.key});

  @override
  State<PGHeader> createState() => _PGHeaderState();
}

class _PGHeaderState extends State<PGHeader> {
  String? pgImage;
  String? pgName;
  String? pgAddress;
  String? pgLocation;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), fetchPGHeader);
  }

  Future<void> fetchPGHeader() async {
    setState(() {
      isLoading = true;
    });

    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('pgheader')
          .orderBy('createdAt', descending: true)
          .limit(1)
          .get(const GetOptions(source: Source.server));

      if (snapshot.docs.isNotEmpty) {
        final data = snapshot.docs.first.data();
        debugPrint('Fetched PG Header: $data');

        setState(() {
          pgImage = data['pgImage'] ?? '';
          pgName = data['pgName'] ?? '';
          pgAddress = data['pgAddress'] ?? '';
          pgLocation = data['pgLocation'] ?? '';
          isLoading = false;
        });
      } else {
        debugPrint('No PG header documents found.');
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      debugPrint('Error fetching PG header: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: fetchPGHeader,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 8),
          child: Center(
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 40,
              ), // Increased spacing
              width: double.infinity,
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : (pgName?.isEmpty ?? true) &&
                        (pgAddress?.isEmpty ?? true) &&
                        (pgLocation?.isEmpty ?? true)
                  ? const Center(child: Text('No PG header data available.'))
                  : Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0.9),
                            Colors.grey.shade200,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 12,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 8,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: CircleAvatar(
                                    radius: 45,
                                    backgroundImage:
                                        (pgImage != null && pgImage!.isNotEmpty)
                                        ? NetworkImage(pgImage!)
                                        : const AssetImage(
                                                'lib/assets/images/pg.png',
                                              )
                                              as ImageProvider,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  pgName ?? 'PG Name',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  pgAddress ?? 'PG Address',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                GestureDetector(
                                  onTap: () {
                                    // TODO: Implement map link navigation
                                  },
                                  child: Text(
                                    pgLocation ?? 'PG Location',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.blueAccent,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class PGHeader extends StatefulWidget {
//   const PGHeader({super.key});

//   @override
//   State<PGHeader> createState() => _PGHeaderState();
// }

// class _PGHeaderState extends State<PGHeader> {
//   String? pgImage;
//   String? pgName;
//   String? pgAddress;
//   String? pgLocation;
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(const Duration(milliseconds: 300), fetchPGHeader);
//   }

//   Future<void> fetchPGHeader() async {
//     setState(() {
//       isLoading = true;
//     });

//     try {
//       final snapshot = await FirebaseFirestore.instance
//           .collection('pgheader')
//           .orderBy('createdAt', descending: true)
//           .limit(1)
//           .get(const GetOptions(source: Source.server));

//       if (snapshot.docs.isNotEmpty) {
//         final data = snapshot.docs.first.data();
//         debugPrint('Fetched PG Header: $data');

//         setState(() {
//           pgImage = data['pgImage'] ?? '';
//           pgName = data['pgName'] ?? '';
//           pgAddress = data['pgAddress'] ?? '';
//           pgLocation = data['pgLocation'] ?? '';
//           isLoading = false;
//         });
//       } else {
//         debugPrint('No PG header documents found.');
//         setState(() {
//           isLoading = false;
//         });
//       }
//     } catch (e) {
//       debugPrint('Error fetching PG header: $e');
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return RefreshIndicator(
//       onRefresh: fetchPGHeader,
//       child: SingleChildScrollView(
//         physics: const AlwaysScrollableScrollPhysics(),
//         child: Padding(
//           padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 8),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12),
//             child: Container(
//               width: double.infinity,
//               child: isLoading
//                   ? const Center(child: CircularProgressIndicator())
//                   : (pgName?.isEmpty ?? true) &&
//                         (pgAddress?.isEmpty ?? true) &&
//                         (pgLocation?.isEmpty ?? true)
//                   ? const Center(child: Text('No PG header data available.'))
//                   : Container(
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           colors: [Colors.white, Colors.grey.shade100],
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                         ),
//                         borderRadius: BorderRadius.circular(12),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black12,
//                             blurRadius: 10,
//                             offset: Offset(0, 4),
//                           ),
//                         ],
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(16),
//                         child: Column(
//                           children: [
//                             CircleAvatar(
//                               radius: 40,
//                               backgroundImage:
//                                   (pgImage != null && pgImage!.isNotEmpty)
//                                   ? NetworkImage(pgImage!)
//                                   : const AssetImage('lib/assets/images/pg.png')
//                                         as ImageProvider,
//                             ),
//                             const SizedBox(height: 12),
//                             Text(
//                               pgName ?? 'PG Name',
//                               style: const TextStyle(
//                                 fontSize: 24, // Increased font size
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             const SizedBox(height: 6),
//                             Text(
//                               pgAddress ?? 'PG Address',
//                               textAlign: TextAlign.center,
//                               style: const TextStyle(
//                                 fontSize: 14,
//                                 color: Color.fromARGB(255, 24, 23, 23),
//                               ),
//                             ),
//                             const SizedBox(height: 4),
//                             GestureDetector(
//                               onTap: () {
//                                 // TODO: Implement map link navigation
//                               },
//                               child: Text(
//                                 pgLocation ?? 'PG Location',
//                                 style: const TextStyle(
//                                   fontSize: 14,
//                                   color: Colors.blue,
//                                   decoration: TextDecoration.underline,
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 16),
//                           ],
//                         ),
//                       ),
//                     ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class PGHeader extends StatefulWidget {
//   const PGHeader({super.key});

//   @override
//   State<PGHeader> createState() => _PGHeaderState();
// }

// class _PGHeaderState extends State<PGHeader> {
//   String? pgImage;
//   String? pgName;
//   String? pgAddress;
//   String? pgLocation;
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(const Duration(milliseconds: 300), fetchPGHeader);
//   }

//   Future<void> fetchPGHeader() async {
//     setState(() {
//       isLoading = true;
//     });

//     try {
//       final snapshot = await FirebaseFirestore.instance
//           .collection('pgheader')
//           .orderBy('createdAt', descending: true)
//           .limit(1)
//           .get(const GetOptions(source: Source.server)); // Force server fetch

//       if (snapshot.docs.isNotEmpty) {
//         final data = snapshot.docs.first.data();
//         debugPrint('Fetched PG Header: $data');

//         setState(() {
//           pgImage = data['pgImage'] ?? '';
//           pgName = data['pgName'] ?? '';
//           pgAddress = data['pgAddress'] ?? '';
//           pgLocation = data['pgLocation'] ?? '';
//           isLoading = false;
//         });
//       } else {
//         debugPrint('No PG header documents found.');
//         setState(() {
//           isLoading = false;
//         });
//       }
//     } catch (e) {
//       debugPrint('Error fetching PG header: $e');
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return RefreshIndicator(
//       onRefresh: fetchPGHeader,
//       child: SingleChildScrollView(
//         physics: const AlwaysScrollableScrollPhysics(),
//         child: Padding(
//           padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 8),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12),
//             child: Container(
//               width: double.infinity,
//               child: isLoading
//                   ? const Center(child: CircularProgressIndicator())
//                   : (pgName?.isEmpty ?? true) &&
//                         (pgAddress?.isEmpty ?? true) &&
//                         (pgLocation?.isEmpty ?? true)
//                   ? const Center(child: Text('No PG header data available.'))
//                   : Card(
//                       elevation: 4,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(16),
//                         child: Column(
//                           children: [
//                             CircleAvatar(
//                               radius: 40,
//                               backgroundImage:
//                                   (pgImage != null && pgImage!.isNotEmpty)
//                                   ? NetworkImage(pgImage!)
//                                   : const AssetImage('lib/assets/images/pg.png')
//                                         as ImageProvider,
//                             ),
//                             const SizedBox(height: 8),
//                             Text(
//                               pgName ?? 'PG Name',
//                               style: const TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             const SizedBox(height: 4),
//                             Text(
//                               pgAddress ?? 'PG Address',
//                               textAlign: TextAlign.center,
//                               style: const TextStyle(
//                                 color: Color.fromARGB(255, 24, 23, 23),
//                               ),
//                             ),
//                             const SizedBox(height: 4),
//                             GestureDetector(
//                               onTap: () {
//                                 // TODO: Implement map link navigation
//                               },
//                               child: Text(
//                                 pgLocation ?? 'PG Location',
//                                 style: const TextStyle(
//                                   color: Colors.blue,
//                                   decoration: TextDecoration.underline,
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 16),
//                           ],
//                         ),
//                       ),
//                     ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
