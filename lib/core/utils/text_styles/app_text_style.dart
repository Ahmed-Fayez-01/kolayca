import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolayca/core/utils/colors/app_color.dart';

abstract class AppTextStyle {
  static final aljazeera400Style34 = TextStyle(
      fontSize: 34,
      color: AppColor.deebGrey,
      fontWeight: FontWeight.w400,
      fontFamily: "Aljazeera");

  static final aljazeera400Style34d = TextStyle(
      fontSize: 34,
      color: AppColor.deebPlue,
      fontWeight: FontWeight.w400,
      fontFamily: "Aljazeera");
  static const madaniArabic400Style20 = TextStyle(
      fontSize: 17,
      color: Color(0xffB1B4C4),
      fontWeight: FontWeight.w400,
      fontFamily: "Aljazeera");
  static const aljazeera400Style21 = TextStyle(
      fontSize: 21,
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontFamily: "Aljazeera");

  static var aljazeera400Style24 = TextStyle(
      fontSize: 24.sp,
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontFamily: "Aljazeera");
}
