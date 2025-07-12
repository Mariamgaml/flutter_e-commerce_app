
import 'package:dartz/dartz.dart' show Either;
import 'package:flutter_application_1/core/error/failures.dart';
import 'package:flutter_application_1/features/authentication/data/models/user_model.dart';



abstract class AuthRepository1 {
  Future<Either<Failure, UserModel>> signIn(String email, String password);
  Future<Either<Failure, UserModel>> signUp(String email, String password);
  Future<Either<Failure, void>> resetPassword(String email);
  Future<Either<Failure, void>> signOut();
  UserModel? get currentUser;


  
}