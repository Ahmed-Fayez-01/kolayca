import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolayca/core/utils/colors/app_color.dart';
import 'package:kolayca/core/utils/constants.dart';
import 'package:kolayca/features/requests/presentation/widget/notiva_item.dart';

import '../../../../core/shared_widgets/custem_header_widget.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEBEBEB),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0.0), // here the desired height
        child: AppBar(
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: const Color(0xffEBEBEB),
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: AppColor.deebPlue,
            statusBarBrightness: Brightness.light,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20.h),
          CustemHeaderWidget(
            text: 'notification'.tr(),
            withBack: true,
          ),
          SizedBox(height: 30.h),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => NotificationItem(
                        index: index,
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: AppConstants.height5(context),
                      ),
                  itemCount: 10)),
        ],
      ),
    );
  }
}
