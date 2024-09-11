import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolayca/core/utils/assets/app_assets.dart';
import 'package:kolayca/core/utils/constants.dart';
import 'package:kolayca/core/utils/text_styles/app_text_style.dart';

import '../../../../core/shared_widgets/custem_header_widget.dart';
import '../../../../core/utils/colors/app_color.dart';

class NearestTranslatorView extends StatelessWidget {
  const NearestTranslatorView({super.key, this.hasBack = false});
  final bool hasBack;
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
          SizedBox(height: AppConstants.height20(context)),
          CustemHeaderWidget(
            text: 'requestNearestTranslator'.tr(),
            withBack: hasBack,
          ),
          SizedBox(height: AppConstants.height20(context) * 2),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
            child: Column(
              children: [
                Text(
                  textAlign: TextAlign.center,
                  'defineYourLocationFromTheMap'.tr(),
                  style: AppTextStyle.aljazeera400Style34d
                      .copyWith(fontSize: 32.sp),
                ),
                Image.asset(
                  Assets.imagesSelectLocation,
                  height: MediaQuery.of(context).size.height * .25,
                ),
                SizedBox(
                  height: AppConstants.height20(context),
                ),
                Text(
                    textAlign: TextAlign.center,
                    style: AppTextStyle.aljazeera400Style34d
                        .copyWith(fontSize: 32.sp),
                    'requestNearestTranslatorMessage'.tr()),
                SizedBox(height: AppConstants.height20(context)),
                Image.asset(Assets.imagesComungSoon,
                    height: MediaQuery.of(context).size.height * .15)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
