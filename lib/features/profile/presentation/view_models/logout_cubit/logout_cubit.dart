import 'package:bloc/bloc.dart';
import 'package:kolayca/features/profile/data/repos/profile_repo.dart';
import 'package:meta/meta.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit(this._profileRepo) : super(LogoutInitial());
  final ProfileRepo _profileRepo;

  Future<void> logOut() async {
    emit(LogoutLoading());
    final result = await _profileRepo.logOut();
    result.fold(
      (l) => emit(LogoutFailure(l.errMessage)),
      (r) => emit(LogoutSuccess()),
    );
  }
}
