import 'package:flutter/material.dart';
import 'package:share_kakeibo/fl_chart/bar_chart/bar_chart_property.dart';
import 'package:share_kakeibo/fl_chart/bar_chart/bar_chart_section.dart';

class BarChartDraw extends StatelessWidget {
  final num monthFoodPrice;
  final num monthAssociatePrice;
  final num monthDailyPrice;
  final num monthHobbyPrice;
  final num monthClothPrice;
  final num monthTransPrice;
  final num monthBeautyPrice;
  final num monthSpecialPrice;
  final num monthOtherPrice;
  final num lastMonthFoodPrice;
  final num lastMonthAssociatePrice;
  final num lastMonthDailyPrice;
  final num lastMonthHobbyPrice;
  final num lastMonthClothPrice;
  final num lastMonthTransPrice;
  final num lastMonthBeautyPrice;
  final num lastMonthSpecialPrice;
  final num lastMonthOtherPrice;
  const BarChartDraw(
      {required this.monthFoodPrice,
      required this.monthAssociatePrice,
      required this.monthDailyPrice,
      required this.monthHobbyPrice,
      required this.monthClothPrice,
      required this.monthTransPrice,
      required this.monthBeautyPrice,
      required this.monthSpecialPrice,
      required this.monthOtherPrice,
      required this.lastMonthFoodPrice,
      required this.lastMonthAssociatePrice,
      required this.lastMonthDailyPrice,
      required this.lastMonthHobbyPrice,
      required this.lastMonthClothPrice,
      required this.lastMonthTransPrice,
      required this.lastMonthBeautyPrice,
      required this.lastMonthSpecialPrice,
      required this.lastMonthOtherPrice,
      super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    List<BarChartPropery> barChartPropertyList = [
      BarChartPropery(monthFoodPrice, lastMonthFoodPrice, Colors.red),
      BarChartPropery(monthAssociatePrice, lastMonthAssociatePrice, const Color.fromARGB(255, 247, 1, 255)),
      BarChartPropery(monthDailyPrice, lastMonthDailyPrice, const Color(0xFFFDD609)),
      BarChartPropery(monthHobbyPrice, lastMonthHobbyPrice, const Color.fromARGB(255, 45, 6, 205)),
      BarChartPropery(monthClothPrice, lastMonthClothPrice, const Color.fromARGB(255, 0, 149, 255)),
      BarChartPropery(monthTransPrice, lastMonthTransPrice, const Color.fromARGB(255, 6, 144, 6)),
      BarChartPropery(monthBeautyPrice, lastMonthBeautyPrice, const Color.fromARGB(255, 148, 70, 123)),
      BarChartPropery(monthSpecialPrice, lastMonthSpecialPrice, const Color.fromARGB(255, 255, 140, 0)),
      BarChartPropery(monthOtherPrice, lastMonthOtherPrice, const Color.fromARGB(255, 0, 0, 0)),
    ];
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
        child: SizedBox(
          width: screenWidth * 0.8,
          height: screenWidth * 0.95 * 0.65,
          child: BarChartSection(barChartPropertyList: barChartPropertyList),
          // child: BarChart(
          //   BarChartData(
          //     borderData: FlBorderData(
          //       border: const Border(
          //         top: BorderSide.none,
          //         right: BorderSide.none,
          //         left: BorderSide(width: 1),
          //         bottom: BorderSide(width: 1),
          //       ),
          //     ),
          //     titlesData: FlTitlesData(
          //         topTitles: const AxisTitles(
          //             sideTitles: SideTitles(
          //           showTitles: false,
          //         )),
          //         bottomTitles: AxisTitles(
          //             sideTitles: SideTitles(
          //           showTitles: true,
          //           interval: 1.0,
          //           reservedSize: 42.0,
          //           getTitlesWidget:(value, meta) => BottomTitleWidgets(value: value, meta: meta),
          //         ))
          //     ),
          //     groupsSpace: 10,
          //     barGroups: [
          //       BarChartGroupData(x: 1, barRods: [
          //         BarChartRodData(
          //             toY: lastMonthFoodPrice.toDouble(),
          //             width: 15,
          //             color: Colors.red),
          //         BarChartRodData(
          //             toY: monthFoodPrice.toDouble(),
          //             width: 15,
          //             color: Colors.red),
          //       ]),
          //       BarChartGroupData(x: 2, barRods: [
          //         BarChartRodData(
          //           toY: lastMonthPlayPrice.toDouble(),
          //           width: 15,
          //           color: const Color(0xFFFFAE35),
          //         ),
          //         BarChartRodData(
          //             toY: monthPlayPrice.toDouble(),
          //             width: 15,
          //             color: const Color(0xFFFFAE35)),
          //       ]),
          //       BarChartGroupData(x: 3, barRods: [
          //         BarChartRodData(
          //             toY: lastMonthLifePrice.toDouble(),
          //             width: 15,
          //             color: const Color(0xFFFDD609)),
          //         BarChartRodData(
          //             toY: monthLifePrice.toDouble(),
          //             width: 15,
          //             color: const Color(0xFFFDD609)),
          //       ]),
          //     ],
          //   ),
          // ),
        ));
  }
}
