import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(80.0),
        child: Column(children: [
          Lottie.asset(
            "assets/animation/jogging.json",
            height: 350,
            width: 350,
          ),
          Text(
            "BE FIT",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Klasik',
              fontSize: 40,
              color: Color(0xFF6a040f),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(30.0),
            child: Text(
              "Get personalized exercise recommendations tailored to your fitness level and goals.",
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

           
// 