import 'package:dartz/dartz.dart';
import 'package:kolayca/features/lessons/data/models/lesson.dart';

import '../../../../core/errors/failure.dart';

abstract class LessonsRepo {
  Future<Either<Failure, List<Lesson>>> getLessons();
}
