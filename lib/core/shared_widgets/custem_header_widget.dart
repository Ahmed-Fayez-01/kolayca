import 'package:flutter/material.dart';
import 'package:kolayca/core/utils/colors/app_color.dart';
import 'package:kolayca/core/utils/text_styles/app_text_style.dart';

class CustemHeaderWidget extends StatelessWidget {
  const CustemHeaderWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 55),
      height: 63,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35), color: AppColor.deebPlue),
      child: Text(
        text,
        style: AppTextStyle.aljazeera400Style34.copyWith(color: Colors.white),
      ),
    );
  }
}
