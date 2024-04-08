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
  var pullDownText = "";

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
      const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          '項目',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        SizedBox(width: 50),
        DropdownButtonMenu(),
      ]),
      const Padding(padding: EdgeInsets.only(top: 75)),
      ElevatedButton.icon(
        onPressed: () {
          
        },
        icon: const Icon(
          Icons.pan_tool_alt,
          color: Color.fromARGB(255, 0, 30, 255),
        ),
        label: const Text(
          '登録',
          style: TextStyle(
            fontSize: 17,
            color: Color.fromARGB(255, 0, 30, 255),
          ),
        ),
        style: TextButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 167, 215, 254),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
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
  const DropdownButtonMenu({super.key});

  @override
  State<DropdownButtonMenu> createState() => _DropdownButtonMenuState();
}

class _DropdownButtonMenuState extends State<DropdownButtonMenu> {
  String isSelectedValue = '食費';

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: [
        DropdownMenuItem(
          value: '食費',
          child: Row(children: [
            Container(
              width: 25,
              height: 25,
              color: Colors.red,
            ),
            const Padding(padding: EdgeInsets.only(left: 20)),
            const Text(
              '食費',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ]),
        ),
        DropdownMenuItem(
          value: '遊び',
          child: Row(
            children: [
              Container(
                width: 25,
                height: 25,
                color: const Color(0xFFFFAE35),
              ),
              const Padding(padding: EdgeInsets.only(left: 20)),
              const Text(
                '遊び',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        DropdownMenuItem(
          value: '生活費',
          child: Row(children: [
            Container(
              width: 25,
              height: 25,
              color: const Color(0xFFFDD609),
            ),
            const Padding(padding: EdgeInsets.only(left: 20)),
            const Text(
              '生活費',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ]),
        ),
      ],
      value: isSelectedValue,
      onChanged: (String? value) {
        _MyHomePageState().pullDownText = isSelectedValue;
        setState(() {
          isSelectedValue = value!;
        });
      },
    );
  }
}
