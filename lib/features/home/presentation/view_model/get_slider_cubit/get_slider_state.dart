part of 'get_slider_cubit.dart';

@immutable
abstract class GetSliderDataState {}

class GetSliderDataInitial extends GetSliderDataState {}

class GetSliderDataLoadingState extends GetSliderDataState {}

class GetSliderDataSuccessState extends GetSliderDataState {
  final HomeDataModel model;

  GetSliderDataSuccessState(this.model);
}

class GetSliderDataErrorState extends GetSliderDataState {
  final String errMessage;

  GetSliderDataErrorState(this.errMessage);
}
