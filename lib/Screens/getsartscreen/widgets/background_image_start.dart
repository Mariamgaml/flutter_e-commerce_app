import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_images.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
            width : double.infinity,
        height : double.infinity,
           decoration: BoxDecoration(
           image: DecorationImage(
            image: AssetImage(
                AppImages.getss,), 
                fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
