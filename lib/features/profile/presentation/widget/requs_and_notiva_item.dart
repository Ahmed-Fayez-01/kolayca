import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolayca/core/utils/colors/app_color.dart';
import 'package:kolayca/core/utils/constants.dart';
import 'package:kolayca/core/utils/text_styles/app_text_style.dart';

class RequestsAndNotviItem extends StatelessWidget {
  const RequestsAndNotviItem({
    super.key,
    required this.text,
    required this.onTap,
    this.badgeNumber = 0,
    this.icon,
  });

  final String text;
  final Function() onTap;
  final int badgeNumber;
  final IconData ?icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppConstants.width15(context)),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: Colors.white,
          child: Row(
            children: [
              Container(
                height: AppConstants.height55(context),
                width: AppConstants.width10(context) - 2,
                color: AppColor.plueLight,
              ),
              SizedBox(width: AppConstants.width10(context)),
              Text(
                text,
                style: AppTextStyle.aljazeera400Style34d.copyWith(
                  fontSize: 32.sp,
                ),
              ),
              const Spacer(),
              Stack(
                children: [
                  Icon(
                    icon??Icons.notifications,
                    color: AppColor.plueLight,
                    size: 50.sp,
                  ),
                  if (badgeNumber > 0)
                    Container(
                      padding: EdgeInsets.all(5.r),
                      decoration: BoxDecoration(
                          color: AppColor.deebPlue,
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Colors.white,
                              width: 1.5,
                              strokeAlign: BorderSide.strokeAlignOutside)),
                      child: Text(
                        '${badgeNumber >= 100 ? '+99' : badgeNumber}',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    )
                ],
              ),
              SizedBox(width: AppConstants.width10(context)),
            ],
          ),
        ),
      ),
    );
  }
}
