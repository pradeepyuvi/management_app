import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'pages/plans_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Subscription Demo',
          home:
              PlansPage(), // <- not const, because we keep state with ValueNotifier
        );
      },
    );
  }
}
