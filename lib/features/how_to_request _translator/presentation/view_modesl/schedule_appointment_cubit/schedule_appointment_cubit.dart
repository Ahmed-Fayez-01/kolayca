import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kolayca/features/how_to_request%20_translator/data/repo/request_translator_repo.dart';
part 'schedule_appointment_state.dart';

class ScheduleAppointmentCubit extends Cubit<ScheduleAppointmentState> {
  ScheduleAppointmentCubit(this._requestTranslatorRepo)
      : super(ScheduleAppointmentInitial());
  final RequestTranslatorRepo _requestTranslatorRepo;
  Future<void> scheduleAppointment() async {
    emit(ScheduleAppointmentLoading());
    final result = await _requestTranslatorRepo.scheduleAppointment(data: data);
    result.fold(
      (l) => emit(ScheduleAppointmentError(l.errMessage)),
      (r) {
        emit(ScheduleAppointmentSuccess());
      },
    );
  }

  final Map<String, dynamic> data = {};

  void updateData({required String key, required dynamic value}) {
    data[key] = value;
    emit(ScheduleAppointmentUpdate());
  }
}
