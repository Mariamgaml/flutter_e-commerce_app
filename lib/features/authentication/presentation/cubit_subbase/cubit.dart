

import 'package:bloc/bloc.dart';

import 'package:flutter_application_1/features/authentication/domain/repositories/auth_repository2.dart';
import 'package:flutter_application_1/features/authentication/presentation/cubit_subbase/state.dart' as auth_state;







class AuthCubit extends Cubit<auth_state.AuthState> {
  final AuthRepository1 authRepository1;

  AuthCubit(this.authRepository1) : super(auth_state.AuthInitial());

  // تسجيل الدخول

  Future<void> SigninUSeCase(String email, String password) async {
    emit(auth_state.AuthLoading());
    try {
      final result = await authRepository1.signIn(email, password);
      result.fold(
        (failure) => emit(auth_state.AuthError(failure.message)),
        (UserModel) => emit(auth_state.LoginSuccess(UserModel)),
      );
    } catch (e) {
      emit(auth_state.AuthError(e.toString()));
    }
  }

  // إنشاء حساب جديد

  Future<void> SignUpSupabaseUseCase(String email, String password) async {
    emit(auth_state.AuthLoading());
    try {
      final result = await authRepository1.signUp(email, password);
      result.fold(
        (failure) => emit(auth_state.AuthError(failure.message)),
        (UserModel) => emit(auth_state.SignUpSuccess(UserModel)),
      );
    } catch (e) {
      emit(auth_state.AuthError(e.toString()));
    }
  }


  Future<void> resetPassword(String email) async {
    emit(auth_state.AuthLoading());
    try {
      final result = await authRepository1.resetPassword(email);
      result.fold(
        (failure) => emit(auth_state.AuthError(failure.message)),
        (_) => emit(auth_state.ResetPasswordSent()),
      );
    } catch (e) {
      emit(auth_state.AuthError(e.toString()));
    }
  }

 
//   Future<void> logout() async {
//     emit(auth_state.AuthLoading());
//     try {
//       await authRepository1.signOut();
//       emit(auth_state.AuthInitial());
//     } catch (e) {
//       emit(auth_state.AuthError(e.toString()));
//     }
//   }
 }
