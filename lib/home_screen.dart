import 'package:aira_filter_app/components/Story_List.dart';
import 'package:aira_filter_app/components/bottom_toolbar.dart';
import 'package:aira_filter_app/components/home_top_navbar.dart';
import 'package:aira_filter_app/components/home_trending_item.dart';
import 'package:aira_filter_app/components/home_try_item.dart';
import 'package:aira_filter_app/components/login_background.dart';
import 'package:aira_filter_app/components/rounded_button.dart';
import 'package:aira_filter_app/constants/colors.dart';
import 'package:aira_filter_app/data/imageList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Home_AppBar(title: "Home", onSearchPressed: () => {}),
      body: Stack(children: <Widget>[
        Opacity(
          opacity: 0.3,
          child: CustomBackground(
            imagePath: '',
            opacity: 0.1,
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
