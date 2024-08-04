import 'package:aira_filter_app/constants/colors.dart';
import 'package:aira_filter_app/ui/filter_cover/filter_cover.dart';
import 'package:aira_filter_app/ui/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home_AppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onSearchPressed;
  final double opacity;
  final Color color;
  final bool tol;
  final bool leading;

  const Home_AppBar({
    Key? key,
    required this.title,
    this.onSearchPressed,
    this.opacity = 0.1,
    this.color =  AppColor.pink,
    this.tol = true,
    this.leading = false

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     void defaultOnSearchPressed() {
 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchScreen()),
                );  }
                
    return   AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Color.fromARGB(255, 87, 23, 49)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        title: Text(title),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Define the action for the back button here
          },
        ));
    
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
