import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kolayca/core/shared_widgets/loading_state_widget.dart';
import 'package:kolayca/core/utils/assets/app_assets.dart';
import 'package:kolayca/core/utils/constants.dart';
import 'package:kolayca/features/subscription_%20package/presentation/view_models/get_packages_cubit.dart';
import 'package:kolayca/features/subscription_%20package/presentation/widget/subscription_package_item.dart';
import 'package:flutter_html/flutter_html.dart';

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
          const CustemHeaderWidget(
            text: 'باقات الاشتراك',
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
                              SubscriptionPackageItem(
                                  image: packagesImages[i % 3],
                                  title: state.packages[i].name ?? '',
                                  consultationHours: _parseHtmlString(
                                      state.packages[i].description ?? ''),
                                  price: state.packages[i].price ?? '',
                                  type: packages[i % 3]),
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
                      : const Center(child: Text('حدث خطأ ما')),
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
    'GOLD',
    'PREMIUM',
    'STANDARD',
  ];
  final List<String> packagesImages = const [
    Assets.gold,
    Assets.premuim,
    Assets.standar,
  ];
}
