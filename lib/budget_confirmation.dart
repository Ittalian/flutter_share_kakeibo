import 'package:flutter/material.dart';
import 'package:share_kakeibo/calendar.dart';

class BudgetConfirmation extends StatefulWidget {
  final int price;
  final String category;
  final int month;
  final int day;
  const BudgetConfirmation({required this.price, required this.category, required this.month, required this.day, super.key});
  @override
  State<BudgetConfirmation> createState() => _BudgetConfirmationState();
}

class _BudgetConfirmationState extends State<BudgetConfirmation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
          Container(
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.only(top: 50),
            child: Image.asset('images/confirmation.jpg'),
          ),
          const Text("うぇい")
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
            )));
  }
}
