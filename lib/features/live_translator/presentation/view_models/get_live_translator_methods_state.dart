part of 'get_live_translator_methods_cubit.dart';

abstract class GetLiveTranslatorMethodsState {}

class GetLiveTranslatorMethodsInitial extends GetLiveTranslatorMethodsState {}

class GetLiveTranslatorMethodsLoading extends GetLiveTranslatorMethodsState {}

class GetLiveTranslatorMethodsSuccess extends GetLiveTranslatorMethodsState {
  final List<LiveTranslatorMethod> liveTranslatorMethods;
  GetLiveTranslatorMethodsSuccess(this.liveTranslatorMethods);
}

class GetLiveTranslatorMethodsFailure extends GetLiveTranslatorMethodsState {
  final String failure;
  GetLiveTranslatorMethodsFailure(this.failure);
}
