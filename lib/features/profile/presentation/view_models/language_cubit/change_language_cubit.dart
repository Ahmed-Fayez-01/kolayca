import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

part 'change_language_state.dart';

class ChangeLanguageCubit extends Cubit<ChangeLanguageState> {
  ChangeLanguageCubit() : super(ChangeLanguageInitial());

  void changeLanguage(BuildContext context, String languageCode) {
    emit(ChangeLanguageLoading());
    try {
      context.setLocale(Locale(languageCode));
      Future.delayed(Duration(milliseconds: 800), () {
        emit(ChangeLanguageSuccess());
      });
    } catch (e) {
      emit(ChangeLanguageError());
    }
  }
}
