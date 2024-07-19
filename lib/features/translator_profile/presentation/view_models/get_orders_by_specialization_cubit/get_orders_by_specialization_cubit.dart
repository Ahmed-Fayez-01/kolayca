import 'package:bloc/bloc.dart';
import 'package:kolayca/features/translator_profile/data/repos/translator_orders_repo.dart';
import 'package:meta/meta.dart';
import '../../../../requests/data/models/order.dart';
import 'package:equatable/equatable.dart';

part 'get_orders_by_specialization_state.dart';

class GetOrdersBySpecializationCubit
    extends Cubit<GetOrdersBySpecializationState> {
  final TranslatorOrdersRepo getOrdersBySpecializationRepo;
  GetOrdersBySpecializationCubit(this.getOrdersBySpecializationRepo)
      : super(GetOrdersBySpecializationInitial());
  List<OrderModel> orders = [];
  Future<void> getOrdersBySpecialization() async {
    emit(GetOrdersBySpecializationLoading());
    final result = await getOrdersBySpecializationRepo.getOrdersBySpeciality();
    result.fold(
      (failure) {
        print(failure.errMessage);
        emit(GetOrdersBySpecializationFailure(failure.errMessage));
      },
      (orders) {
        this.orders = orders;
        emit(GetOrdersBySpecializationSuccess(orders));
      },
    );
  }

  void removeOrder(int index) {
    emit(GetOrdersBySpecializationLoading());
    orders.removeAt(index);
    emit(GetOrdersBySpecializationSuccess(orders));
  }
}
