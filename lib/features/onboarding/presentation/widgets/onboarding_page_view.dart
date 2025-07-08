import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/onboarding_cubit.dart';
import '../../cubit/onboarding_state.dart';
import '../../data/dummy_onboarding_data.dart';

class OnboardingPageView extends StatelessWidget {
  final PageController controller;
  const OnboardingPageView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return PageView.builder(
          controller: controller,
          itemCount: onboardingData.length,
          onPageChanged: (index) {
            context.read<OnboardingCubit>().changePage(index);
          },
          itemBuilder: (context, index) {
            final data = onboardingData[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  data['image']!,
                  height: 250,
                ),
                const SizedBox(height: 20),
                Text(
                  data['title']!,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    fontFamily: AppFonts.montserrat,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  data['desc']!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
