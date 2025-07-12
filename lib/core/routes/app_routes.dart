import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/getsartscreen/get_started.dart';
import 'package:flutter_application_1/Screens/homescreen/homepage.dart';
import 'package:flutter_application_1/features/authentication/presentation/pages/forgot_password_page.dart';
import 'package:flutter_application_1/features/authentication/presentation/pages/login_page.dart';
import 'package:flutter_application_1/features/authentication/presentation/pages/register_page.dart';
import 'package:flutter_application_1/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:flutter_application_1/features/onboarding/presentation/pages/splash_page.dart';




class AppRoutes {
  static const String initial = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgotPassword = '/forgot-password';
  static const String home = '/home'; 
  static const String getstarted ='/getstarted';

  static final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    initial: (context) => const SplashPage(),
    
    onboarding: (context) => const OnboardingPage(),
    
    login: (context) => const LoginPage(),
    signup: (context) => const SignUpPage(),
    forgotPassword: (context) => const ForgotPasswordPage(),
    getstarted:(context) => const AuthenticScreen(),
    home: (context) => widget(child: StylishHomePage()),
 
  };
}

widget({required StylishHomePage child}) {
}




