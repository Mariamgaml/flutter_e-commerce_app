import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/error/failures.dart';
import 'package:flutter_application_1/features/authentication/data/models/user_model.dart';
import 'package:flutter_application_1/features/authentication/domain/repositories/auth_repository2.dart';

class AuthRepository2 implements AuthRepository1 {
  final SupabaseClient _client = Supabase.instance.client;

  @override
  Future<Either<Failure, UserModel>> signIn(String email, String password) async {
    try {
      final response = await _client.auth.signInWithPassword(email: email, password: password);
      final user = response.user;

      if (user == null) {
        return Left(ServerFailure("User not found"));
      }

      return Right(UserModel(id: user.id, email: user.email ?? ''));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> signUp(String email, String password) async {
    try {
      final response = await _client.auth.signUp(email: email, password: password);
      final user = response.user;

      if (user == null) {
        return Left(ServerFailure("Sign up failed"));
      }

      return Right(UserModel(id: user.id, email: user.email ?? ''));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword(String email) async {
    try {
      await _client.auth.resetPasswordForEmail(email);
      return Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await _client.auth.signOut();
      return Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  UserModel? get currentUser {
    final user = _client.auth.currentUser;
    if (user != null) {
      return UserModel(id: user.id, email: user.email ?? '');
    }
    return null;
  }
}
