import 'package:dio/dio.dart';

class NetworkClient {
  // ignore: unused_field
  final Dio _client;
  final String baseUrl;

  NetworkClient({
    required this.baseUrl,
  }) : _client = Dio(
          BaseOptions(baseUrl: baseUrl),
        );
}
