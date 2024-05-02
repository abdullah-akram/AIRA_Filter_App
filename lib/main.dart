import 'dart:async'; 
import 'package:aira_filter_app/components/rounded_button.dart';
import 'package:aira_filter_app/constants/colors.dart';
import 'package:aira_filter_app/components/login_background.dart';
import 'package:aira_filter_app/discover_screen.dart';
import 'package:aira_filter_app/filter_cover.dart';
import 'package:aira_filter_app/home_screen.dart';
import 'package:aira_filter_app/saved_presets_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'create_account_screen.dart'; 
void main() { 
runApp(MyApp()); 
} 

class MyApp extends StatelessWidget { 
@override 
Widget build(BuildContext context) { 
	return MaterialApp( 
	title: 'AIRA Filter App', 
  theme: ThemeData.dark( 
	), 
  
      routes: {
        '/home': (context) => HomeScreen(),
        '/discover': (context) => DiscoverScreen(),
        '/favorites': (context) => SavedPresetsScreen(),
        // '/profile': (context) => ProfileScreen(),
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
	Timer(Duration(seconds: 3), 
		()=>Navigator.pushReplacement(context, 
										MaterialPageRoute(builder: 
														(context) => 
														CreateAccountScreen() 
														) 
									) 
		); 
} 
@override 
Widget build(BuildContext context) { 
	return Container( 
	color: AppColor.dark_1, 
	child://replace with imageasset splash image
    Center(

      child: Image.asset('assets/images/splash.png' ,
//make image asset cover whole screen
          fit: BoxFit.cover,  // This will make the image cover the whole screen
                height: MediaQuery.of(context).size.height,  // Set height to screen height
                width: MediaQuery.of(context).size.width,  // Set width to screen width
      ),
    ),

	); 
} 
} 