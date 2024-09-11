part of 'accept_order_cubit.dart';

@immutable
sealed class AcceptOrderState {}

final class AcceptOrderInitial extends AcceptOrderState {}

final class AcceptOrderLoading extends AcceptOrderState {}

final class AcceptOrderSuccess extends AcceptOrderState {
  final OrderModel orderModel;

  AcceptOrderSuccess(this.orderModel);
}

final class AcceptOrderFailure extends AcceptOrderState {
  final String failure;
  AcceptOrderFailure(this.failure);
}
