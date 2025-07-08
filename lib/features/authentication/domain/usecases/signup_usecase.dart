import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/features/authentication/domain/repositories/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  Future<User?> call({required String email, required String password}) async {
    return await repository.signUp(email: email, password: password);
  }
}
