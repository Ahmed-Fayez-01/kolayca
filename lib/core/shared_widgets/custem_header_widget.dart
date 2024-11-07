import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kolayca/core/utils/colors/app_color.dart';
import 'package:kolayca/core/utils/text_styles/app_text_style.dart';

import '../utils/assets/app_assets.dart';
import '../utils/constants.dart';

class CustemHeaderWidget extends StatelessWidget {
  const CustemHeaderWidget(
      {super.key,
      required this.text,
      this.withBack = false,
      this.backgroundColor,
      this.textColor,
      this.fontSize});
  final String text;
  final bool? withBack;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppConstants.width20(context) * 2),
                  child: Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * .07,
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppConstants.sp30(context)),
                        color: backgroundColor ?? AppColor.deebPlue),
                    child: Text(
                      text,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.aljazeera400Style34.copyWith(
                          color: textColor ?? Colors.white,
                          fontSize: fontSize ?? 28),
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (withBack!)
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: RotatedBox(
                    quarterTurns: 2,
                    child: SvgPicture.asset(
                      Assets.back,
                      width: MediaQuery.of(context).size.height * .03,
                      color: AppColor.deebPlue,
                    ))),
        ],
      ),
    );
  }
}
