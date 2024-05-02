import 'dart:math';
import 'dart:ui';

import 'package:aira_filter_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class CustomAppBar extends StatefulWidget {
  final int selectedItemIndex;

  CustomAppBar({required this.selectedItemIndex});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

bool toggle = true;

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2), // Padding on all sides
      margin: EdgeInsets.all(8), // Margin on all sides
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30), // Rounded sides
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(0.5), // Transparent
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(
                    context, Icons.home_outlined, Icons.home_filled, 0),
                _buildNavItem(
                    context, Icons.explore_outlined, Icons.explore_rounded, 1),
                SizedBox(width: 48), // Same width as the FAB
                _buildNavItem(context, Icons.favorite_outline_rounded,
                    Icons.favorite_rounded, 2),
                _buildNavItem(context, Icons.person_outline_rounded,
                    Icons.person_rounded, 3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
      BuildContext context, IconData icon, IconData iconfilled, int index) {
    return Stack(
      children: [
        IconButton(
          icon: Icon(widget.selectedItemIndex == index ? iconfilled : icon,
              color: widget.selectedItemIndex == index
                  ? Colors.pink
                  : Colors.white),
          onPressed: () {
            switch (index) {
              case 0:
                Navigator.pushNamed(context, '/home');

                break;
              case 1:
                Navigator.pushNamed(context, '/discover');
                break;
              case 2:
                Navigator.pushNamed(context, '/favorites');
                break;
              // case 3:
              //   Navigator.pushNamed(context, '/profile');
              //   break;
            }
          },
        ),
        Positioned(
          bottom: -5,
          left: 0,
          right: 0,
          child: Visibility(
            visible: widget.selectedItemIndex == index,
            child: Container(
              height: 10,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.pink,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomFloatingActionButton extends StatefulWidget {
  @override
  State<CustomFloatingActionButton> createState() =>
      _CustomFloatingActionButtonState();
}

class _CustomFloatingActionButtonState extends State<CustomFloatingActionButton>
    with TickerProviderStateMixin {
  AnimationController? _controller;
  late Animation _animation;
  
Alignment alignment1 = Alignment(0, 0);
Alignment alignment2 = Alignment(0, 0);


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 350),
      reverseDuration: Duration(milliseconds: 270),
    );

    _animation = CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    );

    _controller!.addListener(() {
      setState(() {});
    });
  }


  @override
  Widget build(BuildContext context) {

    return Container(
      child: Stack(
        children: [
          AnimatedAlign(
            duration: toggle ? Duration(milliseconds: 275) : Duration(milliseconds: 875),
            alignment:alignment1,
            curve: toggle ? Curves.easeIn : Curves.elasticOut,
            child: AnimatedContainer(
              duration: toggle
                  ? Duration(milliseconds: 275)
                  : Duration(milliseconds: 875),
              curve: toggle ? Curves.easeIn : Curves.easeOut,
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: AppColor.dark_1,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Icon(
                Icons.camera,
                color: AppColor.light,
              ),
            ),
          ),
      
       AnimatedAlign(
            duration: toggle ? Duration(milliseconds: 275) : Duration(milliseconds: 875),
            alignment:alignment2,
            curve: toggle ? Curves.easeIn : Curves.elasticOut,
            child: AnimatedContainer(
              duration: toggle
                  ? Duration(milliseconds: 275)
                  : Duration(milliseconds: 875),
              curve: toggle ? Curves.easeIn : Curves.easeOut,
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: AppColor.dark_1,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Icon(
                Icons.camera,
                color: AppColor.light,
              ),
            ),
          ),
      
        
          Transform.rotate(
            angle: _animation.value * (3 / 4),
            child: Align(
              alignment: Alignment.center,
              child: AnimatedContainer(
                curve: Curves.easeOut,
                duration: Duration(milliseconds: 300),
                height: toggle ? 56 : 50,
                width: toggle ? 56 : 50,
                child: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (toggle) {
                        toggle = !toggle;
                        _controller!.forward();
                        Future.delayed(Duration(milliseconds: 10) , (){
              alignment1 = Alignment(-0.5, -0.3);
                        } );
                         Future.delayed(Duration(milliseconds: 10) , (){
              alignment2 = Alignment(0.5, -0.3);
                        } );
                      } else {
                        toggle = !toggle;
                        _controller!.reverse();
                        alignment1 = Alignment(0,0);
                        alignment2 = Alignment(0,0);
                      }
                    });
                  },
                  child: Icon(
                    Icons.add,
                    color: toggle ? AppColor.dark_1 : AppColor.light,
                  ),
                  backgroundColor: toggle ? AppColor.pink : AppColor.dark_1,
                  shape: CircleBorder(), // Round shape
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
