import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(80.0),
        child: Column(children: [
          Lottie.asset(
            'assets/animation/food.json',
            width: 350,
            height: 350,
          ),
          Text(
            "KEEP FIT",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 40, fontFamily: 'Klasik', color: Color(0xFF6a040f)),
          ),
          Padding(
            padding: EdgeInsets.all(32.0),
            child: Text(
              "Follow a balanced, nutritious diet plan designed to make healthy choices every day.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          )
        ]
            //seek professional advice
            ),
      ),
    );
  }
}
