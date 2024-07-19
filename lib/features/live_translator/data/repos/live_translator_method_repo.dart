import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kolayca/features/live_translator/data/models/live_translator_method.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/utils/services/remote_services/api_service.dart';
import '../../../../core/utils/services/remote_services/endpoints.dart';

abstract class LiveTranslatorMethodRepo {
  Future<Either<Failure, List<LiveTranslatorMethod>>> getLiveTranslatorMethod();
}

class LiveTranslatorMethodRepoImpl implements LiveTranslatorMethodRepo {
  final ApiService _apiService;

  LiveTranslatorMethodRepoImpl(this._apiService);

  @override
  Future<Either<Failure, List<LiveTranslatorMethod>>>
      getLiveTranslatorMethod() async {
    try {
      final response = await _apiService.get(
          endPoint: EndPoints.liveTranslatorMethod, sendAuthToken: true);
      final List<LiveTranslatorMethod> liveTranslatorMethods = (List.from(
          response.data['data'].map((e) => LiveTranslatorMethod.fromMap(e))));

      return Right(liveTranslatorMethods);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
