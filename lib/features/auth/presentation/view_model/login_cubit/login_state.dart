part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final AuthDataModel model;

  LoginSuccessState(this.model);
}

class LoginErrorState extends LoginState {
  final String errMessage;

  LoginErrorState(this.errMessage);
}
