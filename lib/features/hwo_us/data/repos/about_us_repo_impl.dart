import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kolayca/core/errors/failure.dart';
import 'package:kolayca/features/auth/data/models/auth_data_model.dart';
import 'package:kolayca/features/hwo_us/data/models/about_us_model.dart';
import '../../../../core/utils/services/remote_services/api_service.dart';
import '../../../../core/utils/services/remote_services/endpoints.dart';
import 'about_us_repo.dart';

class AboutUsRepoImpl implements AboutUsRepo {
  final ApiService? apiService;

  AboutUsRepoImpl(this.apiService);

  @override
  Future<Either<Failure, AboutUsModel>> getAboutSettings() async{
    try {
      var response = await apiService!.get(endPoint: EndPoints.aboutUs,);
      var result = AboutUsModel.fromJson(response.data);
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
