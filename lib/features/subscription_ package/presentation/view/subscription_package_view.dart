import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kolayca/core/utils/assets/app_assets.dart';
import 'package:kolayca/core/utils/constants.dart';
import 'package:kolayca/features/subscription_%20package/presentation/widget/subscription_package_item.dart';

import '../../../../core/shared_widgets/custem_header_widget.dart';
import '../../../../core/utils/colors/app_color.dart';

class SubscriptionPackageView extends StatelessWidget {
  const SubscriptionPackageView({super.key});

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
          const CustemHeaderWidget(
            text: 'باقات الاشتراك',
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SubscriptionPackageItem(
                    image: Assets.gold,
                    consultationHours:
                        '30 consultation hours 30 templates and 30 images Unlimited access file',
                    price: r'499',
                    type: "GOLD"),
                SizedBox(height: AppConstants.height20(context)),
                const SubscriptionPackageItem(
                    image: Assets.premuim,
                    consultationHours:
                        '15 consultation hours15 templates and 15 imagesUnlimited access file',
                    price: r'399',
                    type: "PREMIUM"),
                SizedBox(height: AppConstants.height20(context)),
                const SubscriptionPackageItem(
                    image: Assets.standar,
                    consultationHours:
                        '10 consultation hours 10 templates and 10 images Unlimited access file',
                    price: r'299',
                    type: "STANDARD")
              ],
            ),
          )
        ],
      ),
    );
  }
}
