import 'package:aira_filter_app/constants/colors.dart';
import 'package:flutter/material.dart';

class RoundedInput extends StatelessWidget {
  final String hintText;
  final TextInputType type;

  const RoundedInput({required this.hintText,required this.type});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Makes the input field match the screen width
      margin: const EdgeInsets.all(4), // Margin on all sides
      child: TextField(
        
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide.none
          ),
          filled: true,
          hintStyle: const TextStyle(color: AppColor.light,fontWeight: FontWeight.w300,fontSize: 13),
          hintText: hintText,
          fillColor: AppColor.dark_2,
          contentPadding: const EdgeInsets.all(14), // Padding inside the input field
        ),
      ),
    );
  }
}
