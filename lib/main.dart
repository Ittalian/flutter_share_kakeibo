import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _selectIndex = 0;

  final _pages = <Widget>[
    Column(children: [
      Expanded(
        child: Image.asset('images/title.jpg'),
      ),
      Center(
        child: Image.asset('images/home.jpg'),
      ),
    ]),
    Column(children: [
      Container(
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.only(top: 50),
        child: Image.asset('images/registration.jpg'),
      ),
      Container(
        margin: const EdgeInsets.fromLTRB(50, 80, 60, 0),
        child: const TextField(
          maxLines: 1,
          decoration: InputDecoration(
            icon: Icon(Icons.currency_yen),
            hintText: '10000',
            labelText: '金額',
          ),
        ),
      ),
      const Padding(padding: EdgeInsets.only(top: 50)),
      const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text(
          '項目',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        SizedBox(width: 50),
        DropdownButtonMenu(),
      ])
    ]),
    Column(children: [
      Container(
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.only(top: 50),
        child: Image.asset('images/calendar.jpg'),
      ),
    ]),
  ];

  void _onTapItem(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
          BottomNavigationBarItem(icon: Icon(Icons.add_chart), label: '収支登録'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: 'カレンダー'),
        ],
        currentIndex: _selectIndex,
        onTap: _onTapItem,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class DropdownButtonMenu extends StatefulWidget {
  const DropdownButtonMenu({Key? key}) : super(key: key);

  @override
  State<DropdownButtonMenu> createState() => _DropdownButtonMenuState();
}

class _DropdownButtonMenuState extends State<DropdownButtonMenu> {
  String isSelectedValue = '食費';

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: const[
        DropdownMenuItem(
          value: '食費',
          child: Text(
            '食費',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        DropdownMenuItem(
          value: '遊び',
          child: Text(
            '遊び',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        DropdownMenuItem(
          value: '生活費',
          child: Text(
            '生活費',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ],
      value: isSelectedValue,
      onChanged: (String? value) {
        setState(() {
          isSelectedValue = value!;
        });
      },
    );
  }
}
