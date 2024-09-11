import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kolayca/core/errors/failure.dart';
import 'package:kolayca/core/utils/services/remote_services/endpoints.dart';

import '../../../../core/utils/services/remote_services/api_service.dart';
import '../models/order.dart';

abstract class OrdersRepo {
  Future<Either<Failure, List<OrderModel>>> getUserOrders();
}

class OrdersRepoImpl implements OrdersRepo {
  final ApiService _apiService;

  OrdersRepoImpl(this._apiService);
  @override
  Future<Either<Failure, List<OrderModel>>> getUserOrders() async {
    try {
      final response = await _apiService.postData(
          endPoint: EndPoints.getUserOrders, sendAuthToken: true);
      final List<OrderModel> orders = (response.data['data'] as List)
          .map((e) => OrderModel.fromMap(e))
          .toList();
      return Right(orders);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
