import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_icons.dart';
import 'package:flutter_application_1/core/constants/app_strings.dart';

import 'package:flutter_application_1/features/authentication/data/services/google_sign_in_service.dart';
// import 'package:flutter_application_1/features/authentication/data/services/apple_sign_in_service.dart';
import 'package:flutter_application_1/features/authentication/data/services/facebook_sign_in_service.dart';

class SocialButtonsRow extends StatelessWidget {
  const SocialButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Google
        IconButton(
          icon: Image.asset(AppIcons.google, height: 30),
          onPressed: () async {
            final user = await GoogleSignInService().signInWithGoogle();
            if (user != null) {
              // ignore: prefer_interpolation_to_compose_strings
              print(AppStrings.googlesucess + ' ${user.email}');
             
            } else {
              print(AppStrings.googlefaild);
            }
          },
        ),

        const SizedBox(width: 20),

   
        IconButton(
          icon: Image.asset(AppIcons.facebook, height: 30),
          onPressed: () async {
            final user = await FacebookAuthService().signInWithFacebook();
            if (user != null) {
              // ignore: prefer_interpolation_to_compose_strings
              print(AppStrings.facebooksucess + ' ${user.email}');
            } else {
              print(AppStrings.facebookfaild);
            }
          },
        ),

        const SizedBox(width: 20),

        // Apple
        IconButton(
          icon: Image.asset(AppIcons.apple, height: 30),
          onPressed: () async {
            // final user = await AppleSignInService().signInWithApple();
            // if (user != null) {
            //   print('✅ Apple sign-in: ${user.email}');
            // } else {
            //   print('❌ Apple sign-in failed');
            // }
          },
        ),
      ],
    );
  }
}
