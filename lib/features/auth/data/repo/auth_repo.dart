import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:kolayca/features/auth/data/models/auth_data_model.dart';
import '../../../../core/errors/failure.dart';

abstract class AuthRepo{
  Future<Either<Failure,AuthDataModel>> login({required Map<String,dynamic> data});
  Future<Either<Failure,AuthDataModel>> register({required var data});
}