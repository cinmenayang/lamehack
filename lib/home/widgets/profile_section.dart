import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.person, size: 50, color: Colors.teal),
        title: Text('John Doe'),
        subtitle: Text('Age: 30 | Height: 180 cm | Weight: 75 kg'),
      ),
    );
  }
}
