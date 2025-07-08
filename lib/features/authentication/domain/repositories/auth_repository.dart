import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  
  Future<User?> signIn({required String email, required String password});


  Future<User?> signUp({required String email, required String password});


  Future<void> resetPassword({required String email});


  Future<void> signOut();

 
  Future<User?> signInWithGoogle();

 
  Future<User?> signInWithApple();


  User? get currentUser;
}
