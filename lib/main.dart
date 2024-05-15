import 'dart:async';
import 'package:aira_filter_app/constants/colors.dart';
import 'package:aira_filter_app/edit_screen.dart';
import 'package:aira_filter_app/ui/discover/discover_screen.dart';
import 'package:aira_filter_app/ui/home/home_screen.dart';
import 'package:aira_filter_app/ui/profile/profile_screen.dart';
import 'package:aira_filter_app/ui/saved/saved_presets_screen.dart';
import 'package:flutter/material.dart';

import 'ui/auth/create_account_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AIRA Filter App',
      theme: ThemeData.dark(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/discover': (context) => DiscoverScreen(),
        '/favorites': (context) => SavedPresetsScreen(),
        '/profile': (context) => ProfileScreen(), 
        // Add more routes as needed
      },
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 1),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => CreateAccountScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.dark_1,
      child: //replace with imageasset splash image
          Center(
        child: Image.asset(
          'assets/images/splash.png',
          fit: BoxFit.cover, // This will make the image cover the whole screen
          height:
              MediaQuery.of(context).size.height, // Set height to screen height
          width: MediaQuery.of(context).size.width, // Set width to screen width
        ),
      ),
    );
  }
}
