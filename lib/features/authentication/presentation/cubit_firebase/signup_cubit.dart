import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/features/authentication/domain/repositories/auth_repository.dart';
import 'package:flutter_application_1/features/authentication/presentation/cubit_firebase/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepository authRepository;

  SignupCubit(this.authRepository) : super(AuthInitial());

  Future<void> signUp({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      final user = await authRepository.signUp(email: email, password: password);
      if (user != null) {
        emit(AuthSuccess(user));
      } else {
        emit(SignupFailure("Failed to create account"));
      }
    } catch (e) {
      emit(SignupFailure(e.toString()));
    }
  }

  // Future<void> signInWithGoogle() async {
  //   emit(AuthLoading());
  //   try {
  //     final user = await authRepository.signInWithGoogle();
  //     if (user != null) {
  //       emit(AuthSuccess(user));
  //     } else {
  //       emit(SignupFailure("Google sign-in was cancelled"));
  //     }
  //   } catch (e) {
  //     emit(SignupFailure(e.toString()));
  //   }
  // }

  // تسجيل الدخول باستخدام Apple
  // Future<void> signInWithApple() async {
  //   emit(AuthLoading());
  //   try {
  //     final user = await authRepository.signInWithApple();
  //     if (user != null) {
  //       emit(AuthSuccess(user));
  //     } else {
  //       emit(SignupFailure("Apple sign-in was cancelled"));
  //     }
  //   } catch (e) {
  //     emit(SignupFailure(e.toString()));
  //   }
  // }
}
