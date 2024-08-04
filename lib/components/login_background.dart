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
            gradient: RadialGradient(
              center: Alignment.topRight,
              radius: 2.0, // Increased radius for more coverage
              colors: [
                AppColor.pink.withOpacity(1.0), // Increased opacity for more intensity
                Colors.transparent,
              ],
              stops: [0.0, 1.0],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.bottomLeft,
              radius: 2.0, // Increased radius for more coverage
              colors: [
                AppColor.pink.withOpacity(1.0), // Increased opacity for more intensity
                Colors.transparent,
              ],
              stops: [0.0, 1.0],
            ),
          ),
        ),
        Container(
          color: Colors.black.withOpacity(0.7), // Adjust the overall dark overlay for better contrast
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
