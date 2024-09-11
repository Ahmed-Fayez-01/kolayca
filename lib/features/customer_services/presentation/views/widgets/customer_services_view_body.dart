import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kolayca/features/customer_services/presentation/views/widgets/technical_support_item.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/utils/assets/app_assets.dart';
import '../../../../../core/utils/constants.dart';

class CustomerServicesViewBody extends StatefulWidget {
  const CustomerServicesViewBody({super.key});

  @override
  State<CustomerServicesViewBody> createState() => _CustomerServicesViewBodyState();
}

class _CustomerServicesViewBodyState extends State<CustomerServicesViewBody> {
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppConstants.height20(context)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Assets.technicalSupport,
                width: MediaQuery.of(context).size.width * .6,
                height: MediaQuery.of(context).size.height * .23,
              ),
            ],
          ),
          SizedBox(
            height: AppConstants.height20(context),
          ),
          Text(
            "welcome".tr(),
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: MediaQuery.of(context).size.height * .022,
                color: Colors.black),
          ),
          SizedBox(height: AppConstants.height5(context),),
          Text(
            "welcomeMessage".tr(),
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: MediaQuery.of(context).size.height * .016,
                color: const Color(0xff535355)),
          ),

          SizedBox(height: AppConstants.height20(context),), 
          TechnicalSupportItem(title: "contactViaWhatsapp".tr(), icon: Assets.whatsapp,onTap: (){
           _launchUrlApp(url: "whatsapp://send?phone=+905528995229");
         },),
          SizedBox(height: AppConstants.height10(context),),
          TechnicalSupportItem(title: "contactViaPhone".tr(), icon: Assets.phoneCall,onTap: (){
           _launchUrlApp(url: "tel://905528995229");
         },),
          SizedBox(height: AppConstants.height10(context),),
          TechnicalSupportItem(title: "contactViaEmail".tr(), icon: Assets.imagesEmail,onTap: (){
            launchEmailSubmission();
          },),
        ],
      ),
    );
  }
}