import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolayca/core/utils/colors/app_color.dart';
import 'package:kolayca/core/utils/text_styles/app_text_style.dart';

import '../../../../core/shared_widgets/custem_header_widget.dart';
import '../../../../core/shared_widgets/video_player_widget.dart';
import '../../../../core/utils/constants.dart';
import '../view_models/get_live_translator_methods_cubit.dart';

class LiveTranslatorView extends StatelessWidget {
  const LiveTranslatorView({super.key});

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
      body: Column(
        children: [
          SizedBox(height: AppConstants.height20(context)),
          CustemHeaderWidget(
            text: 'requestTranslator'.tr(),
          ),
          SizedBox(height: AppConstants.height20(context)),
          BlocBuilder<GetLiveTranslatorMethodsCubit,
              GetLiveTranslatorMethodsState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    if (state is GetLiveTranslatorMethodsLoading)
                      const Center(child: CircularProgressIndicator()),
                    if (state is GetLiveTranslatorMethodsSuccess)
                      for (var item in state.liveTranslatorMethods) ...[
                        Text(
                          '${item.title}',
                          textAlign: TextAlign.center,
                          style: AppTextStyle.aljazeera400Style34d
                              .copyWith(fontSize: 36.sp),
                        ),
                        SizedBox(height: AppConstants.height10(context)),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppConstants.width20(context)),
                          child: VideoPlayerWidget(url: item.linkUrl),
                        ),
                        SizedBox(height: AppConstants.height10(context)),
                      ],
                    // Text(
                    //     textAlign: TextAlign.center,
                    //     style: AppTextStyle.aljazeera400Style34d.copyWith(
                    //       color: AppColor.plueLight,
                    //       fontSize: 36.sp,
                    //       decoration: TextDecoration.underline,
                    //       decorationColor: AppColor.plueLight,
                    //     ),
                    //     'طريقة طلب مترجم مباشر'),
                    // SizedBox(height: AppConstants.height20(context) * 2),
                    // Text(
                    //     textAlign: TextAlign.center,
                    //     style: AppTextStyle.aljazeera400Style34d
                    //         .copyWith(fontSize: 32.sp),
                    //     'طريقة جدولة مواعيد التحدث مع أتراك'),
                    // SizedBox(height: AppConstants.height10(context)),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(
                    //       horizontal: AppConstants.width20(context)),
                    //   child: const VideoPlayerWidget(),
                    // ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
