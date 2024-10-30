import 'package:app_fit/intro%20screen/intro_page_1.dart';
import 'package:app_fit/intro%20screen/intro_page_2.dart';
import 'package:app_fit/intro%20screen/intro_page_3.dart';
import 'package:app_fit/intro%20screen/intro_page_4.dart';
import 'package:app_fit/sign_up%20pages/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
// controller to keep track what page are we on
  PageController _controller = PageController();

  //keep track if we on the last page or not
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        //pageview
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 3);
            });
          },
          children: [
            IntroPage1(),
            IntroPage2(),
            IntroPage3(),
            IntroPage4(),
          ],
        ),

        //dot indicator
        Container(
          alignment: Alignment(0, 0.75),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //skip -> last page
              GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(3);
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontFamily: 'Klasik',
                    ),
                  )),

              //dot indicator
              SmoothPageIndicator(controller: _controller, count: 4),

              //next or done
              onLastPage
                  ? GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SignInPage();
                            },
                          ),
                        );
                      },
                      child: Text(
                        'Done',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Klasik',
                          color: Colors.grey,
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        _controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontFamily: 'Klasik',
                        ),
                      ),
                    ),
            ],
          ),
        )
      ],
    ));
  }
}
