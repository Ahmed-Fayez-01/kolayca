import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolayca/core/utils/colors/app_color.dart';
import 'package:kolayca/core/utils/services/remote_services/zego_cloud_service.dart';
import 'package:kolayca/features/profile/data/models/user_model.dart';
import 'package:kolayca/features/requests/data/models/order.dart';
import 'package:kolayca/features/translator_profile/presentation/view_models/accept_order_cubit/accept_order_cubit.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class OrderItemWithAcceptButton extends StatelessWidget {
  final OrderModel item;
  final bool hasAccepteButton;
  final bool withCallButton;
  final VoidCallback onAccept;

  const OrderItemWithAcceptButton({
    super.key,
    required this.item,
    required this.onAccept,
    this.hasAccepteButton = true,
    this.withCallButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 5.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(item.user ?? '',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 26.sp,
                        color: AppColor.deebPlue,
                        fontFamily: "Aljazeera")),
                Icon(Icons.person, color: AppColor.plueLight),
              ],
            ),
            const SizedBox(height: 8.0),
            Text(item.specialization ?? '',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontFamily: "Aljazeera",
                )),
            const SizedBox(height: 8.0),
            Text(item.translater ?? '',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontFamily: "Aljazeera",
                )),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${'time'.tr()}: ${item.time}",
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontFamily: "Aljazeera",
                    )),
                Text("${'date'.tr()}: ${item.date}",
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontFamily: "Aljazeera",
                    )),
              ],
            ),
            SizedBox(height: 16.h),
            if (hasAccepteButton) ...[
              BlocBuilder<AcceptOrderCubit, AcceptOrderState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: state is AcceptOrderLoading ? null : onAccept,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.deebPlue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    child: state is AcceptOrderLoading
                        ? LoadingAnimationWidget.staggeredDotsWave(
                            color: AppColor.deebPlue,
                            size: 40.sp,
                          )
                        : Text("acceptOrder".tr(),
                            style: TextStyle(
                                fontSize: 20.sp, fontFamily: "Aljazeera")),
                  );
                },
              ),
            ],
            if (withCallButton)
              ElevatedButton(
                onPressed: () {
                  ZegoServices.callUsers(
                      [UserModel(id: item.userId, name: item.user)]);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                child: Text("call".tr(),
                    style: TextStyle(fontSize: 20.sp, fontFamily: "Aljazeera")),
              )
          ],
        ),
      ),
    );
  }
}
