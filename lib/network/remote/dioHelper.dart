import 'dart:convert';

import 'package:dio/dio.dart';

// الديو هو الي ناخذ منه الداتا و نبوست الداتا

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://student.valuxapps.com/api/',
          receiveDataWhenStatusError: true,
          headers: {'Content-Type': 'application/json'}),
    );
  }

  static Future<Response<dynamic>> getDate({
    required String url,
    required Map<String, dynamic> query,
    String? lang,
    String? token,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': token,
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response<dynamic>> postDate({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? lang,
    String? token,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': token,
    };

    return dio.post(url, queryParameters: query, data: data);
  }
}
