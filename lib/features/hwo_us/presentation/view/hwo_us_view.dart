import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolayca/core/utils/assets/app_assets.dart';
import 'package:kolayca/core/utils/constants.dart';
import 'package:kolayca/core/utils/text_styles/app_text_style.dart';
import 'package:kolayca/features/hwo_us/presentation/view_models/about_us_cubit/about_us_cubit.dart';

import '../../../../core/shared_widgets/custem_header_widget.dart';
import '../../../../core/shared_widgets/image_widget.dart';
import '../../../../core/shared_widgets/text_widget.dart';
import '../../../../core/shared_widgets/video_player_widget.dart';
import '../../../../core/utils/colors/app_color.dart';
import '../../../home/presentation/view_model/get_slider_cubit/get_slider_cubit.dart';

class HwoUsView extends StatelessWidget {
  const HwoUsView({super.key});

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
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: AppConstants.height20(context),
                ),
                CustemHeaderWidget(
                  text: 'whoUs'.tr(),
                ),
                SizedBox(
                  height: AppConstants.height20(context),
                ),
                Image.network(context.read<GetSliderDataCubit>().logoImageurl!,
                    width: MediaQuery.of(context).size.width * .5
                ),
                SizedBox(
                  height: AppConstants.height20(context),
                ),
                Text(
                  state.model.data!.titleAbout != null
                      ? state.model.data!.titleAbout!
                      : 'لا يوجد عنوان',
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
                      horizontal: AppConstants.width20(context)),
                  child: Text(
                    state.model.data!.aboutUs!,
                    style: AppTextStyle.aljazeera400Style34d.copyWith(
                        fontSize: MediaQuery.of(context).size.height * .02),
                    textAlign: TextAlign.center,
                    maxLines: 3,
                  ),
                ),
                SizedBox(
                  height: AppConstants.height20(context),
                ),
                if (state.model.data!.video != null)
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppConstants.width20(context)),
                    child: VideoPlayerWidget(
                      url: state.model.data!.video,
                    ),
                  ),
                SizedBox(
                  height: AppConstants.height20(context),
                ),
                TextWidget(
                  title: "Follow Us".tr(),
                  titleSize: 22.sp,
                  titleFontWeight: FontWeight.w600,
                  titleColor: AppColor.deebPlue,
                  titleMaxLines: 10,
                ),
                SizedBox(
                  height: AppConstants.height10(context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageWidget(
                      imageUrl: "assets/images/snap.png",
                      width: 60.w,
                      fit: BoxFit.fill,
                      onTap: () {
                        AppConstants.urlLaunch(
                            url: state.model.data!.snapchatLink!);
                      },
                      height: 60.h,
                    ),
                    SizedBox(
                      width: AppConstants.width10(context),
                    ),
                    ImageWidget(
                      imageUrl: "assets/images/insta.png",
                      width: 60.w,
                      fit: BoxFit.fill,
                      onTap: () {
                        AppConstants.urlLaunch(
                            url: state.model.data!.instagramLink!);
                      },
                      height: 60.h,
                    ),
                    SizedBox(
                      width: AppConstants.width10(context),
                    ),
                    ImageWidget(
                      imageUrl: "assets/images/face.png",
                      width: 60.w,
                      fit: BoxFit.fill,
                      onTap: () {
                        AppConstants.urlLaunch(
                            url: state.model.data!.facebookLink!);
                      },
                      height: 60.h,
                    ),
                    SizedBox(
                      width: AppConstants.width10(context),
                    ),
                    ImageWidget(
                      imageUrl: "assets/images/tik.png",
                      width: 60.w,
                      onTap: () {
                        AppConstants.urlLaunch(url: state.model.data!.tiktok!);
                      },
                      fit: BoxFit.fill,
                      height: 60.h,
                    ),
                  ],
                ),
                SizedBox(
                  height: AppConstants.height5(context),
                ),
                InkWell(
                  onTap: () {
                    AppConstants.urlLaunch(url: 'https://kolaycakonus.com/');
                  },
                  child: TextWidget(
                    title: "www.kolaycakonus.com",
                    titleSize: 22.sp,
                    titleFontWeight: FontWeight.w400,
                    titleColor: AppColor.deebPlue,
                    textDecoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
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
