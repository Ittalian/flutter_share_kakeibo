import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:share_kakeibo/main.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'budget_confirmation.dart';
import 'price_list.dart';
import 'package:intl/intl.dart';
import 'loading_dialog.dart';
import 'dart:collection';

class Calendar extends HookWidget {
  const Calendar({super.key});

  PriceList setData(num foodPrice, num playPrice, num lifePrice,
      QuerySnapshot querySnapshot) {
    for (int index = 0; index < querySnapshot.docs.length; index++) {
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
    return PriceList(foodPrice, playPrice, lifePrice);
  }

  DateTime getDatetime(String datetimeStr) {
    DateTime result;

    result = DateFormat("y年M月d日").parseStrict(datetimeStr);
    return result;
  }

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final focusedDayState = useState(DateTime.now());
    final selectedDayState = useState(DateTime.now());
    num monthFoodPrice = 0;
    num monthPlayPrice = 0;
    num monthLifePrice = 0;
    num lastMonthFoodPrice = 0;
    num lastMonthPlayPrice = 0;
    num lastMonthLifePrice = 0;
    num ichiMonthFoodPrice = 0;
    num ichiMonthPlayPrice = 0;
    num ichiMonthLifePrice = 0;
    num moeMonthFoodPrice = 0;
    num moeMonthPlayPrice = 0;
    num moeMonthLifePrice = 0;
    final oldEventsList = useState<Map<DateTime, List>>({});
    final newEventsList = useState<Map<DateTime, List>>({});
    final isAdded = useState(false);

    Map<DateTime, List> getEventsList(Map<DateTime, List> eventsList) {
      final snapshot = FirebaseFirestore.instance.collection("budget").get();
      snapshot.then((QuerySnapshot querySnapshot) {
        for (int i = 0; i < querySnapshot.docs.length; i++) {
          final dateValue = getDatetime(
              "${DateTime.now().year}年${querySnapshot.docs[i]['month']}月${querySnapshot.docs[i]['day']}日");
          if (eventsList[dateValue] == null) {
            eventsList[dateValue] = [
              "${querySnapshot.docs[i]['user']} ${querySnapshot.docs[i]['category']} ${querySnapshot.docs[i]['price']}円"
            ];
          } else if (isAdded.value == false) {
            eventsList[dateValue]!.add(
                "${querySnapshot.docs[i]['user']} ${querySnapshot.docs[i]['category']} ${querySnapshot.docs[i]['price']}円");
          }
        }
        isAdded.value = true;
        newEventsList.value = eventsList;
      });
      return newEventsList.value;
    }

    final events = LinkedHashMap<DateTime, List>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(getEventsList(oldEventsList.value));

    List getEventForDay(DateTime day) {
      return events[day] ?? [];
    }

    return SingleChildScrollView(
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
        eventLoader: getEventForDay,
        headerStyle: const HeaderStyle(formatButtonVisible: false),
        selectedDayPredicate: (day) {
          return isSameDay(selectedDayState.value, day);
        },
        onDayLongPressed: (selectedDay, focusedDay) {
          showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: const Text("詳細を見ますか？"),
                actions: <Widget>[
                  TextButton(
                      child: const Text("見る"),
                      onPressed: () async {
                        LoadingDialog.show(context);
                        await Future.delayed(const Duration(seconds: 2));
                        LoadingDialog.hide(context);

                        //  データ取得処理
                        await FirebaseFirestore.instance
                            .collection('budget')
                            .where('year', isEqualTo: DateTime.now().year)
                            .where('month',
                                isEqualTo: selectedDayState.value.month)
                            .get()
                            .then((QuerySnapshot querySnapshot) {
                          PriceList monthPriceList = setData(monthFoodPrice,
                              monthPlayPrice, monthLifePrice, querySnapshot);
                          monthPlayPrice = monthPriceList.playPrice;
                          monthFoodPrice = monthPriceList.foodPrice;
                          monthLifePrice = monthPriceList.lifePrice;
                        });
                        await FirebaseFirestore.instance
                            .collection('budget')
                            .where('year', isEqualTo: DateTime.now().year)
                            .where('month',
                                isEqualTo: selectedDayState.value.month - 1)
                            .get()
                            .then((QuerySnapshot querySnapshot) {
                          PriceList lastMonthPriceList = setData(
                              lastMonthFoodPrice,
                              lastMonthPlayPrice,
                              lastMonthLifePrice,
                              querySnapshot);
                          lastMonthFoodPrice = lastMonthPriceList.foodPrice;
                          lastMonthPlayPrice = lastMonthPriceList.playPrice;
                          lastMonthLifePrice = lastMonthPriceList.lifePrice;
                        });
                        await FirebaseFirestore.instance
                            .collection('budget')
                            .where('year', isEqualTo: DateTime.now().year)
                            .where('month',
                                isEqualTo: selectedDayState.value.month)
                            .where('user', isEqualTo: "もえちゃん")
                            .get()
                            .then((QuerySnapshot querySnapshot) {
                          PriceList moeMonthPriceList = setData(
                              moeMonthFoodPrice,
                              moeMonthPlayPrice,
                              moeMonthLifePrice,
                              querySnapshot);
                          moeMonthFoodPrice = moeMonthPriceList.foodPrice;
                          moeMonthPlayPrice = moeMonthPriceList.playPrice;
                          moeMonthLifePrice = moeMonthPriceList.lifePrice;
                        });
                        await FirebaseFirestore.instance
                            .collection('budget')
                            .where('year', isEqualTo: DateTime.now().year)
                            .where('month',
                                isEqualTo: selectedDayState.value.month)
                            .where('user', isEqualTo: "いちくん")
                            .get()
                            .then((QuerySnapshot querySnapshot) {
                          PriceList ichiMonthPriceList = setData(
                              ichiMonthFoodPrice,
                              ichiMonthFoodPrice,
                              ichiMonthLifePrice,
                              querySnapshot);
                          ichiMonthFoodPrice = ichiMonthPriceList.foodPrice;
                          ichiMonthPlayPrice = ichiMonthPriceList.playPrice;
                          ichiMonthLifePrice = ichiMonthPriceList.lifePrice;
                        });
                        // ここまで
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BudgetConfirmation(
                                    monthFoodPrice: monthFoodPrice,
                                    monthPlayPrice: monthPlayPrice,
                                    monthLifePrice: monthLifePrice,
                                    lastMonthFoodPrice: lastMonthFoodPrice,
                                    lastMonthPlayPrice: lastMonthPlayPrice,
                                    lastMonthLifePrice: lastMonthLifePrice,
                                    ichiMonthFoodPrice: ichiMonthFoodPrice,
                                    ichiMonthPlayPrice: ichiMonthPlayPrice,
                                    ichiMonthLifePrice: ichiMonthLifePrice,
                                    moeMonthFoodPrice: moeMonthFoodPrice,
                                    moeMonthPlayPrice: moeMonthPlayPrice,
                                    moeMonthLifePrice: moeMonthLifePrice,
                                    month: selectedDayState.value.month,
                                    day: selectedDayState.value.day)));
                      }),
                  TextButton(
                      child: const Text("やっぱやめる"),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ],
              );
            },
          );
        },
        onDaySelected: (selectedDay, focusedDay) {
          selectedDayState.value = selectedDay;
          focusedDayState.value = focusedDay;
        },
      ),
      ListView(
          shrinkWrap: true,
          children: getEventForDay(selectedDayState.value)
              .map((event) => Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 40, 0),
                  child: Row(children: [
                    Expanded(
                        child: SizedBox(
                            width: screenWidth * 0.8,
                            child: ListTile(
                              title: Text(event.toString()),
                            ))),
                    ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                title: const Text("削除しますか？"),
                                actions: <Widget>[
                                  TextButton(
                                      child: const Text("する"),
                                      onPressed: () async {
                                        List<String> deleteData =
                                            event.split(" ");
                                        num deletePrice = num.parse(deleteData[deleteData.length - 1].replaceAll("円", ""));
                                        final query = await FirebaseFirestore
                                            .instance
                                            .collection("budget")
                                            .where('year', isEqualTo: selectedDayState.value.year)
                                            .where('month', isEqualTo: selectedDayState.value.month)
                                            .where('day', isEqualTo: selectedDayState.value.day)
                                            .where('user', isEqualTo: deleteData[0])
                                            .where('category', isEqualTo: deleteData[1])
                                            .where('price', isEqualTo: deletePrice)
                                            .get();
                                        query.docs.forEach((doc) {
                                          doc.reference.delete();
                                        });
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const MyHomePage()));
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: const Text('削除しました'),
                                            action: SnackBarAction(
                                              label: 'OK',
                                              onPressed: () {},
                                            ),
                                          )
                                        );
                                      }),
                                  TextButton(
                                      child: const Text("やっぱやめる"),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      }),
                                ],
                              );
                            },
                          );
                        },
                        child: const Text("削除"))
                  ])))
              .toList())
    ]));
  }
}
