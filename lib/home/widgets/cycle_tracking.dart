import 'package:flutter/material.dart';

class CycleTracking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.wb_sunny, color: Colors.amber),
        title: Text('Cycle Tracking'),
        subtitle: Text('Next cycle in 5 days'),
      ),
    );
  }
}
