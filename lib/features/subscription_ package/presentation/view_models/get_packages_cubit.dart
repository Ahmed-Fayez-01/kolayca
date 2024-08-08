import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/package_model.dart';
import '../../data/repo/packages_repo.dart';

part 'get_packages_state.dart';

class GetPackagesCubit extends Cubit<GetPackagesState> {
  final PackagesRepo packagesRepo;

  GetPackagesCubit(this.packagesRepo) : super(GetPackagesInitial());

  Future<void> getPackages() async {
    emit(GetPackagesLoading());
    final result = await packagesRepo.getPackages();
    result.fold(
      (failure) => emit(GetPackagesError(failure.errMessage)),
      (packages) {
        packages.sort(
          (a, b) =>
              num.parse(b.price ?? "0").compareTo(num.parse(a.price ?? '0')),
        );
        emit(GetPackagesSuccess(packages.reversed.toList()));
      },
    );
  }
}
