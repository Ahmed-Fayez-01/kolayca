import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolayca/core/utils/colors/app_color.dart';

class TableCalendar extends StatefulWidget {
  const TableCalendar({super.key, required this.onDateSelected});
  final Function(DateTime) onDateSelected;
  @override
  State<TableCalendar> createState() => _TableCalendarState();
}

class _TableCalendarState extends State<TableCalendar> {
  DateTime _selectedDate = DateTime.now();
  DateTime? _selectedDay;
  void _nextMonth() {
    setState(() {
      _selectedDate = DateTime(_selectedDate.year, _selectedDate.month + 1);
    });
  }

  void _previousMonth() {
    setState(() {
      _selectedDate = DateTime(_selectedDate.year, _selectedDate.month - 1);
    });
  }

  void _selectDay(DateTime day) {
    setState(() {
      _selectedDay = day;
    });

    widget.onDateSelected(day);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(),
        10.verticalSpace,
        _buildDaysOfWeek(),
        2.verticalSpace,
        _buildDays(),
      ],
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: _previousMonth,
          child: Padding(
            padding: EdgeInsets.all(8.r),
            child: Icon(
              Icons.arrow_back_ios,
              color: AppColor.deebPlue,
              size: 25.sp,
              // Smaller icon size
            ),
          ),
        ),
        Text(
          DateFormat.yMMMM(context.locale.languageCode).format(_selectedDate),
          style: TextStyle(
            fontSize: 24.sp, // Smaller font size
            color: AppColor.deebPlue,
          ),
        ),
        InkWell(
          onTap: _nextMonth,
          child: Padding(
            padding: EdgeInsets.all(8.r),
            child: Icon(
              Icons.arrow_forward_ios,
              color: AppColor.deebPlue,
              size: 25.sp, // Smaller icon size
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDaysOfWeek() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(7, (index) {
        return Expanded(
          child: Center(
            child: Text(
              DateFormat('E', 'en').format(
                  DateTime(_selectedDate.year, _selectedDate.month, index + 1)),
              maxLines: 1,
              overflow: TextOverflow.fade,
              style: TextStyle(
                color: AppColor.deebPlue,
                fontWeight: FontWeight.w500,
                fontSize: 11.sp, // Smaller font size
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildDays() {
    final daysInMonth =
        DateTime(_selectedDate.year, _selectedDate.month + 1, 0).day;
    // final firstDayOfWeek =
    //     DateTime(_selectedDate.year, _selectedDate.month, 1).weekday;
    final totalSlots = daysInMonth;

    return GridView.builder(
      shrinkWrap: true,
      itemCount: totalSlots,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7, crossAxisSpacing: 8.h),
      itemBuilder: (context, index) {
        if (index > daysInMonth - 1) {
          return Container();
        } else {
          final day = index + 1;
          final date = DateTime(_selectedDate.year, _selectedDate.month, day);
          final isSelected = _selectedDay != null &&
              _selectedDay!.day == day &&
              _selectedDay!.month == _selectedDate.month &&
              _selectedDay!.year == _selectedDate.year;
          final bool isBeforeToday = date.isBefore(DateTime.now()) &&
              date.difference(DateTime.now()).inDays != 0;
          return GestureDetector(
            onTap: isBeforeToday ? null : () => _selectDay(date),
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 1.h),
              height: 6.h,
              decoration: BoxDecoration(
                color: isSelected ? AppColor.deebPlue : null,
                shape: BoxShape.circle,
                border: isSelected
                    ? Border.all(
                        color: AppColor.plueLight,
                        width: 1.sp,
                      )
                    : null,
              ),
              child: Text(
                '$day',
                style: TextStyle(
                  color: isBeforeToday
                      ? Colors.grey
                      : isSelected
                          ? Colors.white
                          : Colors.black,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w400,
                  fontSize: 13.sp,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
