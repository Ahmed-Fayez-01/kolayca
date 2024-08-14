import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:kolayca/features/auth/data/models/auth_data_model.dart';

import '../../../../../core/utils/services/remote_services/service_locator.dart';
import '../../../../../core/utils/services/remote_services/zego_cloud_service.dart';
import '../../../../profile/data/models/user_model.dart';
import '../../../data/repo/auth_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepo) : super(UserRegisterInitial());
  AuthRepo? authRepo;

  Future<void> userRegister({
    required String password,
    required String email,
    required String confirmPassword,
    required String name,
  }) async {
    emit(UserRegisterLoadingState());

    var result = await authRepo!.register(
      data: {
        "email": email,
        "password": password,
        "confirm_password": confirmPassword,
        "name": name,
      },
    );
    return result.fold((failure) {
      emit(UserRegisterErrorState(failure.errMessage));
    }, (data) {
      if (data.status == true) {
        final user = data.data!;
        getIt.registerSingleton<UserModel>(user);
        ZegoServices.initZego(user.id.toString(), user.name ?? '');
        emit(UserRegisterSuccessState(data));
      } else {
        emit(UserRegisterErrorState(data.message.toString()));
      }
    });
  }
}
