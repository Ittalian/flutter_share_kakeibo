import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PieChartDraw extends StatelessWidget {
  final num foodPrice;
  final num playPrice;
  final num lifePrice;
  final double radius;
  const PieChartDraw(
      {required this.foodPrice,
      required this.lifePrice,
      required this.playPrice,
      required this.radius,
      super.key});

  @override
  Widget build(BuildContext context) {
    num totalPrice = foodPrice + lifePrice + playPrice;

    // 収支がない場合の処理
    if (totalPrice == 0) {
      // 0で割ることを防ぐ
      totalPrice = 1;
      return const Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 30)),
          Text(
            "収支はありません",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 50)),
        ]
      );
    }

    return SizedBox(
        height: 250,
        child: PieChart(PieChartData(
            startDegreeOffset: 270,
            sectionsSpace: 0,
            centerSpaceRadius: 40,
            sections: [
              PieChartSectionData(
                color: Colors.red,
                value: foodPrice / totalPrice * 100,
                title: '食費\n${foodPrice.toString()}円',
                radius: radius,
                titleStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              PieChartSectionData(
                color: const Color(0xFFFFAE35),
                value: playPrice / totalPrice * 100,
                title: '遊び\n${playPrice.toString()}円',
                radius: radius,
                titleStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              PieChartSectionData(
                color: const Color(0xFFFDD609),
                value: lifePrice / totalPrice * 100,
                title: '生活費\n${lifePrice.toString()}円',
                radius: radius,
                titleStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )
            ])));
  }
}
