import 'package:dio/dio.dart';

import '../local_services/cache_keys.dart';
import 'endpoints.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Response> postData({
    required String endPoint,
    bool sendCode = false,
    dynamic data,
    bool sendAuthToken = false,
    Map<String, dynamic>? query,
  }) async {
    _dio.options.headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      if (sendAuthToken) "Authorization": CacheKeysManger.tokenStatus()
    };
    var response = await _dio.post(
      "${EndPoints.baseUrl}$endPoint",
      data: data,
      queryParameters: query,
    );
    return response;
  }

  Future<Response> postDataWithImage({
    required String endPoint,
    bool sendCode = false,
    FormData? data,
    Map<String, dynamic>? query,
  }) async {
    _dio.options.headers = {
      "Accept": "text/plain",
      "Content-Type": "multipart/form-data",
    };
    var response = await _dio.post(
      "${EndPoints.baseUrl}$endPoint",
      data: data,
      queryParameters: query,
    );
    return response;
  }

  Future<Response> postListData({
    required String endPoint,
    bool sendAuthToken = false,
    List<Map<String, dynamic>>? data,
  }) async {
    _dio.options.headers = {
      "Content-Type": "application/json",
    };
    var response = await _dio.post(
      "${EndPoints.baseUrl}$endPoint",
      data: data,
    );
    return response;
  }

  Future<Response> get({
    required String endPoint,
    // bool sendCode = false,
    bool sendAuthToken = false,
    Map<String, dynamic>? query,
  }) async {
    _dio.options.headers = {
      "Content-Type": "text/plain",
      if (sendAuthToken) "Authorization": CacheKeysManger.tokenStatus(),
    };
    var response = await _dio.get(
      '${EndPoints.baseUrl}$endPoint',
      queryParameters: query,
    );
    return response;
  }

  Future<Response> putData({
    required String endPoint,
    required var data,
  }) async {
    _dio.options.headers = {
      "accept": "*/*",
    };
    var response = await _dio.put(
      '${EndPoints.baseUrl}$endPoint',
      data: data,
    );
    return response;
  }

  Future<Response> deleteData({
    required String endPoint,
    bool sendCode = false,
    dynamic data,
    Map<String, dynamic>? query,
  }) async {
    _dio.options.headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
    };
    var response = await _dio.delete(
      "${EndPoints.baseUrl}$endPoint",
      data: data,
      queryParameters: query,
    );
    return response;
  }
}
