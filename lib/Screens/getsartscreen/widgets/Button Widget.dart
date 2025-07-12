// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/homescreen/homepage.dart';


class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
        Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => StylishHomePage()),
  );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.pink,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
          child: Text(
            "Get Started",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
