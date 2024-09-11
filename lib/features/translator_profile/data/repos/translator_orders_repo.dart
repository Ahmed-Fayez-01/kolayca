import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/utils/services/remote_services/api_service.dart';
import '../../../../core/utils/services/remote_services/endpoints.dart';
import '../../../requests/data/models/order.dart';

abstract class TranslatorOrdersRepo {
  Future<Either<Failure, List<OrderModel>>> getOrdersBySpeciality();
  Future<Either<Failure, List<OrderModel>>> getTranslatorOrders();
  // accept order
  Future<Either<Failure, OrderModel>> acceptOrder({required int orderId});
}

class TranslatorOrdersRepoImpl implements TranslatorOrdersRepo {
  final ApiService _apiService;

  TranslatorOrdersRepoImpl(this._apiService);
  @override
  Future<Either<Failure, List<OrderModel>>> getOrdersBySpeciality() async {
    try {
      final response = await _apiService.postData(
          endPoint: EndPoints.ordersBySpecialization, sendAuthToken: true);
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

  @override
  Future<Either<Failure, List<OrderModel>>> getTranslatorOrders() async {
    try {
      final response = await _apiService.postData(
          endPoint: EndPoints.translaterOrders, sendAuthToken: true);
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

  @override
  Future<Either<Failure, OrderModel>> acceptOrder(
      {required int orderId}) async {
    try {
      final response = await _apiService.postData(
          endPoint: EndPoints.acceptOrder,
          sendAuthToken: true,
          data: {'id': orderId});
      return Right(OrderModel.fromMap(response.data['data']));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
