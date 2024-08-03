part of 'get_notifications_cubit.dart';

sealed class GetNotificationsState {}

final class GetNotificationsInitial extends GetNotificationsState {}

final class GetNotificationsLoading extends GetNotificationsState {}

final class GetNotificationsSuccess extends GetNotificationsState {
  final List<NotificationModel> notifications;
  GetNotificationsSuccess(this.notifications);
}

final class GetNotificationFailed extends GetNotificationsState {
  final String failure;
  GetNotificationFailed(this.failure);
}
