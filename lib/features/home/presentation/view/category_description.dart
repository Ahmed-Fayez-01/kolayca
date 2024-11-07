import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:kolayca/core/utils/text_styles/app_text_style.dart';

import '../../../../core/shared_widgets/custem_header_widget.dart';
import '../../../../core/utils/colors/app_color.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/helpers/url_launcher_helper.dart';
import '../../data/models/home_data_model.dart';

class CategoryDescriptionView extends StatelessWidget {
  const CategoryDescriptionView({super.key, required this.homeData});
  final HomeData homeData;
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
            text: homeData.title ?? '',
            withBack: true,
          ),
          SizedBox(height: AppConstants.height20(context)),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.width20(context)),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 180,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: CachedNetworkImageProvider(homeData.image ?? ''),
                        fit: BoxFit.cover,
                      )),
                    ),
                    SizedBox(height: AppConstants.height20(context)),
                    SizedBox(
                      width: double.infinity,
                      child: Card(
                        child: Padding(
                          padding:
                              EdgeInsets.all(AppConstants.width15(context)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(_parseHtmlString(homeData.description ?? ''),
                                  style: AppTextStyle.aljazeera400Style21
                                      .copyWith(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300)),
                              SizedBox(height: AppConstants.height10(context)),
                              Center(
                                child: InkWell(
                                  onTap: () {
                                    UrlLauncherHelper.launch(homeData.linkUrl!);
                                  },
                                  child: Text(
                                    "pressForMore".tr(),
                                    style: AppTextStyle.aljazeera400Style21
                                        .copyWith(
                                            fontSize: 14, color: Colors.blue),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  String _parseHtmlString(String htmlString) {
    return HtmlParser.parseHTML(htmlString).text;
  }
}
