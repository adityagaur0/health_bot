import 'package:flutter/material.dart';

class CircularImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Outer circle
        Container(
          width: 240, // Adjust size as needed
          height: 240, // Adjust size as needed
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF6A1B9A), // Outer circle color
          ),
        ),
        // Inner circle
        Container(
          width: 200, // Adjust size as needed
          height: 200, // Adjust size as needed
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFBA68C8), // Inner circle color
          ),
        ),
        // Image
        ClipOval(
          child: SizedBox(
            width: 100, // Adjust size as needed
            height: 160, // Adjust size as needed
            child: Image.asset(
              'assets/images/on_boarding_images/dadi_final.png', // Path to your image
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
