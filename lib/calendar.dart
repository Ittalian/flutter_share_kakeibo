import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Calendar extends HookWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    final focusedDayState = useState(DateTime.now());
    final selectedDayState = useState(DateTime.now());

    return Column(children: [
      Container(
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.only(top: 50),
        child: Image.asset('images/calendar.jpg'),
      ),
      TableCalendar(
        firstDay: DateTime.utc(DateTime.now().year, 1, 1),
        lastDay: DateTime.utc(DateTime.now().year + 100, 12, 31),
        focusedDay: DateTime.now(),
        locale: 'ja_JP',
        headerStyle: const HeaderStyle(formatButtonVisible: false),
        selectedDayPredicate: (day) {
          return isSameDay(selectedDayState.value, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          selectedDayState.value = selectedDay;
          focusedDayState.value = focusedDay;
        },
      ),
    ]);
  }
}
