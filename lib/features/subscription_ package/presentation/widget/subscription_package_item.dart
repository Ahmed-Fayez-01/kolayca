import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kolayca/core/utils/text_styles/app_text_style.dart';

class SubscriptionPackageItem extends StatelessWidget {
  const SubscriptionPackageItem(
      {super.key,
      required this.price,
      required this.type,
      required this.consultationHours,
      required this.image,
      required this.title});

  final String price;
  final String type;
  final String title;
  final String consultationHours;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            image,
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * .025,
            right: MediaQuery.of(context).size.width * .2,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .55,
              child: Column(
                children: [
                  Text(
                    title,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.madaniArabic400Style20.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  3.verticalSpace,
                  Text(
                    consultationHours,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.madaniArabic400Style20.copyWith(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: MediaQuery.of(context).size.height * .055,
              left: MediaQuery.of(context).size.width * .06,
              child: Row(
                children: [
                  Text(
                    "\$",
                    style: AppTextStyle.madaniArabic400Style20
                        .copyWith(color: Colors.black, fontFamily: ""),
                  ),
                  Text(
                    price,
                    style: AppTextStyle.madaniArabic400Style20
                        .copyWith(color: Colors.black),
                  ),
                ],
              )),
          Positioned(
              right: MediaQuery.of(context).size.width * .04,
              child: RotatedBox(
                quarterTurns: -1,
                child: Text(
                  type,
                  style: AppTextStyle.madaniArabic400Style20.copyWith(
                      color: Colors.black,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600),
                ),
              )),
        ],
      ),
    );
  }
}
