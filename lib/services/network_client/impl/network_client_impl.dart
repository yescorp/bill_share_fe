import 'package:bill_share/services/network_client/api/network_client.dart';
import 'package:dio/dio.dart';

class NetworkClientImpl extends NetworkClient {
  final Dio _client;
  final String baseUrl;

  NetworkClientImpl({
    required this.baseUrl,
  }) : _client = Dio(
          BaseOptions(baseUrl: baseUrl),
        );

  @override
  void addHeader(String header, String value) {
    _client.options.headers.addAll({header: value});
  }

  @override
  Future<T?> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    final result = await _client.get<T>(
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );

    if (result.statusCode != null && result.statusCode! / 100 == 2) {
      return result.data;
    }

    return null;
  }

  @override
  Future<T?> post<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    final result = await _client.post<T>(
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );

    if (result.statusCode != null && result.statusCode! / 100 == 2) {
      return result.data;
    }

    return null;
  }

  @override
  Future<T?> put<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    final result = await _client.put<T>(
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );

    if (result.statusCode != null && result.statusCode! / 100 == 2) {
      return result.data;
    }

    return null;
  }

  @override
  Future<T?> patch<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    final result = await _client.patch<T>(
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );

    if (result.statusCode != null && result.statusCode! / 100 == 2) {
      return result.data;
    }

    return null;
  }
}
