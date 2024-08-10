import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kolayca/core/shared_widgets/custem_header_widget.dart';
import 'package:kolayca/core/shared_widgets/text_widget.dart';
import 'package:kolayca/core/utils/constants.dart';
import 'package:kolayca/core/utils/helpers/url_launcher_helper.dart';
import 'package:kolayca/core/utils/text_styles/app_text_style.dart';
import 'package:kolayca/features/hwo_us/presentation/view_models/about_us_cubit/about_us_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/utils/assets/app_assets.dart';
import '../../../../core/utils/colors/app_color.dart';
import '../../../customer_services/presentation/views/widgets/technical_support_item.dart';

class JobsView extends StatelessWidget {
  const JobsView({super.key});

  @override
  Widget build(BuildContext context) {
    void _launchUrlApp({required String url}) async {
      var appUrl = url;
      if (await canLaunch(appUrl)) {
        await launch(appUrl);
      } else {
        throw 'Could not launch $appUrl';
      }
    }
    void launchEmailSubmission() async {
      final Uri params = Uri(
        scheme: 'mailto',
        path: 'Kolaycakonus@gmail.com',
      );
      if (await canLaunchUrl(params)) {
        await launchUrl(params);
      } else {
        print('Could not launch $params');
      }
    }
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppConstants.height20(context)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.jobsBannr,
                  width: MediaQuery.of(context).size.width * .6,
                  height: MediaQuery.of(context).size.height * .23,
                ),
              ],
            ),
            SizedBox(
              height: AppConstants.height20(context),
            ),
            Text(
              "workWithUsAsTranslator".tr(),
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: MediaQuery.of(context).size.height * .022,
                  color: Colors.black),
            ),
            SizedBox(height: AppConstants.height5(context),),
            Text(
              "contactForTranslatorWork".tr(),
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: MediaQuery.of(context).size.height * .016,
                  color: const Color(0xff535355)),
            ),
            SizedBox(height: AppConstants.height20(context),),
            TechnicalSupportItem(title: "contactViaWhatsapp".tr(), icon: Assets.whatsapp,onTap: (){
              _launchUrlApp(url: "whatsapp://send?phone=+00905528995229");
            },),
            SizedBox(height: AppConstants.height10(context),),
            TechnicalSupportItem(title: "contactViaPhone".tr(), icon: Assets.phoneCall,onTap: (){
              _launchUrlApp(url: "tel://00905528995229");
            },),
            SizedBox(height: AppConstants.height10(context),),
            Text(
              "cvMessage".tr(),
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: MediaQuery.of(context).size.height * .016,
                  color: Colors.black),
            ),
            SizedBox(height: AppConstants.height10(context),),
            TechnicalSupportItem(title: "contactViaEmail".tr(), icon: Assets.imagesEmail,onTap: (){
              launchEmailSubmission();
            },),
          ],
        ),
      ),
    );
  }
}
