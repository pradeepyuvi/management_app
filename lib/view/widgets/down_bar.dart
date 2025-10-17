import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DownBar extends StatelessWidget {
  const DownBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // <-- This will handle notches and gesture areas
      top: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(color: Colors.grey.shade300, thickness: 1),
          BottomAppBar(
            elevation: 0,
            color: Colors.white,
            child: SizedBox(
              height: 7.h, // slightly reduced
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "lib/view/assets/images/logo.png",
                    height: 4.h,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 0.3.h),
                  Text(
                    "Home",
                    style: TextStyle(fontSize: 12.sp, color: Colors.black87),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';

// class DownBar extends StatelessWidget {
//   const DownBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       // <-- This will handle notches and gesture areas
//       top: false,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Divider(color: Colors.grey.shade300, thickness: 1),
//           BottomAppBar(
//             elevation: 0,
//             color: Colors.white,
//             child: SizedBox(
//               height: 7.h, // slightly reduced
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     "lib/view/assets/images/logo.png",
//                     height: 4.h,
//                     fit: BoxFit.contain,
//                   ),
//                   SizedBox(height: 0.3.h),
//                   Text(
//                     "Home",
//                     style: TextStyle(fontSize: 12.sp, color: Colors.black87),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';

// class DownBar extends StatelessWidget {
//   const DownBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Divider(color: Colors.grey.shade300, thickness: 1),
//         BottomAppBar(
//           elevation: 0,
//           color: Colors.white,
//           child: SizedBox(
//             height: 8.h, // adjust bar height
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset(
//                   "lib/view/assets/images/logo.png", // <-- Replace with your logo path
//                   height: 4.h,
//                   fit: BoxFit.contain,
//                 ),
//                 SizedBox(height: 0.5.h),
//                 Text(
//                   "Home",
//                   style: TextStyle(fontSize: 13.sp, color: Colors.black87),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
