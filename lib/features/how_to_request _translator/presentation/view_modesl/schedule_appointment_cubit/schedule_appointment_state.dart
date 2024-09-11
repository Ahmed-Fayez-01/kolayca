part of 'schedule_appointment_cubit.dart';

abstract class ScheduleAppointmentState {}

class ScheduleAppointmentInitial extends ScheduleAppointmentState {}

class ScheduleAppointmentLoading extends ScheduleAppointmentState {}

class ScheduleAppointmentUpdate extends ScheduleAppointmentState {}

class ScheduleAppointmentSuccess extends ScheduleAppointmentState {}

class ScheduleAppointmentError extends ScheduleAppointmentState {
  final String message;

  ScheduleAppointmentError(this.message);
}
