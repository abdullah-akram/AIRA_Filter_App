import 'package:aira_filter_app/components/rounded_settings_item.dart';
import 'package:aira_filter_app/components/rounded_toggle_settings_item.dart';
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

class PrivacyScreen extends StatefulWidget {
  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Home_AppBar(
        title: "Privacy",
      
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(margin: EdgeInsets.only(left: 15), child: const Text("Account Privacy", style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold))),
           RoundedToggleSettingsItem(index: 0, icons: privacyItemIcons, texts: privacyItemTexts),
              Container(margin: EdgeInsets.only(left: 15), child: const Text("Interactions", style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold))),
           RoundedSettingsItem(index: 1, icons: privacyItemIcons, texts: privacyItemTexts),
           RoundedSettingsItem(index: 2, icons: privacyItemIcons, texts: privacyItemTexts),
           RoundedSettingsItem(index: 3, icons: privacyItemIcons, texts: privacyItemTexts),
              Container(margin: EdgeInsets.only(left: 15), child: const Text("Connections", style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold))),

           RoundedSettingsItem(index: 4, icons: privacyItemIcons, texts: privacyItemTexts),
           RoundedSettingsItem(index: 5, icons: privacyItemIcons, texts: privacyItemTexts),

            ],
          ),
        ),
      ]),
    );
  }
}
