import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage4 extends StatelessWidget {
  const IntroPage4({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(80.0),
        child: Column(children: [
          Lottie.asset(
            'assets/animation/lovefit.json',
            height: 350,
            width: 350,
          ),
          Text("LOVE FIT",
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'Klasik',
                color: Color(0xFF6a040f),
              )),
          Padding(
            padding: EdgeInsets.all(32.0),
            child: Text(
              "Love Healthy Lifestyle. Love Fit.",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ]),
      ),
    );
  }
}
