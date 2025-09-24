// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:charts_flutter_new/flutter.dart' as charts;

// class AnalyticsDashboardPage extends StatefulWidget {
//   const AnalyticsDashboardPage({super.key});

//   @override
//   State<AnalyticsDashboardPage> createState() => _AnalyticsDashboardPageState();
// }

// class _AnalyticsDashboardPageState extends State<AnalyticsDashboardPage> {
//   String selectedYear = DateTime.now().year.toString();
//   List<charts.Series<MonthlyData, String>> chartData = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchAnalyticsData();
//   }

//   Future<void> fetchAnalyticsData() async {
//     final snapshot = await FirebaseFirestore.instance
//         .collection('analytics')
//         .where('year', isEqualTo: selectedYear)
//         .get();

//     final monthlyCounts = List.generate(
//       12,
//       (index) => MonthlyData(month: index + 1, count: 0),
//     );

//     for (var doc in snapshot.docs) {
//       final month = int.parse(doc['month']);
//       final count = doc['count'] ?? 0;
//       monthlyCounts[month - 1].count = count;
//     }

//     setState(() {
//       chartData = [
//         charts.Series<MonthlyData, String>(
//           id: 'Customers',
//           colorFn: (_, __) => charts.MaterialPalette.teal.shadeDefault,
//           domainFn: (MonthlyData data, _) => data.monthName,
//           measureFn: (MonthlyData data, _) => data.count,
//           data: monthlyCounts,
//         ),
//       ];
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Analytics Dashboard')),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             DropdownButton<String>(
//               value: selectedYear,
//               items: List.generate(5, (index) {
//                 final year = (DateTime.now().year - index).toString();
//                 return DropdownMenuItem(value: year, child: Text(year));
//               }),
//               onChanged: (val) {
//                 setState(() {
//                   selectedYear = val!;
//                 });
//                 fetchAnalyticsData();
//               },
//             ),
//             const SizedBox(height: 20),
//             Expanded(child: charts.BarChart(chartData, animate: true)),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MonthlyData {
//   final int month;
//   int count;

//   MonthlyData({required this.month, required this.count});

//   String get monthName {
//     const months = [
//       'Jan',
//       'Feb',
//       'Mar',
//       'Apr',
//       'May',
//       'Jun',
//       'Jul',
//       'Aug',
//       'Sep',
//       'Oct',
//       'Nov',
//       'Dec',
//     ];
//     return months[month - 1];
//   }
// }
