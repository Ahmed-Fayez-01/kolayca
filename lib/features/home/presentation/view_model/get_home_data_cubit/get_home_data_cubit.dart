import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:kolayca/features/home/data/models/home_data_model.dart';
import '../../../data/repo/auth_repo.dart';

part 'get_home_data_state.dart';

class GetHomeDataCubit extends Cubit<GetHomeDataState> {
  GetHomeDataCubit(this.authRepo) : super(GetHomeDataInitial());
  HomeRepo? authRepo;

  Future<void> getHomeData() async {
    emit(GetHomeDataLoadingState());
    var result = await authRepo!.getHomeData();

    return result.fold((failure) {
      emit(GetHomeDataErrorState(failure.errMessage));
    }, (data) {
      if (data.status == true) {
        emit(GetHomeDataSuccessState(data));
      } else {
        emit(GetHomeDataErrorState(data.message.toString()));
      }
    });
  }
}
