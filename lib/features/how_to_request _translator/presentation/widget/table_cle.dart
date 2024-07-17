
import 'package:flutter/material.dart';
import 'package:kolayca/features/how_to_request%20_translator/presentation/widget/time_widget.dart';

class TableCalendar extends StatelessWidget {
  const TableCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: const TableBorder.symmetric(
        inside: BorderSide(width: 0.5, color: Colors.white),
      ),
      children: [
        TableRow(
          children: [
            calendarDay('S'),
            calendarDay('M'),
            calendarDay('T'),
            calendarDay('W'),
            calendarDay('T'),
            calendarDay('F'),
            calendarDay('S'),
          ],
        ),
        ...List.generate(5, (index) {
          return TableRow(
            children: List.generate(7, (dayIndex) {
              int day = index * 7 + dayIndex + 1;
              return calendarDay(day <= 31 ? day.toString() : '');
            }),
          );
        }),
      ],
    );
  }}