import 'package:aira_filter_app/components/login_background.dart';
import 'package:flutter/material.dart';

class BackNavBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  

  BackNavBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
         CustomBackground(
            imagePath: '', // Replace with your background image path
            opacity: 0.2, // Adjust opacity as needed
          ), // Your custom background
        AppBar(
          backgroundColor: Colors.transparent, // Transparent background
          elevation: 0, // No shadow
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white), // Back button
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            title,
            style: TextStyle(color: Colors.white), // Text
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
