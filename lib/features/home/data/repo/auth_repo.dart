import 'package:dartz/dartz.dart';
import 'package:kolayca/features/home/data/models/home_data_model.dart';
import 'package:kolayca/features/home/data/models/slider_model.dart';
import '../../../../core/errors/failure.dart';

abstract class HomeRepo{
  Future<Either<Failure,HomeDataModel>> getHomeData();
  Future<Either<Failure,SliderModel>> getSlidersData();
}