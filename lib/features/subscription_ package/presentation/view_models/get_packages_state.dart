part of 'get_packages_cubit.dart';

abstract class GetPackagesState {}

class GetPackagesInitial extends GetPackagesState {}

class GetPackagesLoading extends GetPackagesState {}

class GetPackagesSuccess extends GetPackagesState {
  final List<PackageModel> packages;

  GetPackagesSuccess(this.packages);
}

class GetPackagesError extends GetPackagesState {
  final String message;

  GetPackagesError(this.message);
}
