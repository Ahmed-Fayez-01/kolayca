import 'package:bloc/bloc.dart';
import 'package:kolayca/features/translator_profile/data/repos/translator_orders_repo.dart';
import 'package:meta/meta.dart';

import '../../../../requests/data/models/order.dart';

part 'accept_order_state.dart';

class AcceptOrderCubit extends Cubit<AcceptOrderState> {
  final TranslatorOrdersRepo translatorOrdersRepo;

  AcceptOrderCubit(this.translatorOrdersRepo) : super(AcceptOrderInitial());

  Future<void> acceptOrder(int orderId) async {
    emit(AcceptOrderLoading());
    final result = await translatorOrdersRepo.acceptOrder(orderId: orderId);
    result.fold((l) {
      emit(AcceptOrderFailure(l.errMessage));
    }, (r) {
      emit(AcceptOrderSuccess(r));
    });
  }
}
