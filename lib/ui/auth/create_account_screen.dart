import 'package:aira_filter_app/components/rounded_button.dart';
import 'package:aira_filter_app/constants/colors.dart';
import 'package:aira_filter_app/components/login_background.dart';
import 'package:aira_filter_app/ui/auth/create_account_details_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class CreateAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  'Transform your photos and videos with exclusive filters and effects',
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
                    'With AiRa, you can add stunning filters, effects, and overlays to your photos and take your social media game to the next level.',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Roboto_Mono',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                RoundedButton(
                  title: 'Create Account',
                  onClick: () {
                    // TODO: Implement button 2 functionality
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreateAccountDetailsScreen()),
                    );
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
                            text: 'Already have an account? ',
                            style: TextStyle(
                                color: AppColor.light), // Default text color
                          ),
                          TextSpan(
                            text: 'Login',
                            style: const TextStyle(
                                color: AppColor.pink,
                                fontWeight:
                                    FontWeight.w900), // "Login" text color
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Go to login screen when "Login" is tapped
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()),
                                );

                                print('Login tapped');
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
