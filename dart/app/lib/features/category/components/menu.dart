import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stockkeeper/app/categories/edit/page.dart';
import 'package:flutter/cupertino.dart';
import 'package:stockkeeper/utils/style.dart';

class CategoryMenu extends StatelessWidget {
  final String id;
  final String name;
  final void Function() onEditCallback;
  final void Function(String categoryId) onDelete;

  const CategoryMenu(
      {super.key,
      required this.id,
      required this.name,
      required this.onEditCallback,
      required this.onDelete});

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
            ListTile(
              title: Text(name,
                  style: const TextStyle(
                      fontSize: FontSize.lg, fontWeight: FontWeight.bold)),
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('カテゴリーを編集する'),
              onTap: () {
                context.pop();
                context.push('/categories/edit',
                    extra: CategoryEdit(
                      id: int.tryParse(id) ?? 0,
                      name: name,
                      onCallback: () {
                        onEditCallback();
                      },
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text('カテゴリーを削除する'),
              onTap: () {
                showCupertinoDialog(
                  context: context,
                  builder: (BuildContext contextDialog) {
                    return CupertinoAlertDialog(
                      title: const Text('確認'),
                      content: Text('$nameを削除しますか？'),
                      actions: <Widget>[
                        CupertinoDialogAction(
                          child: const Text('キャンセル'),
                          onPressed: () {
                            contextDialog.pop();
                          },
                        ),
                        CupertinoDialogAction(
                          child: const Text(
                            '削除',
                            style: TextStyle(color: AppColors.error),
                          ),
                          onPressed: () {
                            onDelete(id);
                            contextDialog.pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ));
  }
}
