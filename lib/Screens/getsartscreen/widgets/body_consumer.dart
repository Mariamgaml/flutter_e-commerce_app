import 'package:flutter/material.dart';

class HeaderTextWidget extends StatelessWidget {
  const HeaderTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        
        children: [
          Text(
            "You want",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 254, 254, 254),
            ),
          ),
          Text(
            "Authentic, here",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 250, 250, 250), // Adjust color as needed
            ),
          ),
          Text(
            "you go!",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 255, 255, 255), // Adjust color as needed
            ),
          ),
        ],
      ),
    );
  }
}