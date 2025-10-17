import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:easypg/view/widgets/custom_app_bar.dart';

class CardPage extends StatelessWidget {
  final String title;
  final Widget child; // Any widget(s) inside the card
  final Widget? bottomBar; // <-- Added

  const CardPage({
    super.key,
    required this.title,
    required this.child,
    this.bottomBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: title, onBack: () => Navigator.pop(context)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(4.w),
        child: Card(
          color: Colors.white,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 2.h),
            child: child,
          ),
        ),
      ),
      bottomNavigationBar: bottomBar, // <-- Added
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
// import 'package:easypg/view/widgets/custom_app_bar.dart';

// class CardPage extends StatelessWidget {
//   final String title;
//   final Widget child; // Any widget(s) inside the card

//   const CardPage({super.key, required this.title, required this.child});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: customAppBar(title: title, onBack: () => Navigator.pop(context)),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(4.w),
//         child: Card(
//           color: Colors.white,
//           elevation: 4,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: Padding(
//             padding: EdgeInsets.symmetric(vertical: 2.h),
//             child: child,
//           ),
//         ),
//       ),
//     );
//   }
// }
