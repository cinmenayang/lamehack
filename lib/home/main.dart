import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(HealthDashboardApp());
}

class HealthDashboardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: HomePage(),
    );
  }
}
