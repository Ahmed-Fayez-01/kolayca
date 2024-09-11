import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolayca/core/shared_widgets/loading_widget.dart';
import 'package:kolayca/core/utils/colors/app_color.dart';

class LoadingBody extends StatelessWidget {
  const LoadingBody({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const LoadingWidget(),
        30.verticalSpace,
        Text(
          "Loading ...",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20.sp,
            color: isDarkMode(context) ? Colors.white : AppColor.deebPlue,
          ),
        ),
        Text(
          "please wait a second!",
          style: TextStyle(color: AppColor.deebGrey, fontSize: 14.sp),
          textAlign: TextAlign.center,
        ),
        20.verticalSpace,
      ],
    );
  }
}
