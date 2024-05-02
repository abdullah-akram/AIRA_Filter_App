import 'package:aira_filter_app/components/rounded_button.dart';
import 'package:aira_filter_app/constants/colors.dart';
import 'package:aira_filter_app/ui/auth/create_account_screen.dart';
import 'package:aira_filter_app/components/login_background.dart';
import 'package:aira_filter_app/ui/discover/discover_screen.dart';
import 'package:aira_filter_app/ui/home/home_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../components/rounded_input.dart';

class LoginScreen extends StatelessWidget { 
@override 
Widget build(BuildContext context) { 
	return Scaffold(
      resizeToAvoidBottomInset: false,

      body: Stack(
        children: [
          CustomBackground(
            imagePath: 'assets/images/background_carousal.png', // Replace with your background image path
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
                      margin: const EdgeInsets.fromLTRB(10, 10, 10,30),
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
                const RoundedInput(hintText: 'Email Address',type:TextInputType.emailAddress),
                const RoundedInput(hintText: 'Password', type: TextInputType.visiblePassword),

               RoundedButton(
                  title: 'Login',
                  onClick: () {
                    // TODO: Implement button 2 functionality
                     Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
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
      child: Text('or', style: TextStyle(color: AppColor.dark_3)),
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
                ),

               RoundedButton(
                  title: 'Sign up with Google',
                  onClick: () {
                    // TODO: Implement button 2 functionality
                  },
                  bgcolor: AppColor.dark_1, // Button color
                ),
Expanded(
      child: Container(), // This empty container pushes the following widgets to the bottom
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
            style: TextStyle(color: AppColor.light), // Default text color
          ),
          TextSpan(
            text: 'Sign Up',
            style: const TextStyle(color: AppColor.pink,fontWeight: FontWeight.w900), // "Login" text color
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateAccountScreen()),
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
