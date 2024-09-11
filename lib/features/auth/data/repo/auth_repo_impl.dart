import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kolayca/core/errors/failure.dart';
import 'package:kolayca/features/auth/data/models/auth_data_model.dart';
import '../../../../core/utils/services/remote_services/api_service.dart';
import '../../../../core/utils/services/remote_services/endpoints.dart';
import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService? apiService;

  AuthRepoImpl(this.apiService);

  @override
  Future<Either<Failure, AuthDataModel>> login(
      {required Map<String, dynamic> data}) async {
    try {
      var response =
          await apiService!.postData(endPoint: EndPoints.login, data: data);
      var result = AuthDataModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, AuthDataModel>> register({required var data}) async {
    try {
      var response =
          await apiService!.postData(endPoint: EndPoints.register, data: data);

      var result = AuthDataModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
