import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:kolayca/core/errors/failure.dart';
import 'package:kolayca/core/utils/services/remote_services/endpoints.dart';
import 'package:kolayca/features/lessons/data/models/lesson.dart';

import '../../../../core/utils/services/remote_services/api_service.dart';
import 'lessons_repo.dart';

class LessonsRepoImpl implements LessonsRepo {
  final ApiService apiService;
  LessonsRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, List<Lesson>>> getLessons() async {
    try {
      final response = await apiService.get(
          endPoint: EndPoints.recordedLessons, sendAuthToken: true);
      final List<Lesson> lessons = (response.data['data'] as List)
          .map((e) => Lesson.fromMap(e))
          .toList();
      return Right(lessons);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
