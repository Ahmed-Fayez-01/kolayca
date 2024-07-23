import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kolayca/core/utils/assets/app_assets.dart';
import 'package:kolayca/core/utils/colors/app_color.dart';
import 'package:kolayca/core/utils/text_styles/app_text_style.dart';
import 'package:kolayca/features/how_to_request%20_translator/presentation/widget/table_cle.dart';

class TimeWidget extends StatefulWidget {
  const TimeWidget({super.key, required this.onTimeSelected});
  final Function(String) onTimeSelected;
  @override
  State<TimeWidget> createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
  TimeOfDay? _selecteTime;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.deebPlue,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
            decoration: BoxDecoration(
                border: Border.all(
                  color: AppColor.deebPlue,
                  width: 3.r,
                ),
                color: AppColor.plueLight),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      Assets.imagesWhatTime,
                      width: 27.sp,
                    ),
                    7.horizontalSpace,
                    Text(
                      ' الوقت',
                      style: AppTextStyle.aljazeera400Style24,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15.w,
              vertical: 15.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    _selecteTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    setState(() {
                      widget.onTimeSelected(formatTimeOfDay(_selecteTime));
                    });
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset(
                        Assets.timeSelection,
                        width: 150.sp,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            formatTimeOfDay(_selecteTime),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 26.sp,
                              fontFamily: "Aljazeera",
                            ),
                          ),
                          8.verticalSpace,
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          10.verticalSpace,
        ],
      ),
    );
  }

  String formatTimeOfDay(TimeOfDay? tod) {
    final now = DateTime.now();
    final dt = DateTime(
        now.year, now.month, now.day, tod?.hour ?? 0, tod?.minute ?? 0);
    final format = DateFormat.Hm('en');
    return format.format(dt);
  }
}

class DateWidget extends StatefulWidget {
  const DateWidget({super.key, required this.onDateSelected});
  final Function(String) onDateSelected;
  @override
  State<DateWidget> createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {
  final DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.deebPlue,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
            decoration: BoxDecoration(
                border: Border.all(
                  color: AppColor.deebPlue,
                  width: 3.r,
                ),
                color: AppColor.plueLight),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      Assets.imagesDate,
                      width: 27.sp,
                    ),
                    10.horizontalSpace,
                    Text(
                      ' التاريخ',
                      style: AppTextStyle.aljazeera400Style24,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 10.h,
            ),
            child: TableCalendar(
              onDateSelected: (DateTime date) {
                widget.onDateSelected(
                  '${date.day}-${date.month}-${date.year}',
                );
              },
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
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyle.aljazeera400Style24,
    );
  }
}
