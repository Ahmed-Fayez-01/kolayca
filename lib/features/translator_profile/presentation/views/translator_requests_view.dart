import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolayca/core/utils/services/remote_services/service_locator.dart';
import 'package:kolayca/features/translator_profile/presentation/view_models/accept_order_cubit/accept_order_cubit.dart';
import 'package:kolayca/features/translator_profile/presentation/view_models/get_orders_by_specialization_cubit/get_orders_by_specialization_cubit.dart';
import 'package:kolayca/features/translator_profile/presentation/view_models/get_translator_orders_cubit/get_translator_orders_cubit.dart';

import '../../../../core/shared_widgets/custem_header_widget.dart';
import '../../../../core/shared_widgets/loading_state_widget.dart';
import '../../../../core/utils/colors/app_color.dart';
import 'widgets/order_item_widget.dart';
import 'widgets/orders_tab_widget.dart';

class TranslatorRequestsView extends StatefulWidget {
  const TranslatorRequestsView({super.key});

  @override
  State<TranslatorRequestsView> createState() => _TranslatorRequestsViewState();
}

class _TranslatorRequestsViewState extends State<TranslatorRequestsView> {
  int currentTab = 0;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => GetOrdersBySpecializationCubit(getIt())
              ..getOrdersBySpecialization()),
        BlocProvider(create: (context) => GetTranslatorOrdersCubit(getIt())),
      ],
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
        body: Builder(builder: (context) {
          return Column(
            children: [
              SizedBox(height: 20.h),
              CustemHeaderWidget(
                text: 'requests'.tr(),
                withBack: true,
              ),
              SizedBox(height: 30.h),
              OrdersTabsWidget(onChange: (v) {
                setState(() {
                  currentTab = v;
                  if (currentTab == 0) {
                    BlocProvider.of<GetOrdersBySpecializationCubit>(context)
                        .getOrdersBySpecialization();
                  } else if (currentTab == 1) {
                    BlocProvider.of<GetTranslatorOrdersCubit>(context)
                        .getTranslatorOrders();
                  }
                });
              }),
              if (currentTab == 0)
                const OrdersBySpecializationWidget()
              else
                const OrdersByTranslatorWidget()
            ],
          );
        }),
      ),
    );
  }
}

class OrdersBySpecializationWidget extends StatelessWidget {
  const OrdersBySpecializationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetOrdersBySpecializationCubit,
        GetOrdersBySpecializationState>(
      builder: (context, state) {
        return Expanded(
            child: state is GetOrdersBySpecializationLoading
                ? const Center(child: Center(child: LoadingBody()))
                : state is GetOrdersBySpecializationSuccess
                    ? ListView.separated(
                        itemBuilder: (context, index) => BlocProvider(
                              create: (context) => AcceptOrderCubit(getIt()),
                              child: Builder(builder: (context) {
                                return OrderItemWithAcceptButton(
                                  item: state.orders[index],
                                  onAccept: () async {
                                    await BlocProvider.of<AcceptOrderCubit>(
                                            context)
                                        .acceptOrder(state.orders[index].id!);
                                    if (context.mounted) {
                                      context
                                          .read<
                                              GetOrdersBySpecializationCubit>()
                                          .removeOrder(index);
                                    }
                                  },
                                );
                              }),
                            ),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 10.h),
                        itemCount: state.orders.length)
                    : Center(child: Text('noOrders'.tr())));
      },
    );
  }
}

class OrdersByTranslatorWidget extends StatelessWidget {
  const OrdersByTranslatorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTranslatorOrdersCubit, GetTranslatorOrdersState>(
      builder: (context, state) {
        return Expanded(
            child: state is GetTranslatorOrdersLoading
                ? const Center(child: Center(child: LoadingBody()))
                : state is GetTranslatorOrdersSuccess
                    ? ListView.separated(
                        itemBuilder: (context, index) =>
                            OrderItemWithAcceptButton(
                              item: state.orders[index],
                              withCallButton: true,
                              onAccept: () {},
                              hasAccepteButton: false,
                            ),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 10.h),
                        itemCount: state.orders.length)
                    : Center(child: Text('noOrders'.tr())));
      },
    );
  }
}
