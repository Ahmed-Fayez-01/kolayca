import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kolayca/core/utils/assets/app_assets.dart';
import 'package:kolayca/features/home/presentation/view_model/get_home_data_cubit/get_home_data_cubit.dart';
import 'package:kolayca/features/home/presentation/view_model/get_slider_cubit/get_slider_cubit.dart';
import 'package:kolayca/features/home/presentation/widget/home_custem_bottom.dart';
import 'package:kolayca/features/lessons/presentation/view/lesson_view.dart';

import '../../../../core/utils/colors/app_color.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/functions/custem_navigate.dart';
import '../../../../core/utils/roots/app_router.dart';
import '../../../how_to_request _translator/presentation/view/how_to_request_translator_view.dart';
import '../widget/home_slider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffEBEBEB),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0.0), // here the desired height
          child: AppBar(
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: const Color(0xffEBEBEB),
              statusBarIconBrightness: Brightness.dark,
              systemNavigationBarColor: AppColor.deebPlue,
              statusBarBrightness: Brightness.light,
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: AppConstants.height20(context),
            ),
            BlocBuilder<GetSliderDataCubit, GetSliderDataState>(
                builder: (context, state) {
              return state is GetSliderDataLoadingState
                  ? const Center(child: CircularProgressIndicator())
                  : const HomeSlider();
            }),
            SizedBox(
              height: AppConstants.height20(context),
            ),
            Expanded(
              child: BlocBuilder<GetHomeDataCubit, GetHomeDataState>(
                  builder: (context, state) {
                if (state is GetHomeDataSuccessState) {
                  return GridView.builder(
                      padding: EdgeInsets.symmetric(
                          vertical: AppConstants.height10(context),
                          horizontal: AppConstants.width20(context)),
                      itemCount: state.model.data!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: AppConstants.width10(context),
                        mainAxisSpacing: AppConstants.height10(context),
                        childAspectRatio: 1.4,
                      ),
                      itemBuilder: (context, index) {
                        return HomeCustomBottom(
                          data: state.model.data![index],
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => index == 0
                                        ? const HowToRequestTranslatorView()
                                        : const LessonsView()));
                          },
                        );
                      });
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
            )
          ],
        ));
  }
}
