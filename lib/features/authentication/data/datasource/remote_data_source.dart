import 'package:flutter_application_1/features/authentication/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRemoteDataSource {
  final SupabaseClient client;

  AuthRemoteDataSource(this.client);

  Future<UserModel> signIn(String email, String password) async {
    final response = await client.auth.signInWithPassword(
      email: email,
      password: password,
    );

    if (response.user == null) throw Exception("Login failed");

    return UserModel(
      id: response.user!.id,
      email: response.user!.email!,
      name: response.user!.userMetadata?['name'],
      avatarUrl: response.user!.userMetadata?['avatar_url'],
    );
  }

  Future<UserModel> signUp(String email, String password) async {
    final response = await client.auth.signUp(
      email: email,
      password: password,
    );

    if (response.user == null) throw Exception("Registration failed");

    return UserModel(
      id: response.user!.id,
      email: response.user!.email!,
      name: response.user!.userMetadata?['name'],
      avatarUrl: response.user!.userMetadata?['avatar_url'],
    );
  }

  Future<void> resetPassword(String email) async {
    try {
    await Supabase.instance.client.auth.resetPasswordForEmail(
  email,
  redirectTo: 'e-commerceapp://reset-password', // اسم السكيم اللي اخترتيه
);// استبدل YOUR_APP_SCHEME برابط إعادة التوجيه الخاص بتطبيقك
    } catch (e) {
      throw Exception("Failed to send reset password email: ${e.toString()}");
    }
  }

  // تسجيل الخروج
  Future<void> signOut() async {
    try {
      await client.auth.signOut();
    } catch (e) {
      throw Exception("Failed to sign out: ${e.toString()}");
    }
  }

  UserModel? get currentUser {
    final user = client.auth.currentUser;
    if (user != null) {
      return UserModel(
        id: user.id,
        email: user.email!,
        name: user.userMetadata?['name'],
        avatarUrl: user.userMetadata?['avatar_url'],
      );
    }
    return null;
  }
}
