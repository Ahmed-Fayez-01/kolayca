import 'dart:developer';

import 'package:kolayca/core/utils/services/remote_services/api_service.dart';
import 'package:kolayca/core/utils/services/remote_services/endpoints.dart';
import 'package:kolayca/core/utils/services/remote_services/service_locator.dart';

class SetUserAvailability {
  static final ApiService _apiService = getIt<ApiService>();
  static Future call(bool isAvailable) async {
    try {
      final response = await _apiService.postData(
          endPoint: EndPoints.setUserAvailability,
          sendAuthToken: true,
          data: {"available": "$isAvailable"});
    } catch (e) {
      log(e.toString());
    }
  }
}
