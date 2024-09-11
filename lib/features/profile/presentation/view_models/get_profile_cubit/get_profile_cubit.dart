import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kolayca/core/utils/services/remote_services/service_locator.dart';
import 'package:kolayca/core/utils/services/remote_services/zego_cloud_service.dart';
import 'package:kolayca/features/profile/data/models/user_model.dart';
import 'package:kolayca/features/profile/data/repos/profile_repo.dart';

part 'get_profile_state.dart';

class GetProfileCubit extends Cubit<GetProfileState> {
  GetProfileCubit(this._profileRepo) : super(GetProfileInitial());
  final ProfileRepo _profileRepo;

  Future<void> fetchProfile(context) async {
    emit(GetProfileLoading());
    final result = await _profileRepo.getUserProfile();
    result.fold(
      (l) {
        emit(GetProfileError(l.errMessage));
      },
      (r) async {
        if (getIt.isRegistered<UserModel>()) {
          await getIt.unregister<UserModel>();
        }
        getIt.registerSingleton<UserModel>(r);
        ZegoServices.initZego(r.id.toString(), r.name ?? '');

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
