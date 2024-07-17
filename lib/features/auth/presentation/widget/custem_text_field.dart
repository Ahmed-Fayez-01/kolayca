import 'package:flutter/material.dart';
import 'package:kolayca/core/utils/colors/app_color.dart';
import 'package:kolayca/core/utils/text_styles/app_text_style.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;

  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35, right: 35, top: 10),
      child: SizedBox(
        height: 60,
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
              hintStyle: AppTextStyle.madaniArabic400Style20.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 25,
              )),
        ),
      ),
    );
  }
}
