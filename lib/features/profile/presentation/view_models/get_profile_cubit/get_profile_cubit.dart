import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kolayca/core/utils/services/remote_services/service_locator.dart';
import 'package:kolayca/features/profile/data/repos/profile_repo.dart';

import '../../../data/models/user_model.dart';

part 'get_profile_state.dart';

class GetProfileCubit extends Cubit<GetProfileState> {
  GetProfileCubit(this._profileRepo) : super(GetProfileInitial());
  final ProfileRepo _profileRepo;

  Future<void> fetchProfile() async {
    emit(GetProfileLoading());
    final result = await _profileRepo.getUserProfile();
    result.fold(
      (l) {
        
  
        emit(GetProfileError(l.errMessage));
      },
      (r) async {
       
        getIt.registerSingleton<UserModel>(r);
        emit(GetProfileSuccess(r));
      },
    );
  }

  UserModel? getUserProfile() {
    if (getIt.isRegistered<UserModel>()) {
      return getIt<UserModel>();
    }
    return null;
  }
}
