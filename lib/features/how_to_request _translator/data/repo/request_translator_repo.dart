import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kolayca/core/errors/failure.dart';
import 'package:kolayca/core/utils/services/remote_services/api_service.dart';
import 'package:kolayca/core/utils/services/remote_services/endpoints.dart';
import 'package:kolayca/features/how_to_request%20_translator/data/models/specialization.dart';

import '../../../profile/data/models/user_model.dart';

class RequestTranslatorRepo {
  final ApiService _apiService;

  RequestTranslatorRepo(this._apiService);
  Future<Either<Failure, List<Specialization>>> getSpecializations() async {
    try {
      final response = await _apiService.get(
          endPoint: EndPoints.specializations, sendAuthToken: true);
      return Right(List<Specialization>.from(
          response.data['data'].map((x) => Specialization.fromMap(x))));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  Future<Either<Failure, dynamic>> scheduleAppointment(
      {required Map<String, dynamic> data}) async {
    try {
      final response = await _apiService.postData(
          endPoint: EndPoints.scheduleAppointment,
          data: data,
          sendAuthToken: true);
      return Right(response.data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  Future<Either<Failure, List<UserModel>>> getAllTranslators() async {
    try {
      final response =
          await _apiService.get(endPoint: 'translators', sendAuthToken: true);
      return Right(List<UserModel>.from(
          response.data['data'].map((x) => UserModel.fromMap(x))));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
