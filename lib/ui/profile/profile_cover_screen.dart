import 'package:aira_filter_app/components/rounded_settings_item.dart';
import 'package:aira_filter_app/components/rounded_toggle_settings_item.dart';
import 'package:aira_filter_app/constants/colors.dart';
import 'package:aira_filter_app/data/profile_lists.dart';
import 'package:aira_filter_app/ui/home/home_top_navbar.dart';
import 'package:aira_filter_app/components/login_background.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileCoverScreen extends StatefulWidget {
  @override
  State<ProfileCoverScreen> createState() => _ProfileCoverScreenState();
}

Future<Map<String, String>> getUser() async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User? user = auth.currentUser;
  final uid = user?.uid;

  if (uid == null) {
    print('User is not signed in');
    return {'name': 'Marvin McsKinney', 'email': 'No Email'};
  }

  try {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get();

    if (documentSnapshot.exists) {
      final userName = documentSnapshot.get('name'); // Replace 'name' with your field name
      final email = user?.email ?? 'No Email';
      print('Username: $userName');
      return {'name': userName.toString(), 'email': email};
    } else {
      print('User document does not exist.');
      return {'name': 'Marvin McsKinney', 'email': 'No Email'};
    }
  } catch (error) {
    print('Error retrieving user document: $error');
    return {'name': 'Marvin McsKinney', 'email': 'No Email'};
  }
}


class _ProfileCoverScreenState extends State<ProfileCoverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Home_AppBar(
        title: "Profile",
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
        FutureBuilder<Map<String, String>>(
          future: getUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final userName = snapshot.data?['name'] ?? 'Marvin McsKinney';
              final userEmail = snapshot.data?['email'] ?? 'No Email';
              return Container(
                margin: const EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: AppColor.pink,
                        backgroundImage: NetworkImage('your_image_url'),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text("Personal Details",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold))),
                    RoundedProfileItem(
                        icons: Icons.edit_outlined, texts: userName),
                    RoundedProfileItem(
                        icons: Icons.edit_outlined, texts: userEmail),
                    const RoundedProfileItem(
                        icons: Icons.remove_red_eye_sharp, texts: "Password"),
                    Container(
                        margin: const EdgeInsets.only(left: 25),
                        child: const Text("Change Password",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: AppColor.pink))),
                    const RoundedProfileItem(
                        icons: Icons.arrow_drop_down_outlined, texts: "Gender"),
                    const RoundedProfileItem(
                        icons: Icons.calendar_month_outlined,
                        texts: "Date Of Birth"),
                  ],
                ),
              );
            }
          },
        ),
      ]),
    );
  }
}

class RoundedProfileItem extends StatelessWidget {
  final IconData icons;
  final String texts;
  const RoundedProfileItem({
    super.key,  required this.icons, required this.texts,
  });


  

  @override
  Widget build(BuildContext context) {
    return Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    margin: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white.withOpacity(0.1),
                    ),
                    child:  Row(
                      children: [
                       
                        const SizedBox(width: 10),
                        Text(
    texts,
    style: const TextStyle(
        fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                         CircleAvatar(
          backgroundColor: AppColor.light,
          child: Icon(
            size: 16,
            icons,
            color: Colors.black,
          ),
        ),
                      ],
                    ),
                  );
  }
}

