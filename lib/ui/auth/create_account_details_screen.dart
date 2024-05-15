import 'package:aira_filter_app/components/navbar.dart';
import 'package:aira_filter_app/components/rounded_button.dart';
import 'package:aira_filter_app/constants/colors.dart';
import 'package:aira_filter_app/components/login_background.dart';
import 'package:aira_filter_app/ui/auth/login_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../components/rounded_input.dart';

class CreateAccountDetailsScreen extends StatelessWidget { 
@override 
Widget build(BuildContext context) { 
	return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:                 BackNavBar(title: "Create Account"),


      body: Stack(
        children: [
          CustomBackground(
            imagePath: '', // Replace with your background image path
            opacity: 0.2, // Adjust opacity as needed
          ), Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
               

                
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 10, 10,10),
                  child: const Text(
                     textAlign:  TextAlign.start,
                     'Sign up to get started.',
                    style: TextStyle(
        
                      fontSize: 13,
                      fontFamily: 'Roboto_Mono',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),

                //create an edittext widget rounded
                const RoundedInput(hintText: 'Enter Your Name',type:TextInputType.text),
                const RoundedInput(hintText: 'Enter Your Email Address',type:TextInputType.emailAddress),
                const RoundedInput(hintText: 'Create a Password', type: TextInputType.visiblePassword),

               RoundedButton(
                  title: 'Create Account',
                  onClick: () {
                    // TODO: Implement button 2 functionality
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
            text: 'Already have an account? ',
            style: TextStyle(color: AppColor.light), // Default text color
          ),
          TextSpan(
            text: 'Login',
            style: const TextStyle(color: AppColor.pink,fontWeight: FontWeight.w900), // "Login" text color
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Call your onclick function here
                Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => LoginScreen()),
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
      ]),
       
    );
} 
} 
