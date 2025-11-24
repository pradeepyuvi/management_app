import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:adm/main.dart';

void main() {
  testWidgets('HomeScreen UI test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Check for welcome text
    expect(find.text('Welcome Admin!'), findsOneWidget);

    // Check for User and Owner buttons
    expect(find.text('User'), findsOneWidget);
    expect(find.text('Owner'), findsOneWidget);

    // Check for person icon
    expect(find.byIcon(Icons.person), findsOneWidget);
  });
}
