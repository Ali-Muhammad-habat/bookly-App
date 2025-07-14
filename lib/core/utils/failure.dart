import 'package:dio/dio.dart';

/// Base Failure class
abstract class Failure {
  final String message;
  Failure(this.message);
}

/// No Internet connection error
class NoInternetFailure extends Failure {
  NoInternetFailure() : super('📡 No internet connection.');
}

/// Bad request (400)
class BadRequestFailure extends Failure {
  BadRequestFailure() : super('📥 Bad request. Please check your data.');
}

/// Unauthorized (401 or 403)
class UnauthorizedFailure extends Failure {
  UnauthorizedFailure() : super('🔐 Unauthorized access. Please log in.');
}

class ServerFailure extends Failure {
  ServerFailure(String message) : super(message);
  static Failure fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('⏳ Connection timeout with the server.');
      case DioExceptionType.sendTimeout:
        return ServerFailure('📤 Send timeout. The request took too long to send.');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('📥 Receive timeout. Server took too long to respond.');
      case DioExceptionType.badCertificate:
        return ServerFailure('📛 Invalid SSL certificate.');
      case DioExceptionType.cancel:
        return ServerFailure('❌ Request was cancelled.');
      case DioExceptionType.connectionError:
        return NoInternetFailure();
      case DioExceptionType.badResponse:
        return _handleBadResponse(e.response?.statusCode, e.response?.data);
      case DioExceptionType.unknown:
        if (e.message != null && e.message!.contains('SocketException')) {
          return NoInternetFailure();
        }
        return ServerFailure('⚠️ Unexpected error: ${e.message}');
    }
  }
  static Failure _handleBadResponse(int? statusCode, dynamic data) {
    switch (statusCode) {
      case 400:
        return BadRequestFailure();
      case 401:
      case 403:
        return UnauthorizedFailure();
      case 404:
        return ServerFailure('🔎 The requested resource was not found.');
      case 500:
        return ServerFailure('💥 Internal server error.');
      default:
        return ServerFailure('⚠️ Unknown error occurred. Code: $statusCode');
    }
  }
}
