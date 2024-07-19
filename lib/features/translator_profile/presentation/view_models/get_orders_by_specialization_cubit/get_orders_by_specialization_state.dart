part of 'get_orders_by_specialization_cubit.dart';

@immutable
sealed class GetOrdersBySpecializationState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class GetOrdersBySpecializationInitial
    extends GetOrdersBySpecializationState {}

final class GetOrdersBySpecializationLoading
    extends GetOrdersBySpecializationState {}

final class GetOrdersBySpecializationSuccess
    extends GetOrdersBySpecializationState {
  final List<OrderModel> orders;
  GetOrdersBySpecializationSuccess(this.orders);

  @override
  List<Object?> get props => [orders];
}

final class GetOrdersBySpecializationFailure
    extends GetOrdersBySpecializationState {
  final String failure;
  GetOrdersBySpecializationFailure(this.failure);

  @override
  List<Object?> get props => [failure];
}
