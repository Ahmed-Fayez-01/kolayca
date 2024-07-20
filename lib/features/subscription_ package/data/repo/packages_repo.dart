import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kolayca/core/errors/failure.dart';
import 'package:kolayca/core/utils/services/remote_services/api_service.dart';

import '../../../../core/utils/services/remote_services/endpoints.dart';
import '../models/package_model.dart';

abstract class PackagesRepo {
  Future<Either<Failure, List<PackageModel>>> getPackages();
}

class PackagesRepoImpl implements PackagesRepo {
  final ApiService apiService;
  PackagesRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<PackageModel>>> getPackages() async {
    try {
      final response = await apiService.get(
          endPoint: EndPoints.packages, sendAuthToken: true);
      final List<PackageModel> packages = (response.data['data'] as List)
          .map((e) => PackageModel.fromMap(e))
          .toList();
      return Right(packages);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
