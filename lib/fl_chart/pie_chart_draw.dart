import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PieChartDraw extends StatelessWidget {
  final num foodPrice;
  final num associatePrice;
  final num dailyPrice;
  final num hobbyPrice;
  final num clothPrice;
  final num transPrice;
  final num beautyPrice;
  final num specialPrice;
  final num otherPrice;
  final double radius;
  const PieChartDraw(
      {required this.foodPrice,
      required this.associatePrice,
      required this.dailyPrice,
      required this.hobbyPrice,
      required this.clothPrice,
      required this.transPrice,
      required this.beautyPrice,
      required this.specialPrice,
      required this.otherPrice,
      required this.radius,
      super.key});

  @override
  Widget build(BuildContext context) {
    num totalPrice = foodPrice + associatePrice + dailyPrice + hobbyPrice +
    clothPrice + transPrice + beautyPrice + specialPrice + otherPrice;

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
              fontSize: 20,
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
                value: foodPrice / totalPrice * 130,
                title: '食費\n${foodPrice.toString()}円',
                radius: radius,
                titleStyle: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              PieChartSectionData(
                color: const Color.fromARGB(255, 247, 1, 255),
                value: associatePrice / totalPrice * 130,
                title: '交際費\n${associatePrice.toString()}円',
                radius: radius,
                titleStyle: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              PieChartSectionData(
                color: const Color(0xFFFDD609),
                value: dailyPrice / totalPrice * 130,
                title: '日用品\n${dailyPrice.toString()}円',
                radius: radius,
                titleStyle: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              PieChartSectionData(
                color: const Color.fromARGB(255, 45, 6, 205),
                value: hobbyPrice / totalPrice * 130,
                title: '趣味費\n${hobbyPrice.toString()}円',
                radius: radius,
                titleStyle: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              PieChartSectionData(
                color: const Color.fromARGB(255, 0, 149, 255),
                value: clothPrice / totalPrice * 130,
                title: '被服費\n${clothPrice.toString()}円',
                radius: radius,
                titleStyle: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              PieChartSectionData(
                color: const Color.fromARGB(255, 6, 144, 6),
                value: transPrice / totalPrice * 130,
                title: '交通費\n${transPrice.toString()}円',
                radius: radius,
                titleStyle: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              PieChartSectionData(
                color: const Color.fromARGB(255, 148, 70, 123),
                value: beautyPrice / totalPrice * 130,
                title: '美容費\n${beautyPrice.toString()}円',
                radius: radius,
                titleStyle: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              PieChartSectionData(
                color: const Color.fromARGB(255, 255, 140, 0),
                value: specialPrice / totalPrice * 130,
                title: '特別費\n${specialPrice.toString()}円',
                radius: radius,
                titleStyle: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              PieChartSectionData(
                color: const Color.fromARGB(255, 0, 0, 0),
                value: otherPrice / totalPrice * 130,
                title: 'その他\n${otherPrice.toString()}円',
                radius: radius,
                titleStyle: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )
            ])));
  }
}
