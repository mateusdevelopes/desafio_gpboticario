import 'package:dio/dio.dart';

class RestClient {
  static const BASE_URL = "https://60a3a27c7c6e8b0017e276c6.mockapi.io/api/v1";
  static const CONTENT_TYPE = "application/json; charset=utf-8";
  static const CONNECTION_TIME_OUT = 5000;
  static const RECIVE_TIME_OUT = 1000;

  final BaseOptions options = new BaseOptions(
    baseUrl: BASE_URL,
    contentType: CONTENT_TYPE,
    connectTimeout: CONNECTION_TIME_OUT,
    receiveTimeout: RECIVE_TIME_OUT,
  );
}

RestClient restClient = new RestClient();
