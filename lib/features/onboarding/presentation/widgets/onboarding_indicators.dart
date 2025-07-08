import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/onboarding_cubit.dart';
import '../../cubit/onboarding_state.dart';
import '../../data/dummy_onboarding_data.dart';

class OnboardingIndicators extends StatelessWidget {
  final PageController controller;

  const OnboardingIndicators({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            onboardingData.length,
            (index) => GestureDetector(
              onTap: () {
                controller.jumpToPage(index);
                context.read<OnboardingCubit>().changePage(index);
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: state.currentPage == index ? 32 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: state.currentPage == index
                      ? const Color.fromARGB(255, 0, 0, 0)
                      : Colors.grey,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
