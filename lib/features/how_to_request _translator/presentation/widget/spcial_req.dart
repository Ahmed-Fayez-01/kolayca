import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kolayca/core/utils/assets/app_assets.dart';
import 'package:kolayca/core/utils/colors/app_color.dart';
import 'package:kolayca/core/utils/text_styles/app_text_style.dart';

class SpecializationRequireditem extends StatelessWidget {
  const SpecializationRequireditem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 340,
      color: AppColor.deebPlue,
      child: Column(
        children: [
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
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    Assets.imagesLayer3,
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    'التخصص المطلوب',
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  children: [
                    CustemText(text: 'الترجمة التعليمية'),
                    CustemText(text: 'الترجمة العامـــة'),
                    CustemText(text: ' الدوائر الحكوميــة'),
                  ],
                ),
                Container(
                  height: 100,
                  width: 1,
                  color: Colors.grey,
                ),
             const   Column(
                  children: [
                    CustemText(text: 'الترجمة التعليمية'),
                    CustemText(text: 'الترجمة العامـــة'),
                    CustemText(text: ' الدوائر الحكوميــة'),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustemText extends StatelessWidget {
  const CustemText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyle.aljazeera400Style21,
    );
  }
}
