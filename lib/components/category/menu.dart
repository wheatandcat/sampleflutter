import 'package:flutter/material.dart';
import 'package:sampleflutter/app/categories/edit/page.dart';

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
            top: 10.0,
            bottom: 40.0,
            left: 10.0,
            right: 10.0), // 上に20、下に10の余白を追加
        child: Wrap(
          children: <Widget>[
            ListTile(
              title: Text(name,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('カテゴリー名を変更する'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/categories/edit',
                    arguments: CategoryEdit(
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
                showDialog(
                  context: context,
                  builder: (BuildContext contextDialog) {
                    return AlertDialog(
                      title: const Text('確認'),
                      content: Text('$nameを削除しますか？'),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('キャンセル'),
                          onPressed: () {
                            Navigator.of(contextDialog).pop();
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text('削除',
                              style: TextStyle(color: Colors.red)),
                          onPressed: () {
                            onDelete(id);
                            Navigator.of(contextDialog).pop();
                            Navigator.of(context).pop();
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
