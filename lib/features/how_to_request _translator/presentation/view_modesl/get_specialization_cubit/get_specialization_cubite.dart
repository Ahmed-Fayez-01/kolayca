import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/specialization.dart';
import '../../../data/repo/request_translator_repo.dart';

part 'get_specialization_state.dart';

class GetSpecializationCubit extends Cubit<GetSpecializationState> {
  GetSpecializationCubit(this._requestTranslatorRepo)
      : super(GetSpecializationInitial());
  final RequestTranslatorRepo _requestTranslatorRepo;
  Future<void> getSpecialization() async {
    emit(GetSpecializationLoading());
    final result = await _requestTranslatorRepo.getSpecializations();
    result.fold(
      (l) => emit(GetSpecializationError(l.errMessage)),
      (r) {
        emit(GetSpecializationSuccess(r));
      },
    );
  }
}
