import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolayca/core/utils/colors/app_color.dart';

import '../../data/models/order.dart';

class OrderItemWidget extends StatelessWidget {
  const OrderItemWidget(
      {super.key, required this.orderModel, required this.index});
  final OrderModel orderModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: index % 2 == 0 ? Colors.white : Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                orderModel.specialization ?? '',
                style: TextStyle(
                  fontSize: 26.sp,
                  fontFamily: 'Aljazeera',
                  fontWeight: FontWeight.w600,
                ),
              ),
              5.verticalSpace,
              Row(
                children: [
                  Text(
                    'المترجم : ',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontFamily: 'Aljazeera',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    orderModel.translater ?? '',
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: AppColor.deebPlue,
                      fontFamily: 'Aljazeera',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Text(
                orderModel.time ?? '',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontFamily: 'Aljazeera',
                  fontWeight: FontWeight.w600,
                ),
              ),
              5.verticalSpace,
              Text(
                orderModel.date ?? '',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontFamily: 'Aljazeera',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
