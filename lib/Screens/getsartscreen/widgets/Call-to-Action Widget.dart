// ignore_for_file: file_names

import 'package:flutter/material.dart' show BuildContext, Center, Colors, EdgeInsets, Padding, StatelessWidget, Text, TextStyle, Widget;

class CTAWidget extends StatelessWidget {
  const CTAWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: Text(
          "Find it here, buy it now!",
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey[700],
          ),
        ),
      ),
    );
  }
}