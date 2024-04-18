import 'package:flutter/material.dart';

class LoadingDialog extends StatefulWidget {
  const LoadingDialog({super.key});

  @override
  State<LoadingDialog> createState() => _LoadingDialogState();

  static void show(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const PopScope(
            canPop: false,
            child: LoadingDialog(),
          );
        });
  }

  static void hide(BuildContext context) {
    Navigator.of(context).pop();
  }
}

class _LoadingDialogState extends State<LoadingDialog> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 150,
        height: 150,
        child: AlertDialog(
          // backgroundColor: Colors.green, // MEMO: 背景色の指定
          alignment: Alignment.center,
          contentPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.zero,
          content: _dialogContent(),
        ),
      ),
    );
  }

  // ダイアログ内に表示するWidget
  Widget _dialogContent() {
    return const Column(
      children: [
        Spacer(),
        CircularProgressIndicator(),
        Spacer(),
        Text('ちょっとまってね'),
        Spacer(),
      ],
    );
  }
}
