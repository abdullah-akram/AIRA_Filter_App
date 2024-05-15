import 'package:aira_filter_app/components/rounded_button.dart';
import 'package:aira_filter_app/constants/colors.dart';
import 'package:aira_filter_app/ui/auth/create_account_screen.dart';
import 'package:aira_filter_app/components/login_background.dart';
import 'package:aira_filter_app/ui/discover/discover_screen.dart';
import 'package:aira_filter_app/ui/home/home_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../components/rounded_input.dart';

class ProOfferScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          CustomBackground(
            imagePath:
                'assets/images/background_carousal.png', // Replace with your background image path
            opacity: 0.2, // Adjust opacity as needed
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 40),
                  child: Image.asset(
                    'assets/images/sara_shakeel_logo.png',
                    height: 80,
                    width: 150,
                  ),
                ),

                const Text(
                  textAlign: TextAlign.center,
                  'Try AiRa Pro',
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'Roboto_Mono',
                    height: 1.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                Container(
                  margin: const EdgeInsets.fromLTRB(10, 10, 10, 50),
                  child: const Text(
                    textAlign: TextAlign.center,
                    '1 Month Free Trial. No Card Required.',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Roboto_Mono',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),

                const ProTextWidget(text: "Original Effects & Filters"),
                const ProTextWidget(text: "Advanced Editing Tools"),
                const ProTextWidget(text: "Weekly Updates"),
                const ProTextWidget(text: "Retouch Toolkit"),
                const ProTextWidget(text: "10k+ Presets"),
               
               Expanded(child: Container(),),

                const Text("5.99/Month",style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Roboto_Mono',
                      fontWeight: FontWeight.bold,
                    )),

                const Text("Auto-renewable. Cancel Anytime.",style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Roboto_Mono',
                      fontWeight: FontWeight.w300,
                    )),

                //create an edittext widget rounded
                RoundedButton(
                  title: 'Upgrade Now',
                  onClick: () {
                   // Navigator.push(
                    //  context,
                     // MaterialPageRoute(builder: (context) => HomeScreen()),
                   // );
                  },

                  bgcolor: AppColor.pink, // Button color
                ),
                const Text("Terms of Use | Privacy Policy",
                    style: TextStyle(
                      fontSize: 11,
                      fontFamily: 'Roboto_Mono',
                      fontWeight: FontWeight.w300,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProTextWidget extends StatelessWidget {
  final String text;
  const ProTextWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(55, 5, 5, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 10,
            backgroundColor: AppColor.pink,
            child: Icon(
              Icons.check,
              size: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
