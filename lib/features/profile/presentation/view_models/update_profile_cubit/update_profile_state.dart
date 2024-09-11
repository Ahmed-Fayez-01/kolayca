part of 'update_profile_cubit.dart';

sealed class UpdateProfileState extends Equatable {
  const UpdateProfileState();

  @override
  List<Object> get props => [];
}

final class UpdateProfileInitial extends UpdateProfileState {}

final class UpdateProfileLoading extends UpdateProfileState {}

final class UpdateProfileSuccess extends UpdateProfileState {
  final UserModel userModel;

  const UpdateProfileSuccess(this.userModel);

  @override
  List<Object> get props => [userModel];
}

final class UpdateProfileError extends UpdateProfileState {
  final String errMessage;

  const UpdateProfileError(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}
