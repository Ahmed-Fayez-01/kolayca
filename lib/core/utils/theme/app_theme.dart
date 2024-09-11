import 'package:flutter/material.dart';
import '../colors/app_color.dart';

ThemeData themeDataLight = ThemeData(
  highlightColor: Colors.transparent,
  colorScheme: ColorScheme.fromSeed(seedColor: AppColor.plueLight),
  splashColor: Colors.transparent,
  primaryColor: AppColor.plueLight,
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: AppColor.plueLight,
  ),
  scaffoldBackgroundColor: Colors.white,
  fontFamily: "Sora",
);
