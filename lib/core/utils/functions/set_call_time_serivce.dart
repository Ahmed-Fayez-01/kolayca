import 'dart:developer';

import 'package:kolayca/core/utils/services/remote_services/api_service.dart';
import 'package:kolayca/core/utils/services/remote_services/endpoints.dart';
import 'package:kolayca/core/utils/services/remote_services/service_locator.dart';

class SetZegoCallTime {
  static final ApiService _apiService = getIt<ApiService>();
  static Future call(int minutes, String translatorId) async {
    try {
      final response = await _apiService.postData(
          endPoint: EndPoints.endCall,
          sendAuthToken: true,
          data: {"number_minutes": minutes, "translator_id":int.tryParse(translatorId) ??0});
      log(response.data.toString());
    } catch (e) {
      log(e.toString());
    }
  }
}
