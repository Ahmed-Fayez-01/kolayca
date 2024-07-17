import 'package:flutter/material.dart';
import 'package:kolayca/core/utils/colors/app_color.dart';
import 'package:kolayca/core/utils/text_styles/app_text_style.dart';

class CustemBottom extends StatelessWidget {
  const CustemBottom({super.key, required this.text, this.onTap, this.color});
  final String text;
  final void Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 30),
        height: 53,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35), color: AppColor.deebPlue),
        child: Text(
          text,
          style: AppTextStyle.aljazeera400Style34,
        ),
      ),
    );
  }
}
