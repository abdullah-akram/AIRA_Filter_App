import 'dart:math';

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
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class SavedPresetsScreen extends StatelessWidget {
  int tempIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: Home_AppBar(
          title: "Saved Presets",
         
          opacity: 0.0,
          color: Colors.transparent),
      body: Stack(children: <Widget>[
        Opacity(
          opacity: 1,
          child: CustomBackground(
            imagePath: '',
           
          ),
        ),
        Column(
          children: [
            Container(
              height: kToolbarHeight + 30,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: const BoxDecoration(
                color: Colors.transparent,
                border: //only bottom border
                    Border(bottom: BorderSide(color: Colors.grey, width: 0.1)),
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 15, 10, 5),
                    width: MediaQuery.of(context).size.width,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("My Posts",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        Row(
                          children: [
                            Text('View', style: TextStyle(fontSize: 12)),
                            Icon(Icons.arrow_forward_ios, size: 16),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Container(
                    child: Row(
                      children: [
                        Expanded(
                            flex: 4,
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(40, 10, 10, 10),
                              child:  Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  // Vertically downward four texts
                                  const Text(
                                    'Caption',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 11),
                                  ),
                                  const Text(
                                    'Stargazing Duality', 
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  const Text(
                                    '',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 11),
                                  ),
                                  const Text(
                                    'Posted by',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 11),
                                  ),
                                  const Text(
                                    'Tyler',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
 const Text(
                                    '',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 5),
                                  ),

                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      // Row of icons
                                      RichText(
                                        text: const TextSpan(
                                          children: [
                                            WidgetSpan(
                                             
                                              child: Icon(
                                                  Icons.remove_red_eye_outlined,
                                                  size:
                                                      12), // Adjust the size as needed
                                            ),
                                            TextSpan(
                                              
                                                text: " 2.2K",
                                                style: TextStyle(fontSize: 10)),
                                          ],
                                        ),
                                      ),
                                       const Text(
                                    '   ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10),
                                  ),
                                      RichText(
                                        text:  const TextSpan(
                                          children: [
                                            WidgetSpan(
                                              child: Icon(
                                                  Icons
                                                      .favorite_outline_rounded,
                                                  size:
                                                      12), // Adjust the size as needed
                                            ),
                                            TextSpan(
                                                text: " 1.7K",
                                                style: TextStyle(fontSize: 10)),
                                          ],
                                        ),
                                      ),

                                     
                                    ],
                                  ),
                                ],
                              ),
                            )),
                        Expanded(
                          flex: 5,
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    FloatingActionButton(
                                      mini: true,
                                      onPressed: () {},
                                      shape: const CircleBorder(),
                                      backgroundColor: AppColor.pink,
                                      child: const Icon(
                                        Icons.favorite_rounded,
                                        color: AppColor.dark_2,
                                      ),
                                    ),
                                    Expanded(
                                      child: RoundedButton(
                                        title: "Connect",
                                        onClick: () {},
                                        bgcolor: AppColor.pink,
                                        padding: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 60,
                                  child: RoundedButton(
                                    title: "Try Now",
                                    onClick: () {},
                                    bgcolor: AppColor.pink,
                                    padding: 8,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.transparent,
                child: CardSwiper(
                  cardsCount: imageUrls.length,
                  numberOfCardsDisplayed: min(5, imageUrls.length),
                  backCardOffset: const Offset(30, 15),
                  cardBuilder:
                      (context, index, percentThresholdX, percentThresholdY) {
                    if (index == tempIndex) {
                      return Transform.rotate(
                        angle: -0.05,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            imageUrls[index],
                            fit: BoxFit.fill,
                            width: 200,
                          ),
                        ),
                      );
                    } else {
                      return Transform.rotate(
                        angle: 0.05,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            imageUrls[index],
                            fit: BoxFit.fill,
                            width: 200,
                          ),
                        ),
                      );
                    }
                  },
                  onSwipe: (previousIndex, currentIndex, direction) {
                    tempIndex = currentIndex!;
                    return true;
                  },
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 8,
          right: 8,
          bottom: 8,
          child: CustomAppBar(selectedItemIndex: 2),
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
      ]),
    );
  }
}
