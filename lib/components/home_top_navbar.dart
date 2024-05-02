import 'package:aira_filter_app/constants/colors.dart';
import 'package:flutter/material.dart';

class Home_AppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onSearchPressed;
  final double opacity;
  final Color color;

  const Home_AppBar({
    Key? key,
    required this.title,
    required this.onSearchPressed,
    this.opacity = 0.1,
    this.color =  AppColor.pink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  AppBar(
        backgroundColor: color.withOpacity(opacity),
        elevation: 0,
        title: Text(title),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: onSearchPressed,
          ),
        ],
      );
    
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
