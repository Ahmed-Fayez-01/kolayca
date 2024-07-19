import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolayca/core/utils/text_styles/app_text_style.dart';

import '../../../../core/shared_widgets/custem_header_widget.dart';
import '../../../../core/utils/colors/app_color.dart';
import 'widgets/requests_teb_widget.dart';

class TranslatorRequestsView extends StatelessWidget {
  const TranslatorRequestsView({super.key});

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
          const CustemHeaderWidget(
            text: 'الطلبات',
            withBack: true,
          ),
          SizedBox(height: 30.h),
          RequestsTabsWidget(onChange: (v) {}),
          /* Expanded(
              child: state is GetUserOrdersLoading
                  ? const Center(child: CircularProgressIndicator())
                  : state is GetUserOrdersSuccess
                      ? ListView.separated(
                          itemBuilder: (context, index) =>
                              OrderItemWidget(
                                orderModel: state.orders[index],
                                index: index,
                              ),
                          separatorBuilder: (context, index) => SizedBox(
                                height: AppConstants.height5(context),
                              ),
                          itemCount: state.orders.length)
                      : const Center(child: Text('لا يوجد طلبات'))), */
        ],
      ),
    );
  }
}
