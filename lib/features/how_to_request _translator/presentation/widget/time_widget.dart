import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kolayca/core/utils/assets/app_assets.dart';
import 'package:kolayca/core/utils/colors/app_color.dart';
import 'package:kolayca/core/utils/text_styles/app_text_style.dart';
import 'package:kolayca/features/how_to_request%20_translator/presentation/widget/table_cle.dart';

class TimeWidget extends StatefulWidget {
  const TimeWidget(
      {super.key, required this.onTimeSelected, required this.onDateSelected});
  final Function(String) onTimeSelected;
  final Function(String) onDateSelected;
  @override
  State<TimeWidget> createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
  final DateTime _selectedDate = DateTime.now();
  TimeOfDay? _selecteTime;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 60.w),
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
                      width: 20.sp,
                    ),
                    7.horizontalSpace,
                    Text(
                      ' الوقت',
                      style: AppTextStyle.aljazeera400Style21
                          .copyWith(fontSize: 21.sp),
                    ),
                  ],
                ),
                15.horizontalSpace,
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
                0.horizontalSpace,
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 15),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      Assets.timeSelection,
                      width: 105.w,
                    ),
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
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            formatTimeOfDay(_selecteTime),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Aljazeera",
                            ),
                          ),
                          5.verticalSpace,
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(width: 15.w),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  child: Container(
                    height: 170.h,
                    width: 1.w,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: 15.w),
                Expanded(
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
    final format = DateFormat.Hm();
    return format.format(dt);
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
/* 
Widget calendarDay(String day) {
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.all(2.r), // Smaller padding
    decoration: BoxDecoration(
      // border: Border.all(color: Colors.white),
      shape: day == '12' ? BoxShape.circle : BoxShape.rectangle,
      color: day == '12' ? Colors.blueAccent : Colors.transparent,
    ),
    child: Text(
      day,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 4, // Smaller font size
      ),
    ),
  );
}
 */
