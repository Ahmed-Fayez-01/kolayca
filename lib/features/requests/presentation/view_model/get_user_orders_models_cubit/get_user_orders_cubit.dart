import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/services/remote_services/service_locator.dart';
import '../../../data/models/order.dart';
import '../../../data/repos/orders_repo.dart';
part 'get_user_orders_state.dart';

class GetUserOrdersCubit extends Cubit<GetUserOrdersState> {
  GetUserOrdersCubit() : super(GetUserOrdersInitial());

  void getUserOrders() async {
    emit(GetUserOrdersLoading());
    final response = await getIt<OrdersRepo>().getUserOrders();
    response.fold(
      (l) => emit(GetUserOrdersError(l.errMessage)),
      (r) => emit(GetUserOrdersSuccess(r)),
    );
  }
}
