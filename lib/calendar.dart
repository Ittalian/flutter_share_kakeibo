import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'budget_confirmation.dart';

class Calendar extends HookWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    final focusedDayState = useState(DateTime.now());
    final selectedDayState = useState(DateTime.now());
    num foodPrice = 0;
    num playPrice = 0;
    num lifePrice = 0;

    return Material(
        child: Column(children: [
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
          showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: const Text("詳細を見ますか？"),
                actions: <Widget>[
                  TextButton(
                      child: const Text("OK"),
                      onPressed: () async {
                        //  データ取得処理
                        await FirebaseFirestore.instance
                            .collection('budget')
                            .where('year', isEqualTo: DateTime.now().year)
                            .where('month',
                                isEqualTo: selectedDayState.value.month)
                            .where('day', isEqualTo: selectedDayState.value.day)
                            .get()
                            .then((QuerySnapshot querySnapshot) {
                          for (int index = 0;
                              index < querySnapshot.docs.length;
                              index++) {
                            switch (querySnapshot.docs[index]["category"]) {
                              case "食費":
                                foodPrice += querySnapshot.docs[index]["price"];
                                break;
                              case "遊び":
                                playPrice += querySnapshot.docs[index]["price"];
                                break;
                              case "生活費":
                                lifePrice += querySnapshot.docs[index]["price"];
                                break;
                            }
                          }
                          // print(foodPrice);
                          // print(playPrice);
                          // print(lifePrice);
                        });
                        // ここまで
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BudgetConfirmation(
                                    foodPrice: foodPrice,
                                    playPrice: playPrice,
                                    lifePrice: lifePrice)));

                        // print(selectedDayState.value);
                        // final snapshot = await FirebaseFirestore.instance
                        //     .collection('budget')
                        //     .get();
                        // listState.value = snapshot.docs;
                        // print(price);
                        // print(category);
                        // print(month);
                        // print(day);
                      }),
                  TextButton(
                      child: const Text("キャンセル"),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ],
              );
            },
          );
        },
      ),
    ]));
  }
}
