import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolayca/core/utils/colors/app_color.dart';
import 'package:kolayca/core/utils/text_styles/app_text_style.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final Widget? prefixIcon;

  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.obscureText = false, this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75.h,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.deebPlue),
              borderRadius: BorderRadius.circular(35),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.deebPlue),
              borderRadius: BorderRadius.circular(35),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.deebPlue),
              borderRadius: BorderRadius.circular(35),
            ),
            hintText: hintText,
            prefixIcon: prefixIcon,
            hintStyle: AppTextStyle.madaniArabic400Style20.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 25.sp,
              color: const Color(0xff7E8384)
            )),
      ),
    );
  }
}
