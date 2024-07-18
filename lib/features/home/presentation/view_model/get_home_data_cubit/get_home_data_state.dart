part of 'get_home_data_cubit.dart';

@immutable
abstract class GetHomeDataState {}

class GetHomeDataInitial extends GetHomeDataState {}

class GetHomeDataLoadingState extends GetHomeDataState {}

class GetHomeDataSuccessState extends GetHomeDataState {
  final HomeDataModel model;

  GetHomeDataSuccessState(this.model);
}

class GetHomeDataErrorState extends GetHomeDataState {
  final String errMessage;

  GetHomeDataErrorState(this.errMessage);
}
