part of 'get_profile_cubit.dart';

sealed class GetProfileState extends Equatable {
  const GetProfileState();

  @override
  List<Object> get props => [];
}

final class GetProfileInitial extends GetProfileState {}

final class GetProfileLoading extends GetProfileState {}

final class GetProfileSuccess extends GetProfileState {
  final UserModel userModel;
  const GetProfileSuccess(this.userModel);
}

final class GetProfileError extends GetProfileState {
  final String message;
  const GetProfileError(this.message);
}