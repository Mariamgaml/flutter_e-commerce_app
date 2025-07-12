import 'package:firebase_auth/firebase_auth.dart';



abstract class SignupState{}


class AuthInitial extends SignupState {}


class AuthLoading extends SignupState {}


class AuthSuccess extends SignupState {
  final User user;
  AuthSuccess(this.user);
}


class SignupFailure extends SignupState {
  final String message;
  SignupFailure(this.message);
}
