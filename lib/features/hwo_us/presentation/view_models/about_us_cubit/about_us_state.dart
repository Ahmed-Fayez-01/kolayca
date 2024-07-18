part of 'about_us_cubit.dart';

@immutable
abstract class AboutUsState {}

class AboutUsInitial extends AboutUsState {}

class AboutUsLoadingState extends AboutUsState {}

class AboutUsSuccessState extends AboutUsState {
  final AboutUsModel model;

  AboutUsSuccessState(this.model);
}

class AboutUsErrorState extends AboutUsState {
  final String errMessage;

  AboutUsErrorState(this.errMessage);
}
