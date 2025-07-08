import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/onboarding_cubit.dart';
import '../../cubit/onboarding_state.dart';
import '../../data/dummy_onboarding_data.dart';

class OnboardingButtons extends StatelessWidget {
  final PageController controller;

  const OnboardingButtons({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: state.currentPage > 0
                  ? () {
                      controller.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                      context.read<OnboardingCubit>().previousPage();
                    }
                  : null,
              child: const Text(
                'Prev',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                  color: Color.fromARGB(255, 43, 40, 41),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                if (state.currentPage < onboardingData.length - 1) {
                  controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                  context.read<OnboardingCubit>().nextPage();
                } else {
                  Navigator.pushReplacementNamed(context, '/home');
                }
              },
              child: Text(
                state.currentPage == onboardingData.length - 1
                    ? 'Get Started'
                    : 'Next',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                  color: Colors.pink,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
