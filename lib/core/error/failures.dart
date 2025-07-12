
// ignore_for_file: use_super_parameters

abstract class Failure {
  final String message;

  Failure(this.message);

  @override
  String toString() => message;
}


class AuthFailure extends Failure {
  
  AuthFailure(String message) : super(message);
}

// فشل في الاتصال بالإنترنت
class NetworkFailure extends Failure {
  NetworkFailure(String message) : super(message);
}


class ServerFailure extends Failure {
  ServerFailure(String message) : super(message);
}


class InvalidInputFailure extends Failure {
  InvalidInputFailure(String message) : super(message);
}

// فشل غير معروف
class UnknownFailure extends Failure {
  UnknownFailure(String message) : super(message);
}
// في core/error/failures.dart


// في core/error/exceptions.dart
class AuthException implements Exception {
  final String message;
  AuthException(this.message);
}