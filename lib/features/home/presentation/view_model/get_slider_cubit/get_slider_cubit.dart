import 'package:bloc/bloc.dart';
import 'package:kolayca/features/home/data/models/slider_model.dart';

import '../../../data/repo/auth_repo.dart';

part 'get_slider_state.dart';

class GetSliderDataCubit extends Cubit<GetSliderDataState> {
  GetSliderDataCubit(this.homeRepo) : super(GetSliderDataInitial());
  HomeRepo? homeRepo;
  String? logoImageurl;
  List<String> sliderImages = [];
  SliderModel? slider;
  Future<void> getSliderData() async {
    emit(GetSliderDataLoadingState());
    var result = await homeRepo!.getSlidersData();

    return result.fold((failure) {
      emit(GetSliderDataErrorState(failure.errMessage));
    }, (data) {
      if (data.status == true) {
        sliderImages.clear();
        for (var item in data.data!) {
          sliderImages.add(item.image!);
        }
        logoImageurl = data.logo;
        slider = data;
        emit(GetSliderDataSuccessState(data));
      } else {
        emit(GetSliderDataErrorState(data.message.toString()));
      }
    });
  }
}
