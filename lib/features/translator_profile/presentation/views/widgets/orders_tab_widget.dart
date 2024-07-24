import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors/app_color.dart';
import '../../../../../core/utils/text_styles/app_text_style.dart';

class OrdersTabsWidget extends StatefulWidget {
  const OrdersTabsWidget({
    super.key,
    required this.onChange,
  });
  final Function(int index) onChange;
  @override
  State<OrdersTabsWidget> createState() => _OrdersTabsWidgetState();
}

class _OrdersTabsWidgetState extends State<OrdersTabsWidget> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8.0).r,
      child: Container(
        decoration: BoxDecoration(
            color: AppColor.deebPlue,
            borderRadius: BorderRadiusDirectional.circular(15.r)),
        child: Stack(
          children: [
            AnimatedAlign(
              duration: const Duration(milliseconds: 200),
              alignment: currentIndex == 0
                  ? AlignmentDirectional.centerStart
                  : AlignmentDirectional.centerEnd,
              child: Container(
                height: 70.h,
                margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
                width: (MediaQuery.sizeOf(context).width / 2) - 30.r,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(15.r),
                  color: AppColor.plueLight,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex = 0;
                      });
                      widget.onChange(0);
                    },
                    child: Container(
                        height: 70.h,
                        alignment: Alignment.center,
                        child: Text(
                          'requests'.tr(),
                          style: AppTextStyle.aljazeera400Style21,
                        )),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex = 1;
                      });
                      widget.onChange(1);
                    },
                    child: Container(
                        height: 70.h,
                        alignment: Alignment.center,
                        child: Text(
                          'myRequests'.tr(),
                          style: AppTextStyle.aljazeera400Style21,
                        )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
