import 'package:asl_assesment/core/models/flavor_config.dart';
import 'package:asl_assesment/core/network/network_client.dart';
import 'package:asl_assesment/core/network/network_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'api_constants.dart';

@Singleton(as: NetworkClient)
class PrivateNetworkClient extends NetworkClient {
  final Dio _dio;

  PrivateNetworkClient()
      : _dio = Dio(
          BaseOptions(
            baseUrl: FlavorConfig.instance.baseUrl,
            connectTimeout: ApiConstants.timeout,
            receiveTimeout: ApiConstants.timeout,
            headers: {
              'User-Agent': 'Mozilla/5.0',
              'Accept': 'application/json',
              'Accept-Language': 'en-US,en;q=0.9',
            },
          ),
        ) {
    _dio.interceptors
        .add(LogInterceptor(responseBody: true, requestBody: true));
  }

  @override
  Future<Either<NetworkException, T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParams,
    T Function(dynamic data)? parser,
  }) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParams);
      final data = parser != null ? parser(response.data) : response.data;
      return Right(data);
    } catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }

  @override
  Future<Either<NetworkException, T>> post<T>(
    String path, {
    dynamic data,
    T Function(dynamic data)? parser,
  }) async {
    try {
      final response = await _dio.post(path, data: data);
      final parsed = parser != null ? parser(response.data) : response.data;
      return Right(parsed);
    } catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }
}
