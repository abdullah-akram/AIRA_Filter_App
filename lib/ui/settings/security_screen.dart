import 'package:aira_filter_app/components/rounded_settings_item.dart';
import 'package:aira_filter_app/data/profile_lists.dart';
import 'package:aira_filter_app/ui/home/Story_List.dart';
import 'package:aira_filter_app/components/bottom_toolbar.dart';
import 'package:aira_filter_app/ui/home/home_top_navbar.dart';
import 'package:aira_filter_app/ui/home/home_trending_item.dart';
import 'package:aira_filter_app/ui/home/home_try_item.dart';
import 'package:aira_filter_app/components/login_background.dart';
import 'package:aira_filter_app/components/rounded_button.dart';
import 'package:aira_filter_app/constants/colors.dart';
import 'package:aira_filter_app/data/imageList.dart';
import 'package:aira_filter_app/ui/profile/help_desk_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SecurityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Home_AppBar(
        title: "Security",
      
        tol: false,
        leading: true,
      ),
      body: Stack(children: <Widget>[
        Opacity(
          opacity: 0.3,
          child: CustomBackground(
            imagePath: '',
            opacity: 0.1,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              ...List.generate(3, (index) {
                return Column(
                  
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        switch (index) {
                          case 0:
                            //    Navigator.push(
                            //       context,
                            //     MaterialPageRoute(
                            //       builder: (context) => HelpDeskScreen()));
                            print("Technical Issues");
                            break;
                          case 1:
                          

                            print("Subscription");
                            break;
                          case 2:
                            print("AiRa Artists");
                            break;
                         
                        }
                      },
                      child:   RoundedSettingsItem(index:index,icons: securityItemIcons, texts: securityItemTexts, ),
                    ),
                  ],
                );
              }),
           
   
            ],
          ),
        ),
      ]),
    );
  }
}
