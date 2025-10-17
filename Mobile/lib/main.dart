import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'screens/login_screen.dart';

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
          title: 'Enterprise Login',
          theme: ThemeData.dark(useMaterial3: true),
          home: const LoginScreen(),
        );
      },
    );
  }
}
