import 'package:aira_filter_app/ui/home/Story_List.dart';
import 'package:aira_filter_app/components/bottom_toolbar.dart';
import 'package:aira_filter_app/ui/home/home_top_navbar.dart';
import 'package:aira_filter_app/ui/home/home_trending_item.dart';
import 'package:aira_filter_app/ui/home/home_try_item.dart';
import 'package:aira_filter_app/components/login_background.dart';
import 'package:aira_filter_app/components/rounded_button.dart';
import 'package:aira_filter_app/constants/colors.dart';
import 'package:aira_filter_app/data/imageList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {
  double op = 0.3;
bool toggle = false;


  @override
  Widget build(BuildContext context) {
                          print( "builddddddddddd" );

    return Scaffold(
      appBar: Home_AppBar(title: "Home"),
      body: Stack(children: <Widget>[
        Opacity(
          opacity: 1,
          child: CustomBackground(
            imagePath: '',
            
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              StoryListView(imageUrls: imageUrls,names: people),
              HomeTryItem(),
              HomeTrendingItem(imageUrls: imageUrls,texts: texts, title: "Trending Now"),
              HomeTrendingItem(imageUrls: imageUrls,texts: texts, title: "Top 5 Presets"),
              HomeTrendingItem(imageUrls: imageUrls, title: "Mix & Match"),
           
            ],
          ),
        ),
        Positioned(
              left: 8,
              right: 8,
              bottom: 8,
              child: CustomAppBar(selectedItemIndex: 0),
            ),
             Positioned(
              bottom: 32,
              left: 0,
              right: 0,
         
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomFloatingActionButton(),
              ),
            ),
      ]
      
      ),

    );
  }
}
