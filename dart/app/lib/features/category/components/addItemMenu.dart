import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stockkeeper/utils/style.dart';

class AddItemMenu extends StatelessWidget {
  final void Function() onBarcode;
  final void Function() onAdd;

  const AddItemMenu({super.key, required this.onBarcode, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
            top: Spacing.md,
            bottom: Spacing.xl,
            left: Spacing.md,
            right: Spacing.md), // 上に20、下に10の余白を追加
        child: Wrap(
          children: <Widget>[
            const ListTile(
              title: Text("操作",
                  style: TextStyle(
                      fontSize: FontSize.lg, fontWeight: FontWeight.bold)),
            ),
            ListTile(
              leading: const Icon(Icons.qr_code_scanner),
              title: const Text('バーコードを読み込む'),
              onTap: () {
                context.pop();
                onBarcode();
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('手動で入力'),
              onTap: () {
                context.pop();
                onAdd();
              },
            ),
          ],
        ));
  }
}
