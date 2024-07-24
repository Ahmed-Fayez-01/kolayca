import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kolayca/core/utils/assets/app_assets.dart';
import 'package:kolayca/core/utils/colors/app_color.dart';
import 'package:kolayca/core/utils/services/remote_services/service_locator.dart';
import 'package:kolayca/core/utils/text_styles/app_text_style.dart';
import 'package:kolayca/features/how_to_request%20_translator/presentation/view_modesl/get_specialization_cubit/get_specialization_cubite.dart';

import '../../data/models/specialization.dart';

class SpecializationRequireditem extends StatelessWidget {
  const SpecializationRequireditem({super.key, required this.onSelected});
  final Function(Specialization) onSelected;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetSpecializationCubit(getIt())..getSpecialization(),
      child: BlocBuilder<GetSpecializationCubit, GetSpecializationState>(
        builder: (context, state) {
          return Container(
            color: AppColor.deebPlue,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 4.h),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColor.deebPlue,
                        width: 3,
                      ),
                      color: AppColor.plueLight),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          Assets.imagesLayer3,
                          width: 26.sp,
                        ),
                        SizedBox(width: 20.w),
                        Text(
                          'requiredSpecialization'.tr(),
                          style: AppTextStyle.aljazeera400Style24.copyWith(
                            fontSize: 30.sp,
                          ),
                        ),
                        SizedBox(width: 20.w),
                        SvgPicture.asset(
                          Assets.arrowDown,
                          width: 20.sp,
                        ),
                      ],
                    ),
                  ),
                ),
                if (state is GetSpecializationLoading)
                  const SizedBox(
                    height: 50,
                    width: 50,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                if (state is GetSpecializationSuccess) ...[
                  SpecailzationsList(
                    specialization: state.specialization,
                    onSelected: onSelected,
                  ),
                ],
                10.verticalSpace,
              ],
            ),
          );
        },
      ),
    );
  }
}

class SpecailzationsList extends StatefulWidget {
  const SpecailzationsList({
    super.key,
    required this.specialization,
    required this.onSelected,
  });
  final List<Specialization> specialization;
  final Function(Specialization s) onSelected;

  @override
  State<SpecailzationsList> createState() => _SpecailzationsListState();
}

class _SpecailzationsListState extends State<SpecailzationsList> {
  int selected = -1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Column(
              children: [
                for (int i = 0;
                    i < (widget.specialization.length + 1) ~/ 2;
                    i++)
                  CustemText(
                    specialization: widget.specialization[i],
                    isSelected: selected == widget.specialization[i].id,
                    onSelected: (Specialization s) {
                      setState(() {
                        selected = s.id ?? -1;
                      });
                      widget.onSelected(s);
                    },
                  ),
              ],
            ),
          ),
          Container(
            height: 100.h,
            width: 1.w,
            color: Colors.grey,
          ),
          Expanded(
            child: Column(
              children: [
                for (int i = (widget.specialization.length + 1) ~/ 2;
                    i < widget.specialization.length;
                    i++)
                  CustemText(
                    specialization: widget.specialization[i],
                    isSelected: selected == widget.specialization[i].id,
                    onSelected: (Specialization s) {
                      setState(() {
                        selected = s.id ?? -1;
                      });
                      widget.onSelected(s);
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustemText extends StatelessWidget {
  const CustemText({
    super.key,
    required this.specialization,
    required this.isSelected,
    required this.onSelected,
  });
  final Specialization specialization;
  final bool isSelected;
  final Function(Specialization) onSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelected(specialization);
      },
      child: Text(
        specialization.title ?? '',
        style: AppTextStyle.aljazeera400Style24.copyWith(
            fontSize: 22.sp,
            color: isSelected ? AppColor.plueLight : Colors.white,
            decorationColor: AppColor.plueLight,
            decoration: isSelected ? TextDecoration.underline : null),
      ),
    );
  }
}
