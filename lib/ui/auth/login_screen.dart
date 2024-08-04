import 'package:aira_filter_app/components/rounded_button.dart';
import 'package:aira_filter_app/constants/colors.dart';
import 'package:aira_filter_app/ui/auth/create_account_screen.dart';
import 'package:aira_filter_app/components/login_background.dart';
import 'package:aira_filter_app/ui/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../components/rounded_input.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          CustomBackground(
            imagePath:
                'assets/images/background_carousal.png', // Replace with your background image path
            opacity: 0.2, // Adjust opacity as needed
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Image.asset(
                    'assets/images/sara_shakeel_logo.png',
                    height: 80,
                    width: 150,
                  ),
                ),

                const Text(
                  textAlign: TextAlign.center,
                  'Login',
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'Roboto_Mono',
                    height: 1.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                Container(
                  margin: const EdgeInsets.fromLTRB(10, 10, 10, 30),
                  child: const Text(
                    textAlign: TextAlign.center,
                    'Login to access your account.',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Roboto_Mono',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),

                //create an edittext widget rounded
                RoundedInput(
                    hintText: 'Email Address',
                    type: TextInputType.emailAddress,
                    controller: emailController),
                RoundedInput(
                    hintText: 'Password',
                    type: TextInputType.visiblePassword,
                    controller: passwordController),

                RoundedButton(
                  title: 'Login',
                  onClick: () {
                  FocusScope.of(context).unfocus();
                   if (
                        emailController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: AppColor.dark_1,
                          content: Text("Fields can't be empty",
                              style: TextStyle(color: AppColor.light)),
                          duration: Duration(
                              seconds: 3), // Adjust the duration as needed
                        ),
                      );
                    } 
                    else if (!emailController.text.contains(".com") && !emailController.text.contains("@")) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: AppColor.dark_1,
                          content: Text('Enter a valid email address',
                              style: TextStyle(color: AppColor.light)),
                          duration: Duration(
                              seconds: 3), // Adjust the duration as needed
                        ),
                      );
                    }


                    // TODO: Implement button 2 functionality
                    // if (passwordController.text.length < 8) {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(
                    //       backgroundColor: AppColor.dark_1,
                    //       content: Text('Password must be atleast 8 characters',
                    //           style: TextStyle(color: AppColor.light)),
                    //       duration: Duration(
                    //           seconds: 3), // Adjust the duration as needed
                    //     ),
                    //   );
                    // }
                    else{
                    signInWithEmailAndPassword(
                        emailController.text, passwordController.text, context);
                    }
                    //      Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => HomeScreen()),
                    // );
                  },

                  bgcolor: AppColor.pink, // Button color
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Divider(
                        color: AppColor.dark_2,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child:
                          Text('or', style: TextStyle(color: AppColor.dark_3)),
                    ),
                    Expanded(
                      child: Divider(
                        color: AppColor.dark_2,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),

                RoundedButton(
                  title: 'Sign up with Google',
                  onClick: () {
                    // TODO: Implement button 2 functionality
                  },
                  bgcolor: AppColor.dark_1, // Button color
                  iconPath: 'assets/images/icons/google_icon.svg', // Path to SVG icon
 // Add this line
                ),

                RoundedButton(
                  title: 'Sign up with Facebook',
                  onClick: () {
                    // TODO: Implement button 2 functionality
                  },
                  bgcolor: AppColor.dark_1, // Button color
                  iconPath: 'assets/images/icons/fb_icon.svg', // Path to SVG icon
 // Add this line
                ),
                Expanded(
                  child:
                      Container(), // This empty container pushes the following widgets to the bottom
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Dont have an account? ',
                            style: TextStyle(
                                color: AppColor.light), // Default text color
                          ),
                          TextSpan(
                            text: 'Sign Up',
                            style: const TextStyle(
                                color: AppColor.pink,
                                fontWeight:
                                    FontWeight.w900), // "Login" text color
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CreateAccountScreen()),
                                );
                                // Call your onclick function here
                                print('Sign Up tapped');
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> signInWithEmailAndPassword(
    String email, String password, BuildContext c) async {
  try {
    showDialog(
      context: c,
      barrierDismissible: false, // Prevent dismissing the dialog
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(), // Display the indicator
        );
      },
    );

    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    // await Future.delayed(const Duration(seconds: 1));
    Navigator.pop(c);

    if (!c.mounted) return;
    Navigator.push(
      c,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  } catch (e) {
    Navigator.pop(c);

    ScaffoldMessenger.of(c).showSnackBar(
      const SnackBar(
        backgroundColor: AppColor.dark_1,
        content: Text('Sign-in failed. Check your credentials',
            style: TextStyle(color: AppColor.light)),
        duration: Duration(seconds: 3), // Adjust the duration as needed
      ),
    );
    // Handle sign-in error
  }
}
