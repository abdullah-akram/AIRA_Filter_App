import 'dart:ui';

import 'package:aira_filter_app/constants/colors.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final VoidCallback onClick;
  final Color bgcolor;
  final double width;
  final double padding;
  final double margin;

  RoundedButton({
    required this.title,
    required this.onClick,
    required this.bgcolor,
    this.width = double.infinity,
    this.padding = 16,
    this.margin = 8
  });

 

  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width, // Makes the button match the screen width
      margin: EdgeInsets.all(margin), // Margin on all sides
      child: ElevatedButton(
        onPressed: onClick, // Use the passed onClick function
        child: Text(title),
        style: ElevatedButton.styleFrom(
          foregroundColor: (bgcolor == AppColor.dark_1) ? AppColor.light : AppColor.dark_1,
          backgroundColor: bgcolor, // Use the passed color
          textStyle: const TextStyle(color:AppColor.dark_1, fontWeight: FontWeight.w600,fontSize: 13
          ), // Text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // Rounded border
          ),
          padding: EdgeInsets.symmetric(vertical: padding), // Padding inside the button
        ),
      ),
    );
  }





  
}
