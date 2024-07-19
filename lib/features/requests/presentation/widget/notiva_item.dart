import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolayca/core/shared_widgets/default_cached_network_image.dart';
import 'package:kolayca/core/utils/assets/app_assets.dart';
import 'package:kolayca/core/utils/colors/app_color.dart';
import 'package:kolayca/core/utils/constants.dart';
import 'package:kolayca/core/utils/text_styles/app_text_style.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: index % 2 == 0 ? Colors.white : AppColor.ofWhight,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppConstants.width10(context),
            vertical: AppConstants.height5(context)),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(100.sp),
                child: DefaultCachedNetworkImage(
                    imageUrl:
                        "https://www.lovepanky.com/wp-content/uploads/2020/11/what-makes-a-man-a-man-1.jpg",
                    imageHeight: 80.sp,
                    imageWidth: 80.sp)),
            SizedBox(width: AppConstants.width10(context)),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Abdullah',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  Text('your message',
                      style: AppTextStyle.madaniArabic400Style20),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: const Color(0xffE24A3B),
                      borderRadius:
                          BorderRadius.circular(AppConstants.width5(context))),
                  padding: EdgeInsetsDirectional.symmetric(
                    horizontal: AppConstants.width5(context),
                  ),
                  child: Text(
                    "3",
                    style: AppTextStyle.aljazeera400Style21
                        .copyWith(color: Colors.white, fontSize: 20.sp),
                  ),
                ),
                SizedBox(height: AppConstants.height5(context)),
                Text('Aug 29', style: AppTextStyle.madaniArabic400Style20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
