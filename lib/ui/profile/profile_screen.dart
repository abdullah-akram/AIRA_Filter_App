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
import 'package:aira_filter_app/ui/profile/notifications_screen.dart';
import 'package:aira_filter_app/ui/profile/profile_cover_screen.dart';
import 'package:aira_filter_app/ui/settings/settings_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileScreen extends StatelessWidget {
  double op = 0.3;

  bool toggle = false;
  String userNameTemp = "f";


Future<String> getUser() async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User? user = auth.currentUser;
  final uid = user?.uid;

  if (uid == null) {
    print('User is not signed in');
    return 'Marvin McsKinney';
  }

  try {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get();

    if (documentSnapshot.exists) {
      final userName = documentSnapshot.get('name'); // Replace 'name' with your field name
      print('Username: $userName');
      return userName.toString();
    } else {
      print('User document does not exist.');
      return 'Marvin McsKinney';
    }
  } catch (error) {
    print('Error retrieving user document: $error');
    return 'Marvin McsKinney';
  }
}



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: Home_AppBar(
        title: "Profile",
       
        tol: false,
      ),
      body: Stack(children: <Widget>[
        Opacity(
          opacity: op,
          child: CustomBackground(
            imagePath: '',
            opacity: 0.1,
          ),
        ),
          FutureBuilder<String>(
          future: getUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final userName = snapshot.data ?? 'Marvin McsKinney';
              return
        Column(
          children: [
            GestureDetector(
              onTap: () {
                 Navigator.push(
                     context, MaterialPageRoute(builder: (context) => ProfileCoverScreen()));
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.12,
                margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.1),
                ),
                child:  Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColor.pink,
                      backgroundImage: NetworkImage('your_image_url'),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          userName,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(FirebaseAuth.instance.currentUser!.email.toString(),
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w300)),
                      ],
                    ),
                    Spacer(),
                    CircleAvatar(
                      backgroundColor: AppColor.light,
                      child: Icon(
                        size: 16,
                        Icons.edit_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ...List.generate(6, (index) {
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
                                  builder: (context) => SettingsScreen()));
                          break;
                        case 1:
                          Navigator.push(
                              context,
                              MaterialPageRoute(       
                                  builder: (context) => NotificationScreen()));
                          break;
                        case 2:
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HelpDeskScreen()));
                          break;
                        case 3:
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HelpDeskScreen()));
                          break;
                        case 4:
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HelpDeskScreen()));
                          break;
                        case 5:
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HelpDeskScreen()));
                          break;
                      }
                    },
                    child: PlainSettingsItem(index: index, icons: profileItemIcons, texts: profileItemTexts, ),
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
        );
            }}),
    
        Positioned(
          left: 8,
          right: 8,
          bottom: 8,
          child: CustomAppBar(selectedItemIndex: 3),
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


