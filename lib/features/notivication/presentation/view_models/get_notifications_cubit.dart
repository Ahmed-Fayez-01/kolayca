import 'package:bloc/bloc.dart';
import 'package:kolayca/features/notivication/data/repos/notification_repo.dart';

import '../../data/models/notification_model.dart';

part 'get_notifications_state.dart';

class GetNotificationsCubit extends Cubit<GetNotificationsState> {
  GetNotificationsCubit(this._notificationRepo)
      : super(GetNotificationsInitial());
  final NotificationRepo _notificationRepo;
  void getNotifications() async {
    emit(GetNotificationsLoading());
    final result = await _notificationRepo.getNotifications();
    result.fold(
      (failure) => emit(GetNotificationFailed(failure.errMessage)),
      (r) => emit(GetNotificationsSuccess(r)),
    );
  }
}
