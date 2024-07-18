import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolayca/core/utils/assets/app_assets.dart';
import 'package:kolayca/core/utils/constants.dart';
import 'package:kolayca/core/utils/text_styles/app_text_style.dart';

import '../../../../core/shared_widgets/custem_header_widget.dart';
import '../../../../core/shared_widgets/image_widget.dart';
import '../../../../core/shared_widgets/text_widget.dart';
import '../../../../core/shared_widgets/video_player_widget.dart';
import '../../../../core/utils/colors/app_color.dart';

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
          SizedBox(height: AppConstants.height20(context),),
          const CustemHeaderWidget(
            text: 'من نحن؟',
          ),
          SizedBox(height: AppConstants.height20(context),),
          Image.asset(Assets.imagesLogo, width: MediaQuery.of(context).size.width*.6),
          SizedBox(height: AppConstants.height20(context),),
          Text(
            'نحن هنا لمساعدتك على تعلم \nاللغه التركيه بسهوله',
            style: AppTextStyle.aljazeera400Style34d.copyWith(
              fontSize: MediaQuery.of(context).size.height*.032
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
          SizedBox(height: AppConstants.height20(context),),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
            child: Text(
              'رؤيتنا هي جعل تعلم اللغة التركية متاحه للجميع أينما كانوا مهمتنا هي توفير أدوات تعليمية متقدمة وتفاعلية تساعك على تحقيق أهدافك اللغوية بكفاءة عالية',
              style: AppTextStyle.aljazeera400Style34d.copyWith(fontSize: MediaQuery.of(context).size.height*.02),
              textAlign: TextAlign.center,
              maxLines: 3,
            ),
          ),
          SizedBox(height: AppConstants.height20(context),),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
            child: const VideoPlayerWidget(),
          ),
          SizedBox(height: AppConstants.height20(context),),
          TextWidget(
            title: "Follow Us".tr(),
            titleSize: 22.sp,
            titleFontWeight: FontWeight.w600,
            titleColor: AppColor.deebPlue,
            titleMaxLines: 10,
          ),
          SizedBox(height: AppConstants.height10(context),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageWidget(
                imageUrl: "assets/images/snap.png",
                width: 60.w,
                fit: BoxFit.fill,
                height: 60.h,
              ),
              SizedBox(width: AppConstants.width10(context),),
              ImageWidget(
                imageUrl: "assets/images/insta.png",
                width: 60.w,
                fit: BoxFit.fill,
                height: 60.h,
              ),
              SizedBox(width: AppConstants.width10(context),),
              ImageWidget(
                imageUrl: "assets/images/face.png",
                width: 60.w,
                fit: BoxFit.fill,
                height: 60.h,
              ),
              SizedBox(width: AppConstants.width10(context),),
              ImageWidget(
                imageUrl: "assets/images/tik.png",
                width: 60.w,
                fit: BoxFit.fill,
                height: 60.h,
              ),

            ],
          ),
          SizedBox(height: AppConstants.height5(context),),
          InkWell(
            onTap: (){
              AppConstants.urlLaunch( url: 'https://kolaycakonus.com/');
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
}
