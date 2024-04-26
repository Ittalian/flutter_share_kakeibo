import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: Image.asset('images/title.jpg'),
      ),
      Center(
        child: Image.asset('images/home.jpg'),
      ),
    ]);
  }
}
