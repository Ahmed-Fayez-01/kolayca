import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kolayca/core/utils/helpers/url_launcher_helper.dart';
import 'package:kolayca/features/home/presentation/view_model/get_home_data_cubit/get_home_data_cubit.dart';
import 'package:kolayca/features/home/presentation/view_model/get_slider_cubit/get_slider_cubit.dart';
import 'package:kolayca/features/home/presentation/widget/home_custem_bottom.dart';
import 'package:kolayca/features/lessons/presentation/view/lesson_view.dart';
import 'package:kolayca/features/nearest_translator/presentation/view/nearest_translator_view.dart';
import 'package:kolayca/features/subscription_%20package/presentation/view/subscription_package_view.dart';

import '../../../../core/utils/colors/app_color.dart';
import '../../../../core/utils/constants.dart';
import '../../../how_to_request _translator/presentation/view/how_to_request_translator_view.dart';
import '../widget/home_slider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0.0), // here the desired height
          child: AppBar(
            elevation: 0,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
              systemNavigationBarColor: AppColor.deebPlue,
              statusBarBrightness: Brightness.light,
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: AppConstants.height30(context),
            ),
            BlocBuilder<GetSliderDataCubit, GetSliderDataState>(
                builder: (context, state) {
              return state is GetSliderDataLoadingState
                  ? const Center(child: CircularProgressIndicator())
                  : const HomeSlider();
            }),
            SizedBox(
              height: AppConstants.height10(context),
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
                        final data = state.model.data![index];
                        return HomeCustomBottom(
                          data: data,
                          onTap: () {
                            if (data.linkUrl != null &&
                                data.linkUrl != "null") {
                              UrlLauncherHelper.launch(data.linkUrl!);
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => switch (data.id) {
                                          1 =>
                                            const HowToRequestTranslatorView(),
                                          3 => const SubscriptionPackageView(
                                              hasBack: true),
                                          5 => const NearestTranslatorView(
                                              hasBack: true),
                                          7 => const LessonsView(),
                                          _ => const Scaffold(),
                                        }),
                              );
                            }
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
