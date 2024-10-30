import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(80.0),
        child: Column(
          children: [
            Lottie.asset(
              'assets/animation/oldpeople.json',
              width: 350,
              height: 350,
            ),
            Text(
              "STAY FIT",
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'Klasik',
                color: Color(0xFF6a040f),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(32.0),
              child: Text(
                "Embrace a lifestyle focused on longevity and well-being for maintaining physical and mental health as you age.",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
          //stay healthy
        ),
      ),
    );
  }
}
