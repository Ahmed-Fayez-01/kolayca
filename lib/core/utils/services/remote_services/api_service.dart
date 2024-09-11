import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:kolayca/main.dart';

import '../local_services/cache_keys.dart';
import 'endpoints.dart';

// const _token =
//     "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYTg1NjkzYmFhMDU2NzdjZDQ5N2VmZjA3NTRhYmEyYWI4MWE3MDcwMDA1ZGEzNjJmMTkwMmQwOWEwNWEyZmI0MThlZGZlYjZlMjk4MWQxOGUiLCJpYXQiOjE3MjA2MjQzNzAuNTM2MTUxODg1OTg2MzI4MTI1LCJuYmYiOjE3MjA2MjQzNzAuNTM2MTUxODg1OTg2MzI4MTI1LCJleHAiOjE3NTIxNjAzNzAuNTM0MzA4OTEwMzY5ODczMDQ2ODc1LCJzdWIiOiI4Iiwic2NvcGVzIjpbXX0.iR7SxNpV0Lw1Kny1jr6me247Cnem_q9DX-8ndr-bB0jC7OmH_VDdnjCPGZtjsMMVy2D4lmTK5d5MojE7gcs0SVm4eXNbf96Ok-cIkIjmQ6d9avSz7N79sW9xlFCwzDoHlICcEI5BeJ88M6LelcE_U511MUlKKAGOf4xD9xLAy_ikSdjjSGCHxJY_YtxRJQYDTc6zx9ImFc4ReyBPsIhfUcU32qqMXHBwo1fAku12-qCQq9UrwELYE32HITsVCht1O9PjPKbpCokUPqtEjeBLEAkSk0ff55-FIlpkOIehki7fuTNPIXl-Gtt1OFaJNI4TfpTZqRNZqBhBdqH5AZPN-5hhj31yx76qJa7GAwCdvleJCpoQ4U7HFkwbybVrR76MbY6qfQZthfxqgkcp1nL3xrhDDzjsuM15uedmsvbdyXkaHOtRfUFGU5WBrvXmxtNsFEQBuvKlwsSR0ov7yPNBsQzRrNS0myIrG9XsMriTfDK0hzoGwCv_HD7zwWKy6Z9fo3Pyn3gxNsvzOmIR3Lxx6FnQYjNytIjV7dWDp_YpuyddDfk8W8jtibOLqiqOxP74X4J-mS1lhM7-nsNOgq9veo1Q_yS7IY2lkN3FF9ZFnBMXnAJKVizEvz5JT-Cqxm6srD3dPllFB5uh6vcPn2TAoU_D9JmJm9Keh3i0iUPUx4U";

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
      if (navigatorKey.currentContext != null)
        "lang": EasyLocalization.of(navigatorKey.currentContext!)!
            .locale
            .languageCode,
      if (sendAuthToken)
        "Authorization": CacheKeysManger.tokenStatus() // "Bearer $_token"
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
      "lang": EasyLocalization.of(navigatorKey.currentContext!)!
          .locale
          .languageCode,
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
      "lang": EasyLocalization.of(navigatorKey.currentContext!)!
          .locale
          .languageCode,
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
      "lang": EasyLocalization.of(navigatorKey.currentContext!)!
          .locale
          .languageCode,
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
      "lang": EasyLocalization.of(navigatorKey.currentContext!)!
          .locale
          .languageCode,
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
      "lang": EasyLocalization.of(navigatorKey.currentContext!)!
          .locale
          .languageCode,
    };
    var response = await _dio.delete(
      "${EndPoints.baseUrl}$endPoint",
      data: data,
      queryParameters: query,
    );
    return response;
  }
}
