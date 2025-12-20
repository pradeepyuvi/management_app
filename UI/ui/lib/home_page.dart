import 'package:flutter/material.dart';
import '../pg_home_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 1; // default selected = Home

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer Details"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),

      body: const Center(
        child: Text("Empty Page", style: TextStyle(fontSize: 20)),
      ),

      // ⬇ bottom bar
      bottomNavigationBar: PgHomeBottomNavBar(
        selectedIndex: selectedIndex,
        onTabChanged: (index) {
          setState(() => selectedIndex = index);
        },
      ),
    );
  }
}
