import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/routes/app_routes.dart';
import '../widgets/onboarding_page_view.dart';
import '../widgets/onboarding_indicators.dart';
import '../widgets/onboarding_buttons.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, AppRoutes.login),
                  child: const Text('Skip'),
                ),
              ),
              Expanded(child: OnboardingPageView(controller: _pageController)),
              OnboardingIndicators(controller: _pageController),
              const SizedBox(height: 20),
              OnboardingButtons(controller: _pageController),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
