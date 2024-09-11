import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kolayca/features/how_to_request%20_translator/data/repo/request_translator_repo.dart';
import 'package:kolayca/features/profile/data/models/user_model.dart';

part 'get_all_translators_state.dart';

class GetAllTranslatorsCubit extends Cubit<GetAllTranslatorsState> {
  GetAllTranslatorsCubit(this._requestTranslatorRepo)
      : super(GetAllTranslatorsInitial());
  final RequestTranslatorRepo _requestTranslatorRepo;

  Future<void> getAllTranslators() async {
    emit(GetAllTranslatorsLoading());
    final result = await _requestTranslatorRepo.getAllTranslators();
    result.fold(
      (l) => emit(GetAllTranslatorsError(l.errMessage)),
      (r) => emit(GetAllTranslatorsLoaded(r)),
    );
  }
}
