import 'package:dio/dio.dart';

class DioHelper
{
  static Dio? dio;

  static init() {
    print("Dio class is created");

    dio = Dio(
      BaseOptions(
        connectTimeout: Duration(seconds: 60),
        receiveTimeout: Duration(seconds: 60),
        sendTimeout: Duration(seconds: 60),
        baseUrl: 'https://api.themoviedb.org/3/',
        receiveDataWhenStatusError: true,
      ),
    );

  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {

    // headersOfAPI();

    return dio!.get(
      options: Options(headers: {'Authorization': 'Bearer ${token}'},),
      url,
      queryParameters: query,
    );
  }
}
