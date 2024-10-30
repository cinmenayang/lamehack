import 'package:flutter/material.dart';

class MedicalHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.history, color: Colors.brown),
        title: Text('Medical History'),
        subtitle: Text('Allergy: Penicillin'),
      ),
    );
  }
}
