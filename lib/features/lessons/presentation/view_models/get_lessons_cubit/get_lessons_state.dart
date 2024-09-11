part of 'get_lessons_cubit.dart';

abstract class GetLessonsState {}

class GetLessonsInitial extends GetLessonsState {}

class GetLessonsLoading extends GetLessonsState {}

class GetLessonsSuccess extends GetLessonsState {
  final List<Lesson> lessons;
  GetLessonsSuccess(this.lessons);
}

class GetLessonsFailure extends GetLessonsState {
  final String message;
  GetLessonsFailure(this.message);
}
