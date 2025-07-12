import 'package:flutter_application_1/features/authentication/data/models/user_model.dart';


abstract class AuthState {
  const AuthState();
}


class AuthInitial extends AuthState {}

// حالة التحميل (لجميع العمليات)
class AuthLoading extends AuthState {}

// حالات النجاح
class LoginSuccess extends AuthState {
  final UserModel userModel;
  const LoginSuccess(this.userModel);
}

class SignUpSuccess extends AuthState {
  // ignore: unused_field
  final UserModel userModel;
  const SignUpSuccess(this.userModel);
}

class ResetPasswordSent extends AuthState {}

// حالات الفشل
class AuthError extends AuthState {
  final String message;
  const AuthError(this.message);
}