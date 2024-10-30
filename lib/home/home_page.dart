import 'package:flutter/material.dart';
import 'widgets/profile_section.dart';
import 'widgets/step_counter.dart';
import 'widgets/health_indicators.dart';
import 'widgets/medical_history.dart';
import 'widgets/activity_tracking.dart';
import 'widgets/sleep_tracking.dart';
import 'widgets/cycle_tracking.dart';
import 'widgets/calorie_intake.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Health Dashboard',
          style: TextStyle(color: Colors.black, fontFamily: 'Klasik'),
        ),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ProfileSection(),
            SizedBox(height: 16.0),
            StepCounter(),
            SizedBox(height: 16.0),
            HealthIndicators(),
            SizedBox(height: 16.0),
            MedicalHistory(),
            SizedBox(height: 16.0),
            ActivityTracking(),
            SizedBox(height: 16.0),
            SleepTracking(),
            SizedBox(height: 16.0),
            CycleTracking(),
            SizedBox(height: 16.0),
            CalorieIntake(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Friends'),
          BottomNavigationBarItem(
              icon: Icon(Icons.emoji_events), label: 'Achievements'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Me'),
          BottomNavigationBarItem(
              icon: Icon(Icons.play_arrow), label: 'Videos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notifications'),
        ],
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
