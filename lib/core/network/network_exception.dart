import 'dart:io';
import 'package:dio/dio.dart';

class NetworkException implements Exception {
  final String? errorCode;
  final String message;

  NetworkException({required this.message, this.errorCode});

  factory NetworkException.fromDioError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return NetworkException(message: "Connection timeout");

        case DioExceptionType.badResponse:
          final statusCode = error.response?.statusCode ?? 0;
          final errorData = error.response?.data;
          return NetworkException.fromStatusCode(statusCode, errorData);

        case DioExceptionType.cancel:
          return NetworkException(message: "Request was cancelled");

        case DioExceptionType.connectionError:
        case DioExceptionType.unknown:
          if (error.error is SocketException) {
            return NetworkException(message: "No Internet connection");
          }
          return NetworkException(message: "Unexpected error occurred");

        default:
          return NetworkException(message: "Unknown Dio error");
      }
    } else if (error is SocketException) {
      return NetworkException(message: "No Internet connection");
    } else {
      return NetworkException(message: "Unexpected error: ${error.toString()}");
    }
  }

  factory NetworkException.fromStatusCode(int statusCode, dynamic data) {
    switch (statusCode) {
      case 400:
        return NetworkException(message: "Bad request");
      case 401:
        return NetworkException(message: "Unauthorized");
      case 403:
        return NetworkException(message: "Forbidden");
      case 404:
        return NetworkException(message: "Not found");
      case 500:
        return NetworkException(message: "Internal server error");
      default:
        return NetworkException(
            message: "Received invalid status code: $statusCode");
    }
  }

  @override
  String toString() => message;
}
