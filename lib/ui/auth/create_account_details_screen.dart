import 'package:aira_filter_app/components/navbar.dart';
import 'package:aira_filter_app/components/rounded_button.dart';
import 'package:aira_filter_app/constants/colors.dart';
import 'package:aira_filter_app/components/login_background.dart';
import 'package:aira_filter_app/ui/auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../components/rounded_input.dart';

class CreateAccountDetailsScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: BackNavBar(title: "Create Account"),
      body: Stack(children: [
        CustomBackground(
          imagePath: '', // Replace with your background image path
          opacity: 0.2, // Adjust opacity as needed
        ),
        Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: const Text(
                  textAlign: TextAlign.start,
                  'Sign up to get started.',
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'Roboto_Mono',
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),

              //create an edittext widget rounded
              RoundedInput(
                hintText: 'Enter Your Name',
                type: TextInputType.text,
                controller: nameController,
              ),
              RoundedInput(
                  hintText: 'Enter Your Email Address',
                  type: TextInputType.emailAddress,
                  controller: emailController),
              RoundedInput(
                hintText: 'Create a Password',
                type: TextInputType.visiblePassword,
                controller: passwordController,
              ),

              RoundedButton(
                title: 'Create Account',
                onClick: () {
                  FocusScope.of(context).unfocus();

                  if (passwordController.text.length < 8) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: AppColor.dark_1,
                        content: Text('Password must be atleast 8 characters',
                            style: TextStyle(color: AppColor.light)),
                        duration: Duration(
                            seconds: 3), // Adjust the duration as needed
                      ),
                    );
                  }
                  if (nameController.text.isEmpty ||
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

                  // print(emailController.text);
                  signUpWithEmailAndPassword(emailController.text,
                      passwordController.text, nameController.text, context);

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
                title: 'Sign up with Facebook',
                onClick: () {
                  
// temo_add_data( 'Emparito Gracias','Johnson','200','4000','200','',context);
// temo_add_data( 'Silver Satvera','Tyler','200','3000','200','',context);
// temo_add_data( 'Danke Guliver','Martin','200','5000','200','',context);
// temo_add_data( 'Anton Gest','Cameron','200','7000','200','',context);

                  // TODO: Implement button 2 functionality
                },
                bgcolor: AppColor.dark_1, // Button color
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
                              // Call your onclick function here
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
      ]),
    );
  }
}

Future<void> signUpWithEmailAndPassword(
    String email, String password, String name, BuildContext c) async {
         showDialog(
      context: c,
      barrierDismissible: false, // Prevent dismissing the dialog
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(), // Display the indicator
        );
      },
    );
  try {
    final authResult =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

 

    await FirebaseFirestore.instance
        .collection('users')
        .doc(authResult.user!.uid)
        .set({
      'name': name,
      'email': email,
      'dob':'',
      'gender':'',
      'image':''

    });
    // await Future.delayed(const Duration(seconds: 1));

    Navigator.pop(c);

    // Handle successful sign-up
    if (!c.mounted) return;
    Navigator.push(
      c,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  } catch (e) {
    // Handle sign-up error

    ScaffoldMessenger.of(c).showSnackBar(
      const SnackBar(
        backgroundColor: AppColor.dark_1,
        content: Text('Sign-up failed. Check your credentials',
            style: TextStyle(color: AppColor.light)),
        duration: Duration(seconds: 3), // Adjust the duration as needed
      ),
    );
  }
}

Future<void> temo_add_data(String title, String by, String likes, String views, String comments,String image, BuildContext c) async {
  DocumentReference newDocRef =
      FirebaseFirestore.instance.collection('filters').doc();

  String newUid = newDocRef.id;

  // Set the document with the generated UID
  await newDocRef.set({
    'title' : title,
    'by': by,
    'likes': likes,
    'views': views,
    'comments': comments,
    'image': ''
  });
}
