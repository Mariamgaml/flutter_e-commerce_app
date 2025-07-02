import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/onboarding/presentation/pages/splash_page.dart';
import 'package:flutter_application_1/features/onboarding/presentation/pages/onboarding_page.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const SplashPage(),
  '/onboarding': (context) => const OnboardingPage(),
  '/home': (context) => const Scaffold(
        body: Center(child: Text('Home Page')), 
      ),
};
