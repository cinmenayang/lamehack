import 'package:flutter/material.dart';

class StepCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.directions_walk, color: Colors.blue, size: 50),
        title: Text('Steps Today'),
        subtitle: Text('6,500 steps'),
      ),
    );
  }
}
