import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../requests/data/models/order.dart';
import '../../../data/repos/translator_orders_repo.dart';

part 'get_translator_orders_state.dart';

class GetTranslatorOrdersCubit extends Cubit<GetTranslatorOrdersState> {
  final TranslatorOrdersRepo getTranslatorOrdersRepo;
  GetTranslatorOrdersCubit(this.getTranslatorOrdersRepo)
      : super(GetTranslatorOrdersInitial());

  Future<void> getTranslatorOrders() async {
    emit(GetTranslatorOrdersLoading());
    final result = await getTranslatorOrdersRepo.getTranslatorOrders();
    result.fold(
      (failure) => emit(GetTranslatorOrdersFailure(failure.errMessage)),
      (orders) => emit(GetTranslatorOrdersSuccess(orders)),
    );
  }
}
