part of 'upload_image_profile_cubit.dart';

@immutable
abstract class UploadImageProfileState {}

class UploadImageProfileInitial extends UploadImageProfileState {}

class SelectProfileImageLoadingState extends UploadImageProfileState {}

class SelectProfileImageSuccessState extends UploadImageProfileState {
  final File? image;

  SelectProfileImageSuccessState({required this.image});
}
