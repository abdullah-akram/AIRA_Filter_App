import 'package:aira_filter_app/components/login_background.dart';
import 'package:aira_filter_app/constants/colors.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          height: 50,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.fromLTRB(5, 0,5,5),
          margin: const EdgeInsets.fromLTRB(2,10,2,5),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: 'Search',
              alignLabelWithHint: true,
              filled: true,
              hintStyle: TextStyle(fontSize: 14),
              fillColor: AppColor.dark_2,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35),
                borderSide: BorderSide.none,
              
              ),
            ),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,

      body: Stack(children: [
        Opacity(
          opacity: 0.3,
          child: CustomBackground(
            imagePath: '',
            opacity: 0.1,
          ),
        ),
        const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "What's on your mind?",
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Text(
                'Search by mood, aesthetic or even color',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
