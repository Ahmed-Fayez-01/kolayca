import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolayca/core/utils/colors/app_color.dart';
import 'package:kolayca/core/utils/text_styles/app_text_style.dart';

class RequstBottom extends StatelessWidget {
  const RequstBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 35.w),
            margin: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColor.deebPlue.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(3, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(35),
                color: AppColor.deebPlue),
            child: Text(
              'اطلب',
              textAlign: TextAlign.center,
              style: AppTextStyle.aljazeera400Style34.copyWith(
                  fontSize: 34.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            )),
      ],
    );
  }
}
