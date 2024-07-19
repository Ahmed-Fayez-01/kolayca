import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:kolayca/core/utils/services/remote_services/api_service.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/utils/services/remote_services/endpoints.dart';
import '../models/user_model.dart';

abstract class ProfileRepo {
  Future<Either<Failure, UserModel>> getUserProfile();
  Future<Either<Failure, UserModel>> updateUserProfile({
    required Map<String, dynamic> data,
  });
}

class ProfileRepoImpl implements ProfileRepo {
  final ApiService _apiService;
  ProfileRepoImpl(this._apiService);

  @override
  Future<Either<Failure, UserModel>> getUserProfile() async {
    try {
      final response = await _apiService.postData(
          endPoint: EndPoints.userProfile, sendAuthToken: true);
      return Right(UserModel.fromMap(response.data));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, UserModel>> updateUserProfile(
      {required Map<String, dynamic> data}) async {
    try {
      final response = await _apiService.postData(
          endPoint: EndPoints.userProfile, data: data, sendAuthToken: true);
      return Right(UserModel.fromMap(response.data));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
