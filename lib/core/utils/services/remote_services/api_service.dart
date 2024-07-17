import 'package:dio/dio.dart';

import '../local_services/cache_keys.dart';
import 'endpoints.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Response> postData({
    required String endPoint,
    bool sendToken = false,
    dynamic data,
    Map<String,dynamic>? query,
  }) async {
    _dio.options.headers = {
      "Accept":"application/json",
      "Content-Type": "application/json",
      if (sendToken)
        "Authorization": "Bearer ${CacheKeysManger.tokenStatus()}"
    };
    var response = await _dio.post(
      "${EndPoints.baseUrl}$endPoint",
      data: data,
      queryParameters: query,
    );
    return response;
  }

  Future<Response> get({
    required String endPoint,
    bool sendToken = false,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    _dio.options.headers = {
      "Content-Type": "application/json",
      if (sendToken)
        "Authorization": "Bearer ${CacheKeysManger.tokenStatus()}"
    };
    var response = await _dio.get(
      '${EndPoints.baseUrl}$endPoint',
      queryParameters: query,
      data: data,
    );
    return response;
  }


}
