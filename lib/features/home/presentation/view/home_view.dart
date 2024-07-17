import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kolayca/core/utils/assets/app_assets.dart';
import 'package:kolayca/features/home/presentation/widget/home_custem_bottom.dart';

import '../../../../core/utils/colors/app_color.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/functions/custem_navigate.dart';
import '../../../../core/utils/roots/app_router.dart';
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
            systemOverlayStyle:  SystemUiOverlayStyle(
              statusBarColor: const Color(0xffEBEBEB),
              statusBarIconBrightness:Brightness.dark,
              systemNavigationBarColor: AppColor.deebPlue,
              statusBarBrightness:Brightness.light,
            ),
          ),
        ),
        body: Column(
      children: [
        SizedBox(
          height: AppConstants.height20(context),
        ),
        const HomeSlider(),
        SizedBox(
          height: AppConstants.height20(context),
        ),
        Expanded(
          child: GridView.builder(
              padding: EdgeInsets.symmetric(
                  vertical: AppConstants.height10(context),
                  horizontal: AppConstants.width20(context)),
              itemCount: 8,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: AppConstants.width10(context),
                mainAxisSpacing: AppConstants.height10(context),
                childAspectRatio: 1.4,
              ),
              itemBuilder: (context, index) {
                return const HomeCustemBottom();
              }),
        )
      ],
    ));
  }
}
