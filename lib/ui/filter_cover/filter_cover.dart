import 'dart:ui';

import 'package:aira_filter_app/components/notched_container.dart';
import 'package:aira_filter_app/components/rounded_button.dart';
import 'package:aira_filter_app/data/imageList.dart';
import 'package:flutter/material.dart';

class FilterCoverScreen extends StatelessWidget {

  final int index;

  FilterCoverScreen({required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Image asset covering the whole screen
          Positioned.fill(
            child: Image.asset(
              imageUrls[index],
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.34,
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: BottomAppBar(
              notchMargin: 0.0,
              color: Colors.black.withOpacity(0.5),
              shape: const OvalNotchedRectangle(),
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Row(children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          flex: 2, // 20%
                          child: Container(
                            margin: const EdgeInsets.all(2.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // Two rounded buttons with icons
                                FloatingActionButton(
                                  backgroundColor: Colors.pink,
                                  shape:
                                      const CircleBorder(), // This makes the button round

                                  onPressed: () {},
                                  child: const Icon(Icons.favorite_outline),
                                ),
                                FloatingActionButton(
                                  backgroundColor: Colors.pink,

                                  shape:
                                      const CircleBorder(), // This makes the button round

                                  onPressed: () {},
                                  child: const Icon(Icons.textsms_outlined),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1, // 10%
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                          text: "2.2K",
                                          style: TextStyle(fontSize: 10)),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: const TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: Icon(
                                            Icons.favorite_outline_rounded,
                                            size:
                                                12), // Adjust the size as needed
                                      ),
                                      TextSpan(
                                          text: "1.7K",
                                          style: TextStyle(fontSize: 10)),
                                    ],
                                  ),
                                ),

                                RichText(
                                  text: const TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: Icon(Icons.textsms_outlined,
                                            size:
                                                12), // Adjust the size as needed
                                      ),
                                      TextSpan(
                                          text: " 700",
                                          style: TextStyle(fontSize: 10)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 6, // 70%
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(4, 8.0, 4, 4),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                // Vertically downward four texts
                                Text(
                                  'Caption',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12),
                                ),
                                Text(
                                  'Stargazing Duality',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text(
                                  'Posted by',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12),
                                ),
                                Text(
                                  'Tyler',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      height:MediaQuery.of(context).size.height * 0.23,
                      child: Stack(
                        children: <Widget>[
                          // First image
                          Positioned(
                            bottom: 20,
                            left:15,
                            child: Container(
                              child: Transform.rotate(
                                angle: -0.3, // Adjust the rotation angle as needed
                                child: Container(
                                  height: MediaQuery.of(context).size.height * 0.14,
                                  child: Image.asset(
                                      'assets/images/covers/Rectangle3.png',fit: BoxFit.contain,),
                                ), // Replace with your first image asset
                              ),
                            ),
                          ),
                          // Second image
                          Positioned(
                            right: 5,
                            bottom:20,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.17,
                              
                              child: Transform.rotate(
                                angle: 0.1, // Adjust the rotation angle as needed
                                child: Image.asset(
                                    imageUrls[index],fit: BoxFit.contain,), // Replace with your second image asset
                              ),
                            ),
                          ),
                          Positioned(
          bottom: 0,
          left: 0,
          child:RoundedButton(
            title: "Try Now",
            onClick: () {},
            bgcolor: Colors.pink,
            width: 130,
            padding: 4,
            margin: 8,
          ),
        ),
                        ],
                      ),
                    ),

                    
                  ),
                ]),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 30,
        child: FloatingActionButton(
          onPressed: () {
            // Add your floating action button's onPressed logic here
          },
          child: const Icon(Icons.arrow_drop_down_outlined),
          backgroundColor: Colors.pink,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
