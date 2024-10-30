import 'package:flutter/material.dart';

class SleepTracking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.nights_stay, color: Colors.deepPurple),
        title: Text('Sleep Tracking'),
        subtitle: Text('7 hours of sleep'),
      ),
    );
  }
}
