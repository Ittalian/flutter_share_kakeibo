import 'package:flutter/material.dart';
import 'pie_chart_draw.dart';
import 'package:share_kakeibo/main.dart';

class BudgetConfirmation extends StatefulWidget {
  // final String category;
  final num foodPrice;
  final num playPrice;
  final num lifePrice;
  final num monthFoodPrice;
  final num monthPlayPrice;
  final num monthLifePrice;
  final int month;
  final int day;
  const BudgetConfirmation(
      {required this.foodPrice,
      required this.playPrice,
      required this.lifePrice,
      required this.monthFoodPrice,
      required this.monthPlayPrice,
      required this.monthLifePrice,
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
    monthState = widget.month;
    dayState = widget.day;
  }

  @override
  Widget build(BuildContext context) {
    // 円グラフ作成
    double radius = 50;
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.only(top: 50),
            child: Image.asset('images/confirmation.jpg'),
          ),
          const Padding(padding: EdgeInsets.only(top: 30)),
          Text(
            "${monthState.toString()}月${dayState.toString()}日の収支",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          PieChartDraw(
              foodPrice: foodPriceState,
              lifePrice: lifePriceState,
              playPrice: playPriceState,
              radius: radius),
          const Padding(padding: EdgeInsets.only(top: 30)),
          Text(
            "${monthState.toString()}月全体の収支",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          PieChartDraw(
              foodPrice: monthFoodPriceState,
              lifePrice: monthPlayPriceState,
              playPrice: monthLifePriceState,
              radius: radius
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
