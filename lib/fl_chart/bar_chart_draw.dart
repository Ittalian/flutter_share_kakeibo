import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class BarChartDraw extends StatelessWidget {
  final num monthFoodPrice;
  final num monthPlayPrice;
  final num monthLifePrice;
  final num lastMonthFoodPrice;
  final num lastMonthPlayPrice;
  final num lastMonthLifePrice;
  const BarChartDraw(
      {required this.monthFoodPrice,
      required this.monthPlayPrice,
      required this.monthLifePrice,
      required this.lastMonthFoodPrice,
      required this.lastMonthPlayPrice,
      required this.lastMonthLifePrice,
      super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
        child: SizedBox(
          width: screenWidth * 0.8,
          height: screenWidth * 0.95 * 0.65,
          child: BarChart(
            BarChartData(
              borderData: FlBorderData(
                border: const Border(
                  top: BorderSide.none,
                  right: BorderSide.none,
                  left: BorderSide(width: 1),
                  bottom: BorderSide(width: 1),
                ),
              ),
              titlesData: FlTitlesData(
                  topTitles: const AxisTitles(
                      sideTitles: SideTitles(
                    showTitles: false,
                  )),
                  bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                    showTitles: true,
                    interval: 1.0,
                    reservedSize: 42.0,
                    getTitlesWidget: bottomTitlesWidgets,
                  ))),
              groupsSpace: 10,
              barGroups: [
                BarChartGroupData(x: 1, barRods: [
                  BarChartRodData(
                      toY: lastMonthFoodPrice.toDouble(),
                      width: 15,
                      color: Colors.red),
                  BarChartRodData(
                      toY: monthFoodPrice.toDouble(),
                      width: 15,
                      color: Colors.red),
                ]),
                BarChartGroupData(x: 2, barRods: [
                  BarChartRodData(
                    toY: lastMonthPlayPrice.toDouble(),
                    width: 15,
                    color: const Color(0xFFFFAE35),
                  ),
                  BarChartRodData(
                      toY: monthPlayPrice.toDouble(),
                      width: 15,
                      color: const Color(0xFFFFAE35)),
                ]),
                BarChartGroupData(x: 3, barRods: [
                  BarChartRodData(
                      toY: lastMonthLifePrice.toDouble(),
                      width: 15,
                      color: const Color(0xFFFDD609)),
                  BarChartRodData(
                      toY: monthLifePrice.toDouble(),
                      width: 15,
                      color: const Color(0xFFFDD609)),
                ]),
              ],
            ),
          ),
        ));
  }

  Widget bottomTitlesWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff68737d),
      fontWeight: FontWeight.bold,
      fontSize: 16.0,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('食費', style: style);
        break;
      case 2:
        text = const Text('遊び', style: style);
        break;
      case 3:
        text = const Text('生活費', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }
}
