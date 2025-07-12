import 'package:flutter/material.dart';

import 'package:flutter_application_1/Screens/getsartscreen/widgets/background_image_start.dart';
import 'package:flutter_application_1/Screens/getsartscreen/widgets/consumer_container.dart';

class AuthenticScreen extends StatelessWidget {
  const AuthenticScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImagePage(),
        CustomDartContainer(),
      ],
    );
  }
}
