// import 'package:sign_in_with_apple/sign_in_with_apple.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'dart:io';

// class AppleSignInService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<User?> signInWithApple() async {
//     try {
//       if (!Platform.isIOS) {
//         print("Apple Sign-In is only supported on iOS.");
//         return null;
//       }

//       final appleCredential = await SignInWithApple.getAppleIDCredential(
//         scopes: [AppleIDAuthorizationScopes.email, AppleIDAuthorizationScopes.fullName],
//       );

//       final oauthCredential = OAuthProvider("apple.com").credential(
//         idToken: appleCredential.identityToken,
//         accessToken: appleCredential.authorizationCode,
//       );

//       final userCredential = await _auth.signInWithCredential(oauthCredential);
//       return userCredential.user;
//     } catch (e) {
//       print('Apple sign-in error: $e');
//       return null;
//     }
//   }
// }
