import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:kolayca/features/auth/data/models/auth_data_model.dart';
import 'package:kolayca/features/profile/data/models/user_model.dart';

import '../../../../../core/utils/services/remote_services/service_locator.dart';
import '../../../data/repo/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  AuthRepo? authRepo;
  Future<void> login({required Map<String, dynamic> data}) async {
    emit(LoginLoadingState());
    var result = await authRepo!.login(data: data);

    return result.fold((failure) {
      emit(LoginErrorState(failure.errMessage));
    }, (data) {
      if (data.status == true) {
        final user = UserModel.fromMap(data.data!.toJson());
        getIt.registerSingleton<UserModel>(user);
        emit(LoginSuccessState(data));
      } else {
        emit(LoginErrorState(data.message.toString()));
      }
    });
  }
}
