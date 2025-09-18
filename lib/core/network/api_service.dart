import 'package:dio/dio.dart';
import 'package:news_app_task/core/constants/endpoints.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio) {
    dio.options = BaseOptions(baseUrl: kbaseUrl);
  }

  Future<dynamic> get({
    required String endPoint,
    Map<String, dynamic>? queryParams,
  }) async {
    final response = await dio.get(endPoint, queryParameters: queryParams);
    return response.data;
  }
}
