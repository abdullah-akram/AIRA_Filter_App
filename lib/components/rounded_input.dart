import 'package:aira_filter_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RoundedInput extends StatelessWidget {
  final String hintText;
  final TextInputType type;
  final TextEditingController? controller;

   RoundedInput({required this.hintText,required this.type, this.controller  });


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Makes the input field match the screen width
      margin: const EdgeInsets.all(4), // Margin on all sides
      child: TextField(
        controller: controller,
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
