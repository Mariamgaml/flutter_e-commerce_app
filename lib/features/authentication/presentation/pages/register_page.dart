import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/core/constants/app_strings.dart';
import 'package:flutter_application_1/features/authentication/data/repositories/firebase_auth_repository.dart';
import 'package:flutter_application_1/features/authentication/presentation/widgets/auth_text_field.dart';
import 'package:flutter_application_1/features/authentication/presentation/widgets/social_buttons.dart';
import 'package:flutter_application_1/features/authentication/presentation/cubit/signup_cubit.dart';
import 'package:flutter_application_1/features/authentication/presentation/cubit/signup_state.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignupCubit(FirebaseAuthRepository()),
      child: const SignUpView(),
    );
  }
}

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void _onSignupPressed(BuildContext context) {
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    final confirm = _confirmPasswordController.text;

    if (password != confirm) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(AppStrings.errorpassword)),
      );
      return;
    }

    context.read<SignupCubit>().signUp(email: email, password: password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<SignupCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text(AppStrings.accountsuccesscreat)),
              );
              Navigator.pushReplacementNamed(context, '/home');
            } else if (state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 32),
                  const Text(
                    AppStrings.creactaccount,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppFonts.montserrat,
                    ),
                  ),
                  const SizedBox(height: 32),
                  AuthTextField(
                    controller: _emailController,
                    hintText: AppStrings.usernameoremail,
                    icon: Icons.person,
                  ),
                  const SizedBox(height: 16),
                  AuthTextField(
                    controller: _passwordController,
                    hintText: AppStrings.password,
                    icon: Icons.lock,
                    isPassword: true,
                  ),
                  const SizedBox(height: 16),
                  AuthTextField(
                    controller: _confirmPasswordController,
                    hintText: AppStrings.confirmpassword,
                    icon: Icons.lock,
                    isPassword: true,
                  ),
                  const SizedBox(height: 8),
                  RichText(
                    text: const TextSpan(
                      text: AppStrings.clicking,
                      style: TextStyle(color: Colors.black54),
                      children: [
                        TextSpan(
                          text: AppStrings.register,
                          style: TextStyle(color: Colors.red),
                        ),
                        TextSpan(text:AppStrings.youagree),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: state is AuthLoading ? null : () => _onSignupPressed(context),
                      child: state is AuthLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(AppStrings.signupbutton),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Center(child: Text(AppStrings.loginOr)),
                  const SizedBox(height: 16),
                  const SocialButtonsRow(),
                  const SizedBox(height: 16),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context); // رجوع إلى صفحة تسجيل الدخول
                      },
                      child: const Text.rich(
                        TextSpan(
                          text: AppStrings.haveaccount,
                          children: [
                            TextSpan(
                              text: AppStrings.login,
                              style: TextStyle(color: Colors.pink),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
