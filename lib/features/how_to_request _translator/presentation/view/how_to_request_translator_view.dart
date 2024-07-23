import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kolayca/core/shared_widgets/loading_state_widget.dart';
import 'package:kolayca/core/utils/assets/app_assets.dart';
import 'package:kolayca/core/utils/colors/app_color.dart';
import 'package:kolayca/core/utils/functions/authorization_dialog.dart';
import 'package:kolayca/core/utils/services/remote_services/service_locator.dart';
import 'package:kolayca/core/utils/text_styles/app_text_style.dart';
import 'package:kolayca/features/how_to_request%20_translator/presentation/view_modesl/get_all_translators/get_all_translators_cubit.dart';
import 'package:kolayca/features/how_to_request%20_translator/presentation/view_modesl/schedule_appointment_cubit/schedule_appointment_cubit.dart';
import 'package:kolayca/features/how_to_request%20_translator/presentation/widget/requst_bottom.dart';
import 'package:kolayca/features/how_to_request%20_translator/presentation/widget/spcial_req.dart';
import 'package:kolayca/features/how_to_request%20_translator/presentation/widget/time_widget.dart';
import 'package:kolayca/features/profile/presentation/widget/custem_divider.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import '../../../../core/shared_widgets/custem_header_widget.dart';
import '../../data/models/specialization.dart';

class HowToRequestTranslatorView extends StatelessWidget {
  const HowToRequestTranslatorView({super.key});

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
                const CustemHeaderWidget(
                  text: 'اطلب مترجم مباشر',
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
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.w, vertical: 4.h),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppColor.deebPlue,
                                          width: 3,
                                        ),
                                        color: AppColor.plueLight),
                                    child: GestureDetector(
                                      onTap: () {
                                        showAuthorizationDialog(context, () {
                                          if (state
                                              is GetAllTranslatorsLoaded) {
                                            /*ZegoServices.callUsers(
                                                state.translators);*/
                                          }
                                        });
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SvgPicture.asset(
                                            Assets.phone,
                                            width: 24.sp,
                                          ),
                                          20.horizontalSpace,
                                          Text(
                                            'اتصل علي المترجم المتاح حاليا',
                                            style: AppTextStyle
                                                .aljazeera400Style24
                                                .copyWith(fontSize: 24.sp),
                                          ),
                                          22.horizontalSpace,
                                          SvgPicture.asset(
                                            Assets.arrowDown,
                                            width: 20.sp,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  30.verticalSpace,
                                  const CustemDivider(),
                                  20.verticalSpace,
                                  Container(
                                      alignment: Alignment.center,
                                      width: double.infinity,
                                      height: 85.h,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          color: AppColor.deebPlue),
                                      child: Text(
                                        'جدوله موعد مع مترجم مختص في احد المواضيع',
                                        textAlign: TextAlign.center,
                                        style: AppTextStyle.aljazeera400Style21
                                            .copyWith(
                                                fontSize: 22.sp,
                                                fontWeight: FontWeight.w600),
                                      )),
                                  20.verticalSpace,
                                  DateWidget(
                                    onDateSelected: (String date) {
                                      context
                                          .read<ScheduleAppointmentCubit>()
                                          .updateData(
                                            key: 'date',
                                            value: date,
                                          );
                                    },
                                  ),
                                  15.verticalSpace,

                                  TimeWidget(
                                    onTimeSelected: (String time) {
                                      context
                                          .read<ScheduleAppointmentCubit>()
                                          .updateData(
                                            key: 'time',
                                            value: time,
                                          );
                                    },
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
                                                  const SnackBar(
                                                    backgroundColor: Colors.red,
                                                    content: Text(
                                                      'يجب تحديد جميع الحقول',
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

  Widget _buttonWidget() {
    return ZegoSendCallInvitationButton(
      isVideoCall: false,
      resourceID: "zegouikit_call",
      invitees: [
        ZegoUIKitUser(
          id: "23",
          name: "user1",
        ),
      ],
    );
  }
}
