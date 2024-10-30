import 'package:flutter/material.dart';

class ActivityTracking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.fitness_center, color: Colors.green),
        title: Text('Activity Tracking'),
        subtitle: Text('30 min workout completed'),
      ),
    );
  }
}
