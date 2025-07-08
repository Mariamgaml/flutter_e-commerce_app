import 'package:flutter_application_1/features/authentication/domain/usecases/login_usecase.dart';
import 'package:flutter_application_1/features/authentication/presentation/cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit(this.loginUseCase) : super(LoginInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    try {
      final user = await loginUseCase(email, password);
      if (user != null) {
        emit(LoginSuccess(user));
      } else {
        emit(LoginFailure('User not found'));
      }
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}

