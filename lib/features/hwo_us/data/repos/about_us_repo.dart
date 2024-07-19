import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../models/about_us_model.dart';

abstract class AboutUsRepo {
  Future<Either<Failure, AboutUsModel>> getAboutSettings();
}
