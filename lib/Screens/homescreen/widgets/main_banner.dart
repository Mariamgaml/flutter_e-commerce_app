import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_images.dart';

class MainBanner extends StatelessWidget {
  const MainBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.pinkAccent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('50-40% OFF', style: TextStyle(fontSize: 24, color: Colors.white)),
                  SizedBox(height: 10),
                  Text('Now in (product)\nAll colours', style: TextStyle(color: Colors.white70)),
                  SizedBox(height: 10),
                  ElevatedButton(onPressed: null, child: Text('Shop Now'))
                ],
              ),
            ),
            Image.asset(AppImages.banner, height: 100)
          ],
        ),
      ),
    );
  }
}