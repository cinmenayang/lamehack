import 'package:flutter/material.dart';

class CalorieIntake extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.local_dining, color: Colors.redAccent),
        title: Text('Calorie Intake'),
        subtitle: Text('1,200 kcal consumed'),
      ),
    );
  }
}
