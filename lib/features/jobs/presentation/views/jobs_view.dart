import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolayca/core/shared_widgets/custem_header_widget.dart';
import 'package:kolayca/core/shared_widgets/text_widget.dart';
import 'package:kolayca/core/utils/constants.dart';
import 'package:kolayca/core/utils/helpers/url_launcher_helper.dart';
import 'package:kolayca/core/utils/text_styles/app_text_style.dart';
import 'package:kolayca/features/hwo_us/presentation/view_models/about_us_cubit/about_us_cubit.dart';

import '../../../../core/utils/colors/app_color.dart';

class JobsView extends StatelessWidget {
  const JobsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEBEBEB),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0.0), // here the desired height
        child: AppBar(
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Color(0xffEBEBEB),
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: AppColor.deebPlue,
            statusBarBrightness: Brightness.light,
          ),
        ),
      ),
      body: BlocBuilder<AboutUsCubit, AboutUsState>(builder: (context, state) {
        if (state is AboutUsSuccessState) {
          return Column(
            children: [
              SizedBox(
                height: AppConstants.height20(context),
              ),
              CustemHeaderWidget(
                text: 'jobs'.tr(),
              ),
              Expanded(
                child: Column(
                  children: [
                    50.verticalSpace,
                    Text(
                      "workWithUsAsTranslator".tr(),
                      style: AppTextStyle.aljazeera400Style34d.copyWith(
                          fontSize: MediaQuery.of(context).size.height * .032),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    ),
                    SizedBox(
                      height: AppConstants.height20(context),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppConstants.width50(context)),
                      child: Text(
                        "contactForTranslatorWork".tr(),
                        style: AppTextStyle.aljazeera400Style34d.copyWith(
                            fontSize: MediaQuery.of(context).size.height * .02),
                        textAlign: TextAlign.center,
                        maxLines: 3,
                      ),
                    ),
                    SizedBox(
                      height: AppConstants.height20(context),
                    ),
                    TextWidget(
                      title: "phone".tr(),
                      titleSize: 22.sp,
                      titleFontWeight: FontWeight.w600,
                      titleColor: AppColor.deebPlue,
                      titleMaxLines: 10,
                    ),
                    SizedBox(
                      height: AppConstants.height10(context),
                    ),
                    InkWell(
                      onTap: () {
                        UrlLauncherHelper.launch('tel://+90 555 555 55 55');
                      },
                      child: TextWidget(
                        title: "+90 555 555 55 55".tr(),
                        titleSize: 22.sp,
                        titleFontWeight: FontWeight.w400,
                        titleColor: AppColor.deebPlue,
                        titleMaxLines: 10,
                      ),
                    ),
                    SizedBox(
                      height: AppConstants.height20(context),
                    ),
                    TextWidget(
                      title: "email".tr(),
                      titleSize: 22.sp,
                      titleFontWeight: FontWeight.w600,
                      titleColor: AppColor.deebPlue,
                      titleMaxLines: 10,
                    ),
                    SizedBox(
                      height: AppConstants.height10(context),
                    ),
                    InkWell(
                      onTap: () {
                        AppConstants.urlLaunch(
                            url: 'https://jobsalooturkey.com/');
                      },
                      child: TextWidget(
                        title: "jobsalooturkey.com",
                        titleSize: 22.sp,
                        titleFontWeight: FontWeight.w400,
                        titleColor: AppColor.deebPlue,
                        textDecoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
        if (state is AboutUsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return const SizedBox();
        }
      }),
    );
  }
}
