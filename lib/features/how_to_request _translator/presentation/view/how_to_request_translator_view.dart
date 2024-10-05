import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kolayca/core/shared_widgets/loading_state_widget.dart';
import 'package:kolayca/core/utils/assets/app_assets.dart';
import 'package:kolayca/core/utils/colors/app_color.dart';
import 'package:kolayca/core/utils/functions/authorization_dialog.dart';
import 'package:kolayca/core/utils/functions/warning_dialoge.dart';
import 'package:kolayca/core/utils/services/remote_services/service_locator.dart';
import 'package:kolayca/core/utils/services/remote_services/zego_cloud_service.dart';
import 'package:kolayca/core/utils/text_styles/app_text_style.dart';
import 'package:kolayca/features/how_to_request%20_translator/presentation/view_modesl/get_all_translators/get_all_translators_cubit.dart';
import 'package:kolayca/features/how_to_request%20_translator/presentation/view_modesl/schedule_appointment_cubit/schedule_appointment_cubit.dart';
import 'package:kolayca/features/how_to_request%20_translator/presentation/widget/requst_bottom.dart';
import 'package:kolayca/features/how_to_request%20_translator/presentation/widget/spcial_req.dart';
import 'package:kolayca/features/how_to_request%20_translator/presentation/widget/time_widget.dart';
import 'package:kolayca/features/profile/data/models/user_model.dart';
import 'package:kolayca/features/profile/presentation/widget/custem_divider.dart';
import 'package:kolayca/features/subscription_%20package/presentation/view/subscription_package_view.dart';

import '../../../../core/shared_widgets/custem_header_widget.dart';
import '../../data/models/specialization.dart';

class HowToRequestTranslatorView extends StatefulWidget {
  const HowToRequestTranslatorView({super.key});

  @override
  State<HowToRequestTranslatorView> createState() =>
      _HowToRequestTranslatorViewState();
}

class _HowToRequestTranslatorViewState
    extends State<HowToRequestTranslatorView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColor.ofWhight,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ScheduleAppointmentCubit(getIt()),
          ),
          BlocProvider(
            create: (context) =>
                GetAllTranslatorsCubit(getIt())..getAllTranslators(),
          ),
        ],
        child: BlocConsumer<ScheduleAppointmentCubit, ScheduleAppointmentState>(
          listener: (context, scheduleState) {
            if (scheduleState is ScheduleAppointmentSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.green,
                  content: Text(
                    'تم الحجز بنجاح',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            } else if (scheduleState is ScheduleAppointmentError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(
                    scheduleState.message,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
            }
          },
          builder: (context, scheduleState) {
            return Column(
              children: [
                SizedBox(height: 20.h),
                CustemHeaderWidget(
                  text: 'requestTranslator'.tr(),
                  withBack: true,
                ),
                40.verticalSpace,
                BlocConsumer<GetAllTranslatorsCubit, GetAllTranslatorsState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return Expanded(
                      child: state is GetAllTranslatorsLoading
                          ? const Center(child: LoadingBody())
                          : SingleChildScrollView(
                              padding: EdgeInsets.symmetric(horizontal: 40.w),
                              child: Column(
                                children: [
                                  // _buttonWidget(),
                                  GestureDetector(
                                    onTap: () {
                                      showAuthorizationDialog(
                                        context,
                                        () {
                                          if (!((getIt<UserModel>()
                                                      .numberMinutes ??
                                                  0) <=
                                              0)) {
                                            showWarningDialog(context, () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const SubscriptionPackageView(
                                                              hasBack: true)));
                                            }, 'insufficientBalance'.tr(),
                                                acceptText: "subscribe".tr(),
                                                acceptRecomended: true);
                                            return;
                                          }
                                          if (state
                                              is GetAllTranslatorsLoaded) {
                                            if (state.translators.isEmpty) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  backgroundColor: Colors.red,
                                                  content: Text(
                                                    'noAvailableTranslator'
                                                        .tr(),
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              );
                                            } else {
                                              ZegoServices.callUserPerUser(
                                                  context, state.translators);
                                            }
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                backgroundColor: Colors.red,
                                                content: Text(
                                                  'noAvailableTranslator'.tr(),
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                      );
                                    },
                                    child: Container(
                                        alignment: Alignment.center,
                                        width: double.infinity,
                                        height: 85.h,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.w),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(35),
                                            color: Colors.green),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              Assets.phone,
                                              width: 30.sp,
                                            ),
                                            20.horizontalSpace,
                                            Text(
                                              'callAvailableTranslator'.tr(),
                                              textAlign: TextAlign.center,
                                              style: AppTextStyle
                                                  .aljazeera400Style21
                                                  .copyWith(
                                                      fontSize: 22.sp,
                                                      fontWeight:
                                                          FontWeight.w600),
                                            ),
                                          ],
                                        )),
                                  ),
                                  30.verticalSpace,
                                  const CustemDivider(),
                                  30.verticalSpace,
                                  Container(
                                      alignment: Alignment.center,
                                      width: double.infinity,
                                      height: 85.h,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          color: AppColor.deebPlue),
                                      child: Text(
                                        'scheduleAppointmentWithTranslator'
                                            .tr(),
                                        textAlign: TextAlign.center,
                                        style: AppTextStyle.aljazeera400Style21
                                            .copyWith(
                                                fontSize: 22.sp,
                                                fontWeight: FontWeight.w600),
                                      )),
                                  30.verticalSpace,
                                  Container(
                                    color: Colors.white,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 4.w,
                                      vertical: 4.h,
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: TimeWidget(
                                            onDateSelected: (String date) {
                                              context
                                                  .read<
                                                      ScheduleAppointmentCubit>()
                                                  .updateData(
                                                    key: 'date',
                                                    value: date,
                                                  );
                                            },
                                            onTimeSelected: (String time) {
                                              context
                                                  .read<
                                                      ScheduleAppointmentCubit>()
                                                  .updateData(
                                                    key: 'time',
                                                    value: time,
                                                  );
                                            },
                                          ),
                                        ),
                                        /*  Expanded(
                                          child: DateWidget(
                                            onDateSelected: (String date) {
                                              context
                                                  .read<
                                                      ScheduleAppointmentCubit>()
                                                  .updateData(
                                                    key: 'date',
                                                    value: date,
                                                  );
                                            },
                                          ),
                                        ),*/
                                      ],
                                    ),
                                  ),

                                  15.verticalSpace,
                                  SpecializationRequireditem(
                                    onSelected: (Specialization v) {
                                      context
                                          .read<ScheduleAppointmentCubit>()
                                          .updateData(
                                            key: 'specialization_id',
                                            value: v.id,
                                          );
                                    },
                                  ),
                                  SizedBox(height: 35.h),
                                  scheduleState is ScheduleAppointmentLoading
                                      ? const Center(
                                          child: CircularProgressIndicator())
                                      : InkWell(
                                          onTap: () {
                                            showAuthorizationDialog(context,
                                                () {
                                              final cubit = context.read<
                                                  ScheduleAppointmentCubit>();
                                              final data = cubit.data;
                                              if (data['time'] == null ||
                                                  data['date'] == null ||
                                                  data['specialization_id'] ==
                                                      null) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    backgroundColor: Colors.red,
                                                    content: Text(
                                                      'mustFillAllFields'.tr(),
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                );
                                              } else {
                                                cubit.scheduleAppointment();
                                              }
                                            });
                                          },
                                          child: const RequstBottom()),
                                  35.verticalSpace,
                                ],
                              ),
                            ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    ));
  }
}
