import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kolayca/features/lessons/data/repos/lessons_repo.dart';

import '../../../data/models/lesson.dart';

part 'get_lessons_state.dart';

class GetLessonsCubit extends Cubit<GetLessonsState> {
  final LessonsRepo lessonsRepo;
  GetLessonsCubit({required this.lessonsRepo}) : super(GetLessonsInitial());

  Future<void> getLessons() async {
    emit(GetLessonsLoading());
    final result = await lessonsRepo.getLessons();
    result.fold((failure) {
      emit(GetLessonsFailure(failure.errMessage));
    }, (lessons) {
      emit(GetLessonsSuccess(lessons));
    });
  }
}
