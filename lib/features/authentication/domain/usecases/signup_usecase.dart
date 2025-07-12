import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/features/authentication/data/models/user_model.dart';

import 'package:flutter_application_1/features/authentication/domain/repositories/auth_repository.dart';
import 'package:flutter_application_1/features/authentication/domain/repositories/auth_repository2.dart';

class SignUpUseCase {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  Future<User?> call({required String email, required String password}) async {
    return await repository.signUp(email: email, password: password);
  }
}
class SignUpSupabaseUseCase {
  final AuthRepository1 repository;

  SignUpSupabaseUseCase(this.repository);

  Future<UserModel?> call(String email, String password) async {
    final result = await repository.signUp(email, password);
    return result.fold((failure) => null, (user) => user);
  }
}
