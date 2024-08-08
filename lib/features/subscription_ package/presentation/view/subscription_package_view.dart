import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:kolayca/core/shared_widgets/loading_state_widget.dart';
import 'package:kolayca/core/utils/assets/app_assets.dart';
import 'package:kolayca/core/utils/constants.dart';
import 'package:kolayca/core/utils/helpers/url_launcher_helper.dart';
import 'package:kolayca/features/subscription_%20package/presentation/view_models/get_packages_cubit.dart';
import 'package:kolayca/features/subscription_%20package/presentation/widget/subscription_package_item.dart';

import '../../../../core/shared_widgets/custem_header_widget.dart';
import '../../../../core/utils/colors/app_color.dart';

class SubscriptionPackageView extends StatelessWidget {
  const SubscriptionPackageView({super.key, this.hasBack = false});
  final bool hasBack;
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
            text: 'subscriptionPackages'.tr(),
            withBack: hasBack,
          ),
          BlocBuilder<GetPackagesCubit, GetPackagesState>(
              builder: (context, state) {
            return Expanded(
              child: state is GetPackagesLoading
                  ? const Center(child: LoadingBody())
                  : state is GetPackagesSuccess
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (var i = 0; i < state.packages.length; i++) ...[
                              GestureDetector(
                                onTap: () {
                                  if (state.packages[i].linkUrl != null &&
                                      state.packages[i].linkUrl != "null") {
                                    UrlLauncherHelper.launchWhatsapp(
                                        state.packages[i].linkUrl!);
                                  }
                                },
                                child: SubscriptionPackageItem(
                                    image: packagesImages[i % 3],
                                    title: state.packages[i].name ?? '',
                                    consultationHours: _parseHtmlString(
                                        state.packages[i].description ?? ''),
                                    price: state.packages[i].price ?? '',
                                    type: packages[i % 3]),
                              ),
                              SizedBox(height: AppConstants.height20(context)),
                            ]
                            /*  const SubscriptionPackageItem(
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
                                type: "STANDARD") */
                          ],
                        )
                      : Center(child: Text('somethingWentWrong'.tr())),
            );
          })
        ],
      ),
    );
  }

  String _parseHtmlString(String htmlString) {
    return HtmlParser.parseHTML(htmlString).text;
  }

  final List<String> packages = const [
    'STANDARD',
    'GOLD',
    'PREMIUM',
  ];
  final List<String> packagesImages = const [
    Assets.standar,
    Assets.gold,
    Assets.premuim,
  ];
}
