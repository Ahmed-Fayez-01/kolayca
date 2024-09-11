import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kolayca/core/errors/failure.dart';
import 'package:kolayca/core/utils/services/remote_services/api_service.dart';
import 'package:kolayca/core/utils/services/remote_services/endpoints.dart';
import 'package:kolayca/features/notivication/data/models/notification_model.dart';

class NotificationRepo {
  final ApiService _apiService;

  NotificationRepo(this._apiService);
  Future<Either<Failure, List<NotificationModel>>> getNotifications() async {
    try {
      final response = await _apiService.get(
          endPoint: EndPoints.userNotifications, sendAuthToken: true);
      final notifications = (response.data['data'] as List)
          .map((e) => NotificationModel.fromJson(e))
          .toList();
      return right(notifications);
    } catch (e) {
      return left(e is DioException
          ? ServerFailure.fromDioError(e)
          : ServerFailure(e.toString()));
    }
  }
}
