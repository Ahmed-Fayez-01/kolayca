import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kolayca/core/utils/assets/app_assets.dart';
import 'package:kolayca/core/utils/colors/app_color.dart';
import 'package:kolayca/core/utils/text_styles/app_text_style.dart';
import 'package:kolayca/features/how_to_request%20_translator/presentation/widget/requst_bottom.dart';
import 'package:kolayca/features/how_to_request%20_translator/presentation/widget/spcial_req.dart';
import 'package:kolayca/features/how_to_request%20_translator/presentation/widget/time_widget.dart';
import 'package:kolayca/features/profile/presentation/widget/custem_divider.dart';

import '../../../../core/shared_widgets/custem_header_widget.dart';

class HowToRequestTranslatorView extends StatelessWidget {
  const HowToRequestTranslatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColor.ofWhight,
      body: ListView(
        children: [
          Column(
            children: [
              const SizedBox(height: 35),
              const CustemHeaderWidget(text: 'اطلب مترجم مباشر'),
              const SizedBox(height: 20),
              Container(
                height: 45,
                width: 375,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColor.deebPlue,
                      width: 3,
                    ),
                    color: AppColor.plueLight),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(width: 20),
                      SvgPicture.asset(
                        Assets.imagesLayer4,
                      ),
                      const SizedBox(width: 20),
                      const Text(
                        'اتصل علي المترجم المتاح حاليا',
                        style: AppTextStyle.aljazeera400Style21,
                      ),
                      const SizedBox(width: 20),
                      SvgPicture.asset(
                        Assets.imagesLayer2,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const CustemDivider(),
              const SizedBox(height: 30),
              Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  height: 63,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: AppColor.deebPlue),
                  child: Text(
                    'جدوله موعد مع مترجم مختص في احد المواضيع',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.aljazeera400Style21
                        .copyWith(color: Colors.white),
                  )),
              const SizedBox(height: 7),
              const TimeWidget(),
              const SizedBox(height: 7),
              const SpecializationRequireditem(),
              const SizedBox(height: 25),
              const RequstBottom(),
            ],
          ),
        ],
      ),
    ));
  }
}
