import 'package:dio/dio.dart';

class NetworkClient {
  final Dio _client;
  final String baseUrl;

  NetworkClient({
    required this.baseUrl,
  }) : _client = Dio(
          BaseOptions(baseUrl: baseUrl),
        );
}
