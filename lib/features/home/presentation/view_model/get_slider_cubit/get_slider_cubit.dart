import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:kolayca/features/home/data/models/home_data_model.dart';
import '../../../data/repo/auth_repo.dart';

part 'get_slider_state.dart';

class GetSliderDataCubit extends Cubit<GetSliderDataState> {
  GetSliderDataCubit(this.homeRepo) : super(GetSliderDataInitial());
  HomeRepo? homeRepo;

  List<String> sliderImages=[];
  Future<void> getSliderData() async {
    emit(GetSliderDataLoadingState());
    var result = await homeRepo!.getHomeData();

    return result.fold((failure) {
      emit(GetSliderDataErrorState(failure.errMessage));
    }, (data) {
      if (data.status == true) {
        sliderImages.clear();
        for(var item in data.data!){
          sliderImages.add(item.image!);
        }
        emit(GetSliderDataSuccessState(data));
      } else {
        emit(GetSliderDataErrorState(data.message.toString()));
      }
    });
  }
}
