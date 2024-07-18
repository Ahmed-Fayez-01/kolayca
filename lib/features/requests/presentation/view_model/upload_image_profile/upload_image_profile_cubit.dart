import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'upload_image_profile_state.dart';

class UploadImageProfileCubit extends Cubit<UploadImageProfileState> {
  UploadImageProfileCubit() : super(UploadImageProfileInitial());

  static UploadImageProfileCubit get(context) => BlocProvider.of(context);

  File? profileImage;

  Future selectProfileImage() async {
    emit(SelectProfileImageLoadingState());
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ["png", "jpg", "jpeg"]);
    if (result != null) {
      profileImage = File(result.files.single.path!);
      emit(SelectProfileImageSuccessState(image: profileImage));

    }
  }
}
