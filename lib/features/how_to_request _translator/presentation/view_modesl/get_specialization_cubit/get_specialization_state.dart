part of 'get_specialization_cubite.dart';

abstract class GetSpecializationState {}

class GetSpecializationInitial extends GetSpecializationState {}

class GetSpecializationLoading extends GetSpecializationState {}

class GetSpecializationUpdate extends GetSpecializationState {}

class GetSpecializationSuccess extends GetSpecializationState {
  final List<Specialization> specialization;

  GetSpecializationSuccess(this.specialization);
}

class GetSpecializationError extends GetSpecializationState {
  final String message;

  GetSpecializationError(this.message);
}
