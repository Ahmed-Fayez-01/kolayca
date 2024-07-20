import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolayca/core/utils/colors/app_color.dart';
import 'package:kolayca/core/utils/constants.dart';
import 'package:kolayca/features/requests/presentation/view_model/get_user_orders_models_cubit/get_user_orders_cubit.dart';
import 'package:kolayca/features/requests/presentation/widget/notiva_item.dart';

import '../../../../core/shared_widgets/custem_header_widget.dart';
import '../../../../core/shared_widgets/loading_state_widget.dart';
import '../widget/order_item_widget.dart';

class RequestsView extends StatelessWidget {
  const RequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetUserOrdersCubit()..getUserOrders(),
      child: Scaffold(
        backgroundColor: const Color(0xffEBEBEB),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0.0), // here the desired height
          child: AppBar(
            elevation: 0,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Color(0xffEBEBEB),
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
            BlocBuilder<GetUserOrdersCubit, GetUserOrdersState>(
              builder: (context, state) {
                return Expanded(
                    child: state is GetUserOrdersLoading
                        ? const Center(child: Center(child: LoadingBody()))
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
                            : const Center(child: Text('لا يوجد طلبات')));
              },
            ),
          ],
        ),
      ),
    );
  }
}
