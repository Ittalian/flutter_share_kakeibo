import 'package:flutter/material.dart';
import 'pie_chart_draw.dart';
import 'bar_chart_draw.dart';
import 'package:share_kakeibo/main.dart';

class BudgetConfirmation extends StatefulWidget {
  // final String category;
  final num foodPrice;
  final num playPrice;
  final num lifePrice;
  final num monthFoodPrice;
  final num monthPlayPrice;
  final num monthLifePrice;
  final num lastMonthFoodPrice;
  final num lastMonthPlayPrice;
  final num lastMonthLifePrice;
  final num ichiFoodPrice;
  final num ichiPlayPrice;
  final num ichiLifePrice;
  final num ichiMonthFoodPrice;
  final num ichiMonthPlayPrice;
  final num ichiMonthLifePrice;
  final num moeFoodPrice;
  final num moePlayPrice;
  final num moeLifePrice;
  final num moeMonthFoodPrice;
  final num moeMonthPlayPrice;
  final num moeMonthLifePrice;
  final int month;
  final int day;
  const BudgetConfirmation(
      {required this.foodPrice,
      required this.playPrice,
      required this.lifePrice,
      required this.monthFoodPrice,
      required this.monthPlayPrice,
      required this.monthLifePrice,
      required this.lastMonthFoodPrice,
      required this.lastMonthPlayPrice,
      required this.lastMonthLifePrice,
      required this.ichiFoodPrice,
      required this.ichiPlayPrice,
      required this.ichiLifePrice,
      required this.ichiMonthFoodPrice,
      required this.ichiMonthPlayPrice,
      required this.ichiMonthLifePrice,
      required this.moeFoodPrice,
      required this.moePlayPrice,
      required this.moeLifePrice,
      required this.moeMonthFoodPrice,
      required this.moeMonthPlayPrice,
      required this.moeMonthLifePrice,
      required this.month,
      required this.day,
      super.key});
  @override
  State<BudgetConfirmation> createState() => _BudgetConfirmationState();
}

class _BudgetConfirmationState extends State<BudgetConfirmation> {
  late num foodPriceState;
  late num playPriceState;
  late num lifePriceState;
  late num monthFoodPriceState;
  late num monthPlayPriceState;
  late num monthLifePriceState;
  late num lastMonthFoodPriceState;
  late num lastMonthPlayPriceState;
  late num lastMonthLifePriceState;
  late num ichiFoodPriceState;
  late num ichiPlayPriceState;
  late num ichiLifePriceState;
  late num ichiMonthFoodPriceState;
  late num ichiMonthPlayPriceState;
  late num ichiMonthLifePriceState;
  late num moeFoodPriceState;
  late num moePlayPriceState;
  late num moeLifePriceState;
  late num moeMonthFoodPriceState;
  late num moeMonthPlayPriceState;
  late num moeMonthLifePriceState;
  late num monthState;
  late num dayState;

  @override
  void initState() {
    super.initState();

    foodPriceState = widget.foodPrice;
    playPriceState = widget.playPrice;
    lifePriceState = widget.lifePrice;
    monthFoodPriceState = widget.monthFoodPrice;
    monthPlayPriceState = widget.monthPlayPrice;
    monthLifePriceState = widget.monthLifePrice;
    lastMonthFoodPriceState = widget.lastMonthFoodPrice;
    lastMonthPlayPriceState = widget.lastMonthPlayPrice;
    lastMonthLifePriceState = widget.lastMonthLifePrice;
    ichiFoodPriceState = widget.ichiFoodPrice;
    ichiPlayPriceState = widget.ichiPlayPrice;
    ichiLifePriceState = widget.ichiLifePrice;
    ichiMonthFoodPriceState = widget.ichiMonthFoodPrice;
    ichiMonthPlayPriceState = widget.ichiMonthPlayPrice;
    ichiMonthLifePriceState = widget.ichiMonthLifePrice;
    moeFoodPriceState = widget.moeFoodPrice;
    moePlayPriceState = widget.moePlayPrice;
    moeLifePriceState = widget.moeLifePrice;
    moeMonthFoodPriceState = widget.moeMonthFoodPrice;
    moeMonthPlayPriceState = widget.moeMonthPlayPrice;
    moeMonthLifePriceState = widget.moeMonthLifePrice;
    monthState = widget.month;
    dayState = widget.day;
  }

  @override
  Widget build(BuildContext context) {
    // 円グラフ作成
    double radius = 50;
    double personalRadius = 40;
    num totalPrice =
        monthFoodPriceState + monthPlayPriceState + monthLifePriceState;
    num limitPrice = 40000 - totalPrice;
    String fightText = "";
    if (limitPrice > 30000) {
      fightText = "まだ余裕あるね!";
    } else if (limitPrice > 20000) {
      fightText = "ちょっと節約した方がいいかも💦";
    } else if (limitPrice > 10000) {
      fightText = "あんまり余裕ないから気を付けて！";
    } else {
      fightText = "もう浪費しちゃダメだよ！";
    }

    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.only(top: 50),
            child: Image.asset('images/confirmation.jpg'),
          ),
          const Padding(padding: EdgeInsets.only(top: 30)),
          Container(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              alignment: Alignment.center,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Column(children: [
                    Text(
                      "４万円まであと${limitPrice.toString()}円 ！",
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      fightText,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]))),
          const Padding(padding: EdgeInsets.only(top: 30)),
          Text(
            "${monthState.toString()}月${dayState.toString()}日の収支",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 30)),
          Row(
            children: [
              Container(
                  width: 200,
                  child: Column(children: [
                    const Text(
                      "いちくん",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    PieChartDraw(
                        foodPrice: ichiFoodPriceState,
                        lifePrice: ichiLifePriceState,
                        playPrice: ichiPlayPriceState,
                        radius: personalRadius)
                  ])),
              Container(
                  width: 200,
                  child: Column(children: [
                    const Text(
                      "もえちゃん",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    PieChartDraw(
                        foodPrice: moeFoodPriceState,
                        lifePrice: moeLifePriceState,
                        playPrice: moePlayPriceState,
                        radius: personalRadius)
                  ])),
            ],
          ),
          const Text(
            "ふたり",
            style: TextStyle(fontSize: 15),
          ),
          PieChartDraw(
              foodPrice: foodPriceState,
              lifePrice: lifePriceState,
              playPrice: playPriceState,
              radius: radius),
          Text(
            "${monthState.toString()}月全体の収支",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 30)),
          Row(
            children: [
              Container(
                  width: 200,
                  child: Column(children: [
                    const Text(
                      "いちくん",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    PieChartDraw(
                        foodPrice: ichiMonthFoodPriceState,
                        lifePrice: ichiMonthLifePriceState,
                        playPrice: ichiMonthPlayPriceState,
                        radius: personalRadius)
                  ])),
              Container(
                  width: 200,
                  child: Column(children: [
                    const Text(
                      "もえちゃん",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    PieChartDraw(
                        foodPrice: moeMonthFoodPriceState,
                        lifePrice: moeMonthLifePriceState,
                        playPrice: moeMonthPlayPriceState,
                        radius: personalRadius)
                  ])),
            ],
          ),
          const Text(
            "ふたり",
            style: TextStyle(fontSize: 15),
          ),
          PieChartDraw(
              foodPrice: monthFoodPriceState,
              lifePrice: monthLifePriceState,
              playPrice: monthPlayPriceState,
              radius: radius),
          const Padding(padding: EdgeInsets.only(top: 30)),
          Text("${monthState.toString()}月の前月比",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          BarChartDraw(
            monthFoodPrice: monthFoodPriceState,
            monthPlayPrice: monthPlayPriceState,
            monthLifePrice: monthLifePriceState,
            lastMonthFoodPrice: lastMonthFoodPriceState,
            lastMonthPlayPrice: lastMonthPlayPriceState,
            lastMonthLifePrice: lastMonthLifePriceState,
          )
        ])),
        floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
        floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyHomePage()));
              },
              child: const Icon(Icons.home),
            )));
  }
}
