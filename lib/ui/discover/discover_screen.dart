import 'package:aira_filter_app/ui/home/Story_List.dart';
import 'package:aira_filter_app/components/bottom_toolbar.dart';
import 'package:aira_filter_app/ui/discover/discover_item.dart';
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

class DiscoverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Home_AppBar(title: "Discover", onSearchPressed: () => {}),
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
              DiscoverItem(imageUrls: imageUrls,texts: texts, title: "Manage My Network"),
         
           
            ],
          ),
        ),
        Positioned(
              left: 8,
              right: 8,
              bottom: 8,
              child: CustomAppBar(selectedItemIndex: 1),
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
