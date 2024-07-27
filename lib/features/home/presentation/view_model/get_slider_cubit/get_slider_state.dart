part of 'get_slider_cubit.dart';

abstract class GetSliderDataState {}

class GetSliderDataInitial extends GetSliderDataState {}

class GetSliderDataLoadingState extends GetSliderDataState {}

class GetSliderDataSuccessState extends GetSliderDataState {
  final SliderModel model;

  GetSliderDataSuccessState(this.model);
}

class GetSliderDataErrorState extends GetSliderDataState {
  final String errMessage;

  GetSliderDataErrorState(this.errMessage);
}
