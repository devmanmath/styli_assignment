class AppException implements Exception {
  final ExceptionType exceptionType;
  final String message;
  AppException({
    required this.exceptionType,
    required this.message,
  });
}

enum ExceptionType {
  network,
  fileNotFound,
  general,
  timeout,
  databseError,
  unAuthorized
}
