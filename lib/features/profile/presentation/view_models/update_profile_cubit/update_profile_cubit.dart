import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kolayca/core/utils/services/remote_services/zego_cloud_service.dart';

import '../../../../../core/utils/services/remote_services/service_locator.dart';
import '../../../data/models/user_model.dart';
import '../../../data/repos/profile_repo.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit(this._profileRepo) : super(UpdateProfileInitial());
  final ProfileRepo _profileRepo;
  Future<void> updateUserProfile({required Map<String, dynamic> data}) async {
    emit(UpdateProfileLoading());
    final result = await _profileRepo.updateUserProfile(data: data);
    result.fold(
      (l) => emit(UpdateProfileError(l.errMessage)),
      (r) async {
        await getIt.unregister<UserModel>();
        getIt.registerSingleton<UserModel>(r);
        ZegoServices.initZego(r.id.toString(), r.name ?? '');

        emit(UpdateProfileSuccess(r));
      },
    );
  }
}
