part of 'upload_sign_up_image_profile_cubit.dart';

@immutable
abstract class UploadSignUpImageProfileState {}

class UploadImageProfileInitial extends UploadSignUpImageProfileState {}

class SelectSignUpProfileImageLoadingState
    extends UploadSignUpImageProfileState {}

class SelectSignUpProfileImageSuccessState
    extends UploadSignUpImageProfileState {
  final File? image;

  SelectSignUpProfileImageSuccessState({required this.image});
}
