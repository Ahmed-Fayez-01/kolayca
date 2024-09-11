import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:kolayca/features/hwo_us/data/models/about_us_model.dart';
import 'package:kolayca/features/hwo_us/data/repos/about_us_repo.dart';

part 'about_us_state.dart';

class AboutUsCubit extends Cubit<AboutUsState> {
  AboutUsCubit(this.aboutUsRepo) : super(AboutUsInitial());
  AboutUsRepo? aboutUsRepo;
  AboutUsModel? model;
  Future<void> getSettings() async {
    emit(AboutUsLoadingState());
    var result = await aboutUsRepo!.getAboutSettings();
    return result.fold((failure) {
      emit(AboutUsErrorState(failure.errMessage));
    }, (data) {
      if (data.status == true) {
        model = data;
        emit(AboutUsSuccessState(data));
      } else {
        emit(AboutUsErrorState(data.message.toString()));
      }
    });
  }
}
