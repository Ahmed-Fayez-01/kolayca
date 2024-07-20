import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

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
        emit(UpdateProfileSuccess(r));
      },
    );
  }
}
