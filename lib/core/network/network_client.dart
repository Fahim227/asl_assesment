import 'package:asl_assesment/core/network/network_exception.dart';
import 'package:dartz/dartz.dart';

abstract class NetworkClient {
  Future<Either<NetworkException, T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParams,
    T Function(dynamic data)? parser,
  });

  Future<Either<NetworkException, T>> post<T>(
    String path, {
    dynamic data,
    T Function(dynamic data)? parser,
  });
}
