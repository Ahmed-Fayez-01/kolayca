import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/profile_repo.dart';

part 'delete_account_state.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  final ProfileRepo _profileRepo;

  DeleteAccountCubit(this._profileRepo) : super(DeleteAccountInitial());
  Future<void> deleteAccount() async {
    emit(DeleteAccountLoading());
    final result = await _profileRepo.deleteAccount();
    result.fold(
      (l) => emit(DeleteAccountError(l.errMessage)),
      (r) => emit(DeleteAccountSuccess()),
    );
  }
}
