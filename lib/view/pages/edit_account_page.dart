import 'package:flutter/material.dart';
import 'package:easypg/view/widgets/editable_field.dart';
import 'package:easypg/view/widgets/card.dart';
import 'package:easypg/view/widgets/down_bar.dart';

class EditAccountPage extends StatelessWidget {
  const EditAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CardPage(
      title: "Edit Account",
      bottomBar: const DownBar(),
      child: Column(
        children: [
          EditableField(
            label: "Name",
            value: "V Pradeep Reddy",
            onEdit: () {
              // Handle name edit
            },
          ),
          EditableField(
            label: "Email Address",
            value: "pradeepyuvi369@gmail.com",
            onEdit: () {
              // Handle email edit
            },
          ),
          EditableField(
            label: "Phone Number",
            value: "+91 8555870653",
            onEdit: () {
              // Handle phone edit
            },
          ),
        ],
      ), // <-- Added
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
// import 'package:easypg/view/widgets/editable_field.dart';
// import 'package:easypg/view/widgets/card.dart';
// import 'package:easypg/view/widgets/down_bar.dart';

// class EditAccountPage extends StatelessWidget {
//   const EditAccountPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return CardPage(
//       title: "Edit Account",
//       child: Column(
//         children: [
//           EditableField(
//             label: "Name",
//             value: "V Pradeep Reddy",
//             onEdit: () {
//               // Handle name edit
//             },
//           ),
//           EditableField(
//             label: "Email Address",
//             value: "pradeepyuvi369@gmail.com",
//             onEdit: () {
//               // Handle email edit
//             },
//           ),
//           EditableField(
//             label: "Phone Number",
//             value: "+91 8555870653",
//             onEdit: () {
//               // Handle phone edit
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
