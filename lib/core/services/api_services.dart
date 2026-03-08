import 'package:dio/dio.dart';
import 'package:food_app/core/services/dio_handler.dart';

class ApiServices {
  Dio? dio;
  ApiServices() {
    dio = DioHandler.initialDio();
  }
  Future<Response> get({required String endPoint}) async {
    return await dio!.get(endPoint);
  }

  Future<Response> post({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    return await dio!.post(endPoint, data: data);
  }
}
