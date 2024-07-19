import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolayca/core/utils/colors/app_color.dart';
import 'package:kolayca/features/how_to_request%20_translator/presentation/widget/time_widget.dart';
import 'package:intl/intl.dart';

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
        SizedBox(height: 5.h), // Smaller vertical spacing
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
              color: Colors.white,
              size: 15.sp, // Smaller icon size
            ),
          ),
        ),
        Text(
          DateFormat.yMMMM().format(_selectedDate),
          style: TextStyle(
            fontSize: 15.sp, // Smaller font size
            color: Colors.white,
          ),
        ),
        InkWell(
          onTap: _nextMonth,
          child: Padding(
            padding: EdgeInsets.all(8.r),
            child: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 15.sp, // Smaller icon size
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
              DateFormat('E').format(
                  DateTime(_selectedDate.year, _selectedDate.month, index + 1)),
              maxLines: 1,
              overflow: TextOverflow.fade,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 7.sp, // Smaller font size
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
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7, crossAxisSpacing: 4.r),
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
          return GestureDetector(
            onTap: () => _selectDay(date),
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 1.h),
              height: 6.h,
              decoration: BoxDecoration(
                color: isSelected ? Colors.white : null,
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
                  color: isSelected ? Colors.black : Colors.white,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w400,
                  fontSize: 8.sp,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
