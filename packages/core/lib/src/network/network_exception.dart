import 'package:flutter/foundation.dart';
import 'package:dependencies/dependencies.dart';

/// An enum that holds names for our custom exceptions.
enum ExceptionType {
  /// The exception for a prematurely cancelled request.
  cancelException,

  /// The exception for a failed connection attempt.
  connectTimeoutException,

  /// The exception for failing to send a request.
  sendTimeoutException,

  /// The exception for failing to receive a response.
  receiveTimeoutException,

  /// The exception for no internet connectivity.
  socketException,

  /// The exception for an incorrect parameter in a request/response.
  formatException,

  /// The exception for an unknown type of failure.
  unrecognizedException,

  /// The exception for an bad certificate.
  badCertificateException,

  /// The exception for any parsing failure encountered during
  /// serialization/deserialization of a request.
  serializationException,
}

class NetworkException implements Exception {
  final String name, message;
  final String? code;
  final int? statusCode;
  final ExceptionType exceptionType;

  NetworkException({
    this.code,
    int? statusCode,
    required this.message,
    this.exceptionType = ExceptionType.unrecognizedException,
  }) : statusCode = statusCode ?? 500,
       name = exceptionType.name;

  factory NetworkException.fromDioException(Exception error) {
    try {
      if (error is DioException) {
        switch (error.type) {
          case DioExceptionType.cancel:
            return NetworkException(
              exceptionType: ExceptionType.cancelException,
              statusCode: error.response?.statusCode,
              message: "Request cancelled prematurely",
            );
          case DioExceptionType.connectionTimeout:
          case DioExceptionType.connectionError:
            return NetworkException(
              exceptionType: ExceptionType.connectTimeoutException,
              statusCode: error.response?.statusCode,
              message: 'Connection not established',
            );
          case DioExceptionType.sendTimeout:
            return NetworkException(
              exceptionType: ExceptionType.sendTimeoutException,
              statusCode: error.response?.statusCode,
              message: "Failed to send",
            );
          case DioExceptionType.receiveTimeout:
            return NetworkException(
              exceptionType: ExceptionType.receiveTimeoutException,
              statusCode: error.response?.statusCode,
              message: "Failed to receive",
            );
          case DioExceptionType.badResponse:
            return NetworkException(
              exceptionType: ExceptionType.formatException,
              statusCode: error.response?.statusCode,
              message: "No internet connectivity",
            );
          case DioExceptionType.badCertificate:
            return NetworkException(
              message: "Bad certificate",
              exceptionType: ExceptionType.badCertificateException,
              statusCode: error.response?.statusCode,
            );
          case DioExceptionType.unknown:
            return NetworkException(
              message: error.message ?? "Dio unknown exception",
              exceptionType: ExceptionType.unrecognizedException,
              statusCode: error.response?.statusCode,
            );
        }
      } else {
        return NetworkException(
          exceptionType: ExceptionType.unrecognizedException,
          message: "Error unrecognized",
        );
      }
    } on FormatException catch (e) {
      return NetworkException(
        exceptionType: ExceptionType.formatException,
        message: e.message,
      );
    } on Exception catch (_) {
      return NetworkException(
        exceptionType: ExceptionType.unrecognizedException,
        message: "Error unrecognized",
      );
    }
  }

  factory NetworkException.fromParsingException(Exception error) {
    debugPrint('$error');
    return NetworkException(
      exceptionType: ExceptionType.serializationException,
      message: "Failed to parse network response to model",
    );
  }

  @override
  String toString() {
    return "${exceptionType.name} [$statusCode] : $message";
  }
}
