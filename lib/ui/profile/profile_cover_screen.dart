import 'package:aira_filter_app/components/rounded_settings_item.dart';
import 'package:aira_filter_app/components/rounded_toggle_settings_item.dart';
import 'package:aira_filter_app/constants/colors.dart';
import 'package:aira_filter_app/data/profile_lists.dart';
import 'package:aira_filter_app/ui/home/home_top_navbar.dart';
import 'package:aira_filter_app/components/login_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileCoverScreen extends StatefulWidget {
  @override
  State<ProfileCoverScreen> createState() => _ProfileCoverScreenState();
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
        Container(
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

                    Container(margin: const EdgeInsets.only(left: 15,top: 15), child: const Text("Personal Details", style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold))),
           const RoundedProfileItem( icons: Icons.edit_outlined, texts: "Name"),
           const RoundedProfileItem( icons: Icons.edit_outlined, texts: "Email"),
           const RoundedProfileItem( icons: Icons.remove_red_eye_sharp, texts: "Password"),
              Container(margin: const EdgeInsets.only(left: 25), child: const Text("Change Password", style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: AppColor.pink))),

           const RoundedProfileItem( icons: Icons.arrow_drop_down_outlined, texts: "Gender"),
           const RoundedProfileItem( icons: Icons.calendar_month_outlined, texts: "Date Of Birth"),

            ],
          ),
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

