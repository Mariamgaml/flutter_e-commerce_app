import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/authentication/presentation/pages/login_page.dart';
import 'package:flutter_application_1/features/authentication/presentation/pages/register_page.dart';
import 'package:flutter_application_1/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:flutter_application_1/features/onboarding/presentation/pages/splash_page.dart';

class AppRoutes {
  static const String initial = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signup';

  static final Map<String, WidgetBuilder> routes = {
    initial: (context) => const SplashPage(),
    
    onboarding: (context) => const OnboardingPage(),
    
    login: (context) => const LoginPage(),
    signup: (context) => const SignUpPage(), // Assuming you have a SignupPage
  };
}



