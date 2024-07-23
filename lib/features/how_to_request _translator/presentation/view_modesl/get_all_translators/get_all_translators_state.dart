part of 'get_all_translators_cubit.dart';

sealed class GetAllTranslatorsState extends Equatable {
  const GetAllTranslatorsState();
}

final class GetAllTranslatorsInitial extends GetAllTranslatorsState {
  @override
  List<Object> get props => [];
}

final class GetAllTranslatorsLoading extends GetAllTranslatorsState {
  @override
  List<Object> get props => [];
}

final class GetAllTranslatorsLoaded extends GetAllTranslatorsState {
  final List<UserModel> translators;
  const GetAllTranslatorsLoaded(this.translators);
  @override
  List<Object> get props => [translators];
}

final class GetAllTranslatorsError extends GetAllTranslatorsState {
  final String message;
  const GetAllTranslatorsError(this.message);
  @override
  List<Object> get props => [message];
}
