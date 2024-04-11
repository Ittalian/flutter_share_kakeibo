import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dropdown_button_menu.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  int price = 0;
  String category = "食費";
  String insertMessage = "";
  int month = 0;
  int day = 0;

  void setCategory(String value) {
    setState(() {
      category = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.only(top: 50),
        child: Image.asset('images/registration.jpg'),
      ),
      Container(
        margin: const EdgeInsets.fromLTRB(50, 30, 60, 0),
        child: TextField(
          maxLines: 1,
          decoration: const InputDecoration(
            icon: Icon(Icons.currency_yen),
            hintText: '10000',
            labelText: '金額',
          ),
          onChanged: (value) {
            setState(() {
              price = int.parse(value);
            });
          },
          keyboardType: TextInputType.number,
        ),
      ),
      // 取得したデータの表示
      // Column(
      //   children: list.map((document) {
      //     return ListTile(
      //       title: Text('price: ${document['price']}'),
      //     );
      //   }).toList(),
      // ),
      const Padding(padding: EdgeInsets.only(top: 50)),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text(
          '項目',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        const SizedBox(width: 50),
        DropdownButtonMenu(
          currentCategory: category,
          notifyParent: setCategory,
        ),
      ]),
      const Padding(padding: EdgeInsets.only(top: 30)),
      Expanded(
          child: Container(
              margin: const EdgeInsets.fromLTRB(50, 30, 60, 0),
              child: Row(children: [
                Flexible(
                    child: TextField(
                  maxLines: 1,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.nightlight),
                    hintText: '7',
                  ),
                  onChanged: (value) {
                    setState(() {
                      month = int.parse(value);
                    });
                  },
                  keyboardType: TextInputType.number,
                )),
                const Text("月", style: TextStyle(fontSize: 20)),
                const Padding(padding: EdgeInsets.only(left: 50)),
                Flexible(
                    child: TextField(
                  maxLines: 1,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.wb_sunny),
                    hintText: '1',
                  ),
                  onChanged: (value) {
                    setState(() {
                      day = int.parse(value);
                    });
                  },
                  keyboardType: TextInputType.number,
                )),
                const Text("日",
                    style: TextStyle(
                      fontSize: 20,
                    ))
              ]))),
      const Padding(padding: EdgeInsets.only(top: 75)),
      ElevatedButton.icon(
        onPressed: () async {
          showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: const Text("登録しました"),
                actions: <Widget>[
                  TextButton(
                      child: const Text("OK"),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ],
              );
            },
          );
          // データ追加処理
          await FirebaseFirestore.instance.collection('budget').add(
            {'price': price, 'category': category, 'year': DateTime.now().year, 'month': month, 'day': day}
          );
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
      const Padding(padding: EdgeInsets.only(top: 30)),
      Text(insertMessage)
    ]);
  }
}
