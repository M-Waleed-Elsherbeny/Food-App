import 'package:dio/dio.dart';
import 'package:food_app/core/constants/api_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHandler {
  static Dio? dio;
  static Dio? initialDio() {
    const Duration timeout = Duration(seconds: 30);
    if (dio == null) {
      dio = Dio();
      dio!.options.baseUrl = ApiConstants.baseUrl;
      dio!.options.connectTimeout = timeout;
      dio!.options.receiveTimeout = timeout;
      prettyDioLogger();
      return dio;
    } else {
      prettyDioLogger();
      return dio;
    }
  }

  static void prettyDioLogger() {
    dio!.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        error: true,
      ),
    );
  }
}
