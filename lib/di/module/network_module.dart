import 'package:dio/dio.dart';
import 'package:flutter_todo_app/constants/endpoints.dart';

abstract class NetworkModule {
  static Dio provideDio() {
    final dio = Dio();

    dio
      ..options.baseUrl = Endpoints.baseUrl
      ..options.headers = {'Content-Type': 'application/json; charset=utf-8'}
      ..interceptors.add(LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
      ))
      // use interceptors if needed
      /*..interceptors.add(
        InterceptorsWrapper(),
      )*/;

    return dio;
  }
}
