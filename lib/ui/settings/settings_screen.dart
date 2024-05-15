import 'package:aira_filter_app/components/plain_settings_item.dart';
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
import 'package:aira_filter_app/ui/settings/account_screen.dart';
import 'package:aira_filter_app/ui/settings/privacy_screen.dart';
import 'package:aira_filter_app/ui/settings/security_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SettingsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
                     

    return Scaffold(
      appBar: Home_AppBar(title: "Settings",tol: false,leading: true,),
      body: Stack(children: <Widget>[
        Opacity(
          opacity: 0.3,
          child: CustomBackground(
            imagePath: '',
            opacity: 0.1,
          ), 
        ),
   Column(
          children: [
            ...List.generate(4, (index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      switch (index) {
                        case 0:
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PrivacyScreen()));
                          break;
                        case 1:
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AccountScreen()));
                          break;
                        case 2:
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SecurityScreen()));
                          break;
                        case 3:
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HelpDeskScreen()));
                          break;
                      
                      }
                    },
                    child: PlainSettingsItem(index: index, icons: settingsItemIcons, texts: settingsItemTexts,),
                  ),
                  if (index != 5)
                    Container(
                        margin: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                        child: const Divider(
                          thickness: BorderSide.strokeAlignCenter,
                        )), // Don't add a divider after the last item
                ],
              );
            }),
          ],
        ),
      

        
      ]
      
      ),

    );
  }
}
