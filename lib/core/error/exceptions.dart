// ملف exceptions.dart

// استثناء أساسي
abstract class AppException implements Exception {
  final String message;

  AppException(this.message);

  @override
  String toString() => message;
}

// استثناء في المصادقة
class AuthException extends AppException {
  AuthException(super.message);
}

// استثناء في الاتصال بالإنترنت
class NetworkException extends AppException {
  NetworkException(super.message);
}

// استثناء في الخادم
class ServerException extends AppException {

  ServerException(super.message);
}

// استثناء في بيانات الإدخال
class InvalidInputException extends AppException {
 
  InvalidInputException(super.message);
}
//استثناء حساب خاطئ
class InvalidAccountException extends AppException {
  InvalidAccountException(super.message);
}