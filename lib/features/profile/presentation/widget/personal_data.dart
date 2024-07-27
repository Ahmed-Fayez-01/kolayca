import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kolayca/core/utils/colors/app_color.dart';
import 'package:kolayca/core/utils/constants.dart';
import 'package:kolayca/core/utils/text_styles/app_text_style.dart';

class PersonalData extends StatelessWidget {
  const PersonalData({
    super.key,
    required this.text,
    required this.image,
  });

  final String text;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          image,
          color: AppColor.plueLight,
        ),
        SizedBox(width: AppConstants.width10(context)),
        Expanded(
          child: Text(
            text,
            style: AppTextStyle.aljazeera400Style34d.copyWith(fontSize: 30.sp),
          ),
        ),
      ],
    );
  }
}
