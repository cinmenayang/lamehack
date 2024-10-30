import 'package:app_fit/components/my_button.dart';
import 'package:app_fit/components/my_textfield.dart';
import 'package:app_fit/components/square_tile.dart';
import 'package:app_fit/home/home_page.dart';
import 'package:app_fit/sign_up%20pages/register_acc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SignInPage extends StatefulWidget {
  SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String errorMessage = ' ';

  //sign user in method

  void signUserIn(BuildContext context) async {
    {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);

        //Navigate to Homepage after after successful sign-in
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (builder) => HomePage()),
        );
      } catch (e) {
        setState(() {
          if (e is FirebaseAuthException) {
            if (e.code == 'user-not-found') {
              errorMessage = 'No user found for that email.';
            } else if (e.code == 'wrong-password') {
              errorMessage = 'Wrong password provided for that user.';
            } else if (e.code == 'invalid-email') {
              errorMessage = 'The email address is not valid.';
            } else {
              errorMessage = 'An error occurred. Please try again.';
            }
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
              child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            //icon
            Lottie.asset(
              'assets/animation/lovefit.json',
              height: 250,
            ),

            const SizedBox(
              height: 5,
            ),
            //welcome back, we missed you
            Text(
              "Welcome back you've been missed!",
              style: TextStyle(
                  color: Color(0xFF6a040f), fontSize: 20, fontFamily: 'Klasik'),
            ),

            const SizedBox(
              height: 25,
            ),
            //user name textfield
            MyTextfield(
                controller: emailController,
                hintText: 'Email',
                obscureText: false),

            const SizedBox(
              height: 25,
            ),

            //password textfield
            MyTextfield(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),

            //forgot passwird?
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            //sign in button
            MyButton(
              onTap: () => signUserIn(context),
            ),
            if (errorMessage.isNotEmpty) // Show error message if not empty
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  errorMessage,
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      fontFamily: 'Klasik'),
                ),
              ),

            const SizedBox(height: 15),

            // or continue with
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    child: Text("Or continue with",
                        style: TextStyle(
                          color: Colors.grey[700],
                        )),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 25,
            ),
            //google + apple sign in buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              //google button
              children: [
                SquareTile(imagePath: 'assets/images/google.png'),
                const SizedBox(width: 10),
                //apple button
                SquareTile(imagePath: 'assets/images/apple.png'),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            // not a member? register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a member?"),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => RegisterAcc()));
                  },
                  child: Text(
                    "Register now.",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.blue,
                      decorationThickness: 1.5,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ))),
    );
  }
}
