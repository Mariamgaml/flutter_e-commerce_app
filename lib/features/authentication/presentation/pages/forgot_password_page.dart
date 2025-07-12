import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/authentication/presentation/cubit_subbase/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/core/routes/app_routes.dart';
import 'package:flutter_application_1/features/authentication/presentation/widgets/auth_text_field.dart';

import 'package:flutter_application_1/features/authentication/presentation/cubit_subbase/state.dart' as auth_state;

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, auth_state.AuthState>(
      listener: (context, state) {
        if (state is auth_state.ResetPasswordSent) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('A password reset link has been sent to your email.'),
            ),
          );
          Future.delayed(const Duration(seconds: 2), () {
            // ignore: use_build_context_synchronously
            Navigator.pushReplacementNamed(context, AppRoutes.login);
          });
        } else if (state is auth_state.AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to send reset link: ${state.message}')),
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                const Text(
                  'Forgot\npassword?',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 32),
                AuthTextField(
                  controller: _emailController,
                  hintText: 'Enter your email address',
                  icon: Icons.email,
                ),
                const SizedBox(height: 8),
                const Text(
                  '* We will send you a message to set or reset your new password',
                  style: TextStyle(color: Colors.black54, fontSize: 12),
                ),
                const SizedBox(height: 24),
                BlocBuilder<AuthCubit, auth_state.AuthState>(
                  builder: (context, state) {
                    return SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: state is auth_state.AuthLoading
                            ? null
                            : () {
                                final email = _emailController.text.trim();
                                context.read<AuthCubit>().resetPassword(email);
                              },
                        child: state is auth_state.AuthLoading
                            ? const CircularProgressIndicator(color: Colors.white)
                            : const Text('Submit'),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}