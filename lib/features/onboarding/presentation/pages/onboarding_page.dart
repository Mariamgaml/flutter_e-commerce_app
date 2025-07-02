import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../providers/onboarding_provider.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  final List<Map<String, String>> onboardingData = const [
    {
      'image': 'assets/images/onboarding1.png',
      'title': 'Choose Products',
      'desc':
          'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.'
    },
    {
      'image': 'assets/images/onboarding2.png',
      'title': 'Make Payment',
      'desc':
          'Velit officia consequat duis enim velit mollit. Exercitation veniam consequat.'
    },
    {
      'image': 'assets/images/onboarding3.png',
      'title': 'Get Your Order',
      'desc':
          'Velit officia consequat duis enim velit mollit. Exercitation veniam consequat.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final onboardingProvider = Provider.of<OnboardingProvider>(context);
    final controller = onboardingProvider.pageController;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/home'),
                child: const Text('Skip'),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: controller,
                itemCount: onboardingData.length,
                onPageChanged: (index) {
                  onboardingProvider.setCurrentPage(index);
                },
                itemBuilder: (context, index) {
                  final data = onboardingData[index];
                  return Column(
                    children: [
                      Expanded(
                        child: Image.asset(data['image']!),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        data['title']!,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        data['desc']!,
                        textAlign: TextAlign.center,
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                (index) => GestureDetector(
                  onTap: () => onboardingProvider.jumpToPage(index),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: onboardingProvider.currentPage == index ? 12 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: onboardingProvider.currentPage == index
                          ? Colors.red
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: onboardingProvider.currentPage > 0
                      ? () => onboardingProvider.goToPreviousPage()
                      : null,
                  child: const Text('Prev'),
                ),
                TextButton(
                  onPressed: () {
                    if (onboardingProvider.currentPage <
                        onboardingData.length - 1) {
                      onboardingProvider.goToNextPage();
                    } else {
                      Navigator.pushReplacementNamed(context, '/home');
                    }
                  },
                  child: Text(onboardingProvider.currentPage ==
                          onboardingData.length - 1
                      ? 'Get Started'
                      : 'Next'),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
