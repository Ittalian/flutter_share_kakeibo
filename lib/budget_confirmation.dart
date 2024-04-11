import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_kakeibo/calendar.dart';
import 'package:fl_chart/fl_chart.dart';

class BudgetConfirmation extends StatefulWidget {
  final num foodPrice;
  final num playPrice;
  final num lifePrice;
  // final String category;
  // final int month;
  // final int day;
  const BudgetConfirmation(
      {required this.foodPrice,
      required this.playPrice,
      required this.lifePrice,
      // required this.month,
      // required this.day,
      super.key});
  @override
  State<BudgetConfirmation> createState() => _BudgetConfirmationState();
}

class _BudgetConfirmationState extends State<BudgetConfirmation> {
  late num foodPriceState;
  late num playPriceState;
  late num lifePriceState;

  @override
  void initState() {
    super.initState();

    foodPriceState = widget.foodPrice;
    playPriceState = widget.playPrice;
    lifePriceState = widget.lifePrice;
  }

  @override
  Widget build(BuildContext context) {
    num totalPrice = foodPriceState + playPriceState + lifePriceState;
    // 円グラフ作成
    double radius = 50;
    return Scaffold(
      body: 
      Column(children: [
          Container(
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.only(top: 50),
            child: Image.asset('images/confirmation.jpg'),
          ),
          SizedBox(
            height: 300,
            child: PieChart(
              PieChartData(
                startDegreeOffset: 270,
                sectionsSpace: 0,
                centerSpaceRadius: 40,
                sections: [
                  PieChartSectionData(
                    color: Colors.red,
                    value: foodPriceState / totalPrice * 100,
                    title: '食費',
                    radius: radius,
                    titleStyle: const TextStyle(
                      fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  PieChartSectionData(
                    color: const Color(0xFFFFAE35),
                    value: playPriceState / totalPrice * 100,
                    title: '遊び',
                    radius: radius,
                    titleStyle: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  PieChartSectionData(
                    color: const Color(0xFFFDD609),
                    value: lifePriceState / totalPrice * 100,
                    title: '生活費',
                    radius: radius,
                    titleStyle: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
                  )
                ],
              ),
            )
          )
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Calendar()));
          },
          child: const Icon(Icons.keyboard_backspace),
        )
      )
    );
  }
}
