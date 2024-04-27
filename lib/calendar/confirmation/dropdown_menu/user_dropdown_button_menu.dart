import 'package:flutter/material.dart';

class UserDropdownButtonMenu extends StatefulWidget {
  final String currentUser;
  final Function(String value) notifyParent;
  const UserDropdownButtonMenu(
      {super.key, required this.currentUser, required this.notifyParent});

  @override
  State<UserDropdownButtonMenu> createState() => _UserDropdownButtonMenuState();
}

class _UserDropdownButtonMenuState extends State<UserDropdownButtonMenu> {
  String? isSelectedValue = 'いちくん';

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: const [
        DropdownMenuItem(
          value: 'いちくん',
          child: Row(children: [
            Text(
              'いちくん',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ]),
        ),
        DropdownMenuItem(
          value: 'もえちゃん',
          child: Row(
            children: [
              Text(
                'もえちゃん',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
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
