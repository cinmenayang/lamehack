import 'package:app_fit/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_fit/components/button_signup.dart';
import 'package:app_fit/components/my_textfield.dart';
import 'package:app_fit/components/square_tile.dart';
import 'package:flutter/material.dart';

class RegisterAcc extends StatefulWidget {
  RegisterAcc({super.key});

  @override
  State<RegisterAcc> createState() => _RegisterAccState();
}

class _RegisterAccState extends State<RegisterAcc> {
  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final createPasswordController = TextEditingController();

  final confrimPasswordController = TextEditingController();

  //sign user up
  void signUserUp() async {
    // Get user input
    final String name = nameController.text.trim();
    final String email = emailController.text.trim();
    final String password = createPasswordController.text.trim();
    final String confirmPassword = confrimPasswordController.text.trim();

    // Validate inputs
    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      _showError("Please fill in all fields");
      return;
    }

    if (password != confirmPassword) {
      _showError("Passwords do not match");
      return;
    }

    try {
      // Create a new user with email and password
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Optionally: Store additional user information in Firestore or Realtime Database
      // For example, save the name to a Firestore document

      // Navigate to the homepage or another screen upon successful registration
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } catch (e) {
      String errorMessage = "An error occurred. Please try again.";

      if (e is FirebaseAuthException) {
        if (e.code == 'email-already-in-use') {
          errorMessage = 'The email is already in use.';
        } else if (e.code == 'invalid-email') {
          errorMessage = 'The email address is not valid.';
        } else if (e.code == 'weak-password') {
          errorMessage = 'The password is too weak.';
        }
      }

      _showError(errorMessage);
    }
  }

  // Function to display error messages
  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //SizedBox(height: 30),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 60),
                    child: Text(
                      "Sign Up For Fit",
                      style: TextStyle(
                        color: Color(0xFF6a040f),
                        fontFamily: 'Klasik',
                        fontSize: 30,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Text("Create an account for your healthy lifestyle.",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Klasik',
                          fontSize: 15,
                        )),
                  ),

                  //fill in information
                  MyTextfield(
                      controller: nameController,
                      hintText: 'Username',
                      obscureText: false),

                  SizedBox(
                    height: 15,
                  ),

                  MyTextfield(
                      controller: emailController,
                      hintText: 'eMail',
                      obscureText: false),

                  SizedBox(height: 15),

                  MyTextfield(
                      controller: createPasswordController,
                      hintText: 'Password',
                      obscureText: true),

                  SizedBox(height: 15),

                  MyTextfield(
                      controller: confrimPasswordController,
                      hintText: 'Confirm Password',
                      obscureText: true),

                  SizedBox(height: 30),

                  MyButtonSignUp(onTap: signUserUp),

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
                ],
              ),
            ),
          ),
        ));
  }
}
