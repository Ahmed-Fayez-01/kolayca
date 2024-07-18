import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kolayca/core/errors/failure.dart';
import 'package:kolayca/features/auth/data/models/auth_data_model.dart';
import 'package:kolayca/features/home/data/models/home_data_model.dart';
import 'package:kolayca/features/home/data/models/slider_model.dart';
import '../../../../core/utils/services/remote_services/api_service.dart';
import '../../../../core/utils/services/remote_services/endpoints.dart';
import 'auth_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService? apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, HomeDataModel>> getHomeData() async {
    try {
      var response = await apiService!.get(endPoint: EndPoints.categories);
      var result = HomeDataModel.fromJson(response.data);
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
  Future<Either<Failure, SliderModel>> getSlidersData() async {
    try {
      var response = await apiService!.get(endPoint: EndPoints.sliders);
      var result = SliderModel.fromJson(response.data);
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
