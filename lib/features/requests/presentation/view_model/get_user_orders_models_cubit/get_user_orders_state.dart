part of 'get_user_orders_cubit.dart';

abstract class GetUserOrdersState {}

class GetUserOrdersInitial extends GetUserOrdersState {}

class GetUserOrdersLoading extends GetUserOrdersState {}

class GetUserOrdersSuccess extends GetUserOrdersState {
  final List<OrderModel> orders;

  GetUserOrdersSuccess(this.orders);
}

class GetUserOrdersError extends GetUserOrdersState {
  final String message;

  GetUserOrdersError(this.message);
}
