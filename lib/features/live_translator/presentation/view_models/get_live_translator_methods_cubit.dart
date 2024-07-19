import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kolayca/features/live_translator/data/repos/live_translator_method_repo.dart';

import '../../data/models/live_translator_method.dart';
part 'get_live_translator_methods_state.dart';

class GetLiveTranslatorMethodsCubit
    extends Cubit<GetLiveTranslatorMethodsState> {
  final LiveTranslatorMethodRepo _liveTranslatorMethodRepo;
  GetLiveTranslatorMethodsCubit(this._liveTranslatorMethodRepo)
      : super(GetLiveTranslatorMethodsInitial());

  Future<void> getLiveTranslatorMethods() async {
    emit(GetLiveTranslatorMethodsLoading());
    final result = await _liveTranslatorMethodRepo.getLiveTranslatorMethod();
    result.fold((failure) {
      emit(GetLiveTranslatorMethodsFailure(failure.toString()));
    }, (liveTranslatorMethods) {
      emit(GetLiveTranslatorMethodsSuccess(liveTranslatorMethods));
    });
  }
}
