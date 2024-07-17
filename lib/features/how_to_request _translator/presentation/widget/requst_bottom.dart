
import 'package:flutter/material.dart';
import 'package:kolayca/core/utils/colors/app_color.dart';
import 'package:kolayca/core/utils/text_styles/app_text_style.dart';

class RequstBottom extends StatelessWidget {
  const RequstBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: 125,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        height: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: AppColor.deebPlue),
        child: Text(
          'اطلب',
          textAlign: TextAlign.center,
          style: AppTextStyle.aljazeera400Style34
              .copyWith(color: Colors.white),
        ));
  }
}

