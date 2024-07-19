part of 'get_translator_orders_cubit.dart';

@immutable
sealed class GetTranslatorOrdersState {}

final class GetTranslatorOrdersInitial extends GetTranslatorOrdersState {}

final class GetTranslatorOrdersLoading extends GetTranslatorOrdersState {}

final class GetTranslatorOrdersSuccess extends GetTranslatorOrdersState {
  final List<OrderModel> orders;
  GetTranslatorOrdersSuccess(this.orders);
}

final class GetTranslatorOrdersFailure extends GetTranslatorOrdersState {
  final String failure;
  GetTranslatorOrdersFailure(this.failure);
}
