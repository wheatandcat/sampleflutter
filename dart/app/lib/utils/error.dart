import 'package:flutter/cupertino.dart';

Future<void> showErrorDialog(BuildContext context, String? message) async {
  return showCupertinoDialog(
    context: context,
    builder: (BuildContext contextDialog) {
      return CupertinoAlertDialog(
        title: const Text('エラー発生'),
        content: Text(message ?? "エラーが発生しました"),
        actions: <Widget>[
          CupertinoDialogAction(
            child: const Text('閉じる'),
            onPressed: () {
              Navigator.of(contextDialog).pop();
            },
          ),
        ],
      );
    },
  );
}
