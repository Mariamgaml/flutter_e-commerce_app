import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_application_1/core/error/failures.dart';
import 'package:flutter_application_1/features/authentication/data/models/user_model.dart';


import '../repositories/auth_repository2.dart';
import '../repositories/auth_repository.dart';




class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<firebase_auth.User?> call(String email, String password) {
    return repository.signIn(email: email, password: password);
  }
  
}
class SigninUSeCase{
  final AuthRepository1 repository;

  SigninUSeCase(this.repository);

  Future<Either<Failure, UserModel>> call(String email, String password) {
    return repository.signIn(email, password);
  }
}
