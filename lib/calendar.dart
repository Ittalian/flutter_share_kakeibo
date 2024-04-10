import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    DateTime focusedDay = DateTime.now();
    DateTime? selectedDay;

    return Column(children: [
      Container(
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.only(top: 50),
        child: Image.asset('images/calendar.jpg'),
      ),
      TableCalendar(
        focusedDay: focusedDay,
        firstDay: DateTime.utc(focusedDay.month),
        lastDay: DateTime.utc(focusedDay.year + 100, 12, 31),
        locale: 'ja_JP',
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
        ),
        selectedDayPredicate: (day) {
          return isSameDay(selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(selectedDay, focusedDay)) {
            setState(() {
              selectedDay = selectedDay;
              focusedDay = focusedDay;
            });
          }
        },
      ),
    ]);
  }
}
