import 'package:aira_filter_app/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomBackground extends StatelessWidget {
  final String imagePath;
  final double opacity;

  CustomBackground({required this.imagePath, this.opacity = 0.5});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
           transform: const GradientRotation(8),
          colors: [Colors.pink.withOpacity(0.0), Colors.black,Colors.pink.withOpacity(0.1)],
          stops: [0.0, 0.5,1.0],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
      ),
    ),
    Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          transform: const GradientRotation(7),
          colors: [Colors.pink.withOpacity(0.0), Colors.black,Colors.pink.withOpacity(0.1)],
          stops:  [0.0, 0.5,1.0],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    ),
        Opacity(
          opacity: opacity,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
