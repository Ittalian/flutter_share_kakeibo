import 'package:flutter/material.dart';
import '../../fl_chart/pie_chart_draw.dart';
import '../../fl_chart/bar_chart_draw.dart';
import 'package:share_kakeibo/main.dart';

class BudgetConfirmation extends StatefulWidget {
  // final String category;
  final num monthFoodPrice;
  final num monthPlayPrice;
  final num monthLifePrice;
  final num lastMonthFoodPrice;
  final num lastMonthPlayPrice;
  final num lastMonthLifePrice;
  final num ichiMonthFoodPrice;
  final num ichiMonthPlayPrice;
  final num ichiMonthLifePrice;
  final num moeMonthFoodPrice;
  final num moeMonthPlayPrice;
  final num moeMonthLifePrice;
  final int month;
  final int day;
  const BudgetConfirmation(
      {required this.monthFoodPrice,
      required this.monthPlayPrice,
      required this.monthLifePrice,
      required this.lastMonthFoodPrice,
      required this.lastMonthPlayPrice,
      required this.lastMonthLifePrice,
      required this.ichiMonthFoodPrice,
      required this.ichiMonthPlayPrice,
      required this.ichiMonthLifePrice,
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
  late num monthFoodPriceState;
  late num monthPlayPriceState;
  late num monthLifePriceState;
  late num lastMonthFoodPriceState;
  late num lastMonthPlayPriceState;
  late num lastMonthLifePriceState;
  late num ichiMonthFoodPriceState;
  late num ichiMonthPlayPriceState;
  late num ichiMonthLifePriceState;
  late num moeMonthFoodPriceState;
  late num moeMonthPlayPriceState;
  late num moeMonthLifePriceState;
  late num monthState;
  late num dayState;

  @override
  void initState() {
    super.initState();

    monthFoodPriceState = widget.monthFoodPrice;
    monthPlayPriceState = widget.monthPlayPrice;
    monthLifePriceState = widget.monthLifePrice;
    lastMonthFoodPriceState = widget.lastMonthFoodPrice;
    lastMonthPlayPriceState = widget.lastMonthPlayPrice;
    lastMonthLifePriceState = widget.lastMonthLifePrice;
    ichiMonthFoodPriceState = widget.ichiMonthFoodPrice;
    ichiMonthPlayPriceState = widget.ichiMonthPlayPrice;
    ichiMonthLifePriceState = widget.ichiMonthLifePrice;
    moeMonthFoodPriceState = widget.moeMonthFoodPrice;
    moeMonthPlayPriceState = widget.moeMonthPlayPrice;
    moeMonthLifePriceState = widget.moeMonthLifePrice;
    monthState = widget.month;
    dayState = widget.day;
  }

  @override
  Widget build(BuildContext context) {
    // 円グラフ作成
    final screenWidth = MediaQuery.of(context).size.width;
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
            "${monthState.toString()}月の収支",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 30)),
          Row(
            children: [
              SizedBox(
                  width: screenWidth * 0.5,
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
              SizedBox(
                  width: screenWidth * 0.5,
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
