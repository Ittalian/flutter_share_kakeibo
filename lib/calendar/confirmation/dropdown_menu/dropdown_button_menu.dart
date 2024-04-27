import 'package:flutter/material.dart';

class DropdownButtonMenu extends StatefulWidget {
  final String currentCategory;
  final Function(String value) notifyParent;
  const DropdownButtonMenu(
      {super.key, required this.currentCategory, required this.notifyParent});

  @override
  State<DropdownButtonMenu> createState() => _DropdownButtonMenuState();
}

class _DropdownButtonMenuState extends State<DropdownButtonMenu> {
  String? isSelectedValue = '食費';

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: [
        DropdownMenuItem(
          value: '食費',
          child: Row(children: [
            Container(
              width: 20,
              height: 20,
              color: Colors.red,
            ),
            const Padding(padding: EdgeInsets.only(left: 15)),
            const Text(
              '食費',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ]),
        ),
        DropdownMenuItem(
          value: '交際費',
          child: Row(
            children: [
              Container(
                width: 20,
                height: 20,
                color: const Color(0xFFFFAE35),
              ),
              const Padding(padding: EdgeInsets.only(left: 15)),
              const Text(
                '交際費',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        DropdownMenuItem(
          value: '日用品',
          child: Row(children: [
            Container(
              width: 20,
              height: 20,
              color: const Color(0xFFFDD609),
            ),
            const Padding(padding: EdgeInsets.only(left: 15)),
            const Text(
              '日用品',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ]),
        ),
        DropdownMenuItem(
          value: '趣味費',
          child: Row(children: [
            Container(
              width: 20,
              height: 20,
              color: const Color(0xFFFDD609),
            ),
            const Padding(padding: EdgeInsets.only(left: 15)),
            const Text(
              '趣味費',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ]),
        ),
        DropdownMenuItem(
          value: '被服費',
          child: Row(children: [
            Container(
              width: 20,
              height: 20,
              color: const Color(0xFFFDD609),
            ),
            const Padding(padding: EdgeInsets.only(left: 15)),
            const Text(
              '被服費',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ]),
        ),
        DropdownMenuItem(
          value: '交通費',
          child: Row(children: [
            Container(
              width: 20,
              height: 20,
              color: const Color(0xFFFDD609),
            ),
            const Padding(padding: EdgeInsets.only(left: 15)),
            const Text(
              '交通費',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ]),
        ),
        DropdownMenuItem(
          value: '美容費',
          child: Row(children: [
            Container(
              width: 20,
              height: 20,
              color: const Color(0xFFFDD609),
            ),
            const Padding(padding: EdgeInsets.only(left: 15)),
            const Text(
              '美容費',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ]),
        ),
        DropdownMenuItem(
          value: '特別費',
          child: Row(children: [
            Container(
              width: 20,
              height: 20,
              color: const Color(0xFFFDD609),
            ),
            const Padding(padding: EdgeInsets.only(left: 15)),
            const Text(
              '特別費',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ]),
        ),
        DropdownMenuItem(
          value: 'その他',
          child: Row(children: [
            Container(
              width: 20,
              height: 20,
              color: const Color(0xFFFDD609),
            ),
            const Padding(padding: EdgeInsets.only(left: 15)),
            const Text(
              'その他',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ]),
        ),
      ],
      value: isSelectedValue,
      onChanged: (String? value) {
        setState(() {
          isSelectedValue = value!;
        });
        widget.notifyParent(value!);
      },
    );
  }
}
