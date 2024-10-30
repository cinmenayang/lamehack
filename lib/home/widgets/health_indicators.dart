import 'package:flutter/material.dart';

class HealthIndicators extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.favorite, color: Colors.red),
            title: Text('Heart Rate'),
            subtitle: Text('72 bpm'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.thermostat, color: Colors.orange),
            title: Text('Body Temperature'),
            subtitle: Text('36.5°C'),
          ),
        ],
      ),
    );
  }
}
