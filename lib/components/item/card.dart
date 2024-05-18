import 'package:flutter/material.dart';
import 'package:sampleflutter/app/items/id/page.dart';

class ItemCard extends StatelessWidget {
  final String id;
  final String name;
  final int stock;
  String? expirationDate;
  final void Function() onRefetch;
  final void Function() onDelete;

  ItemCard(
      {super.key,
      required this.id,
      required this.name,
      required this.stock,
      this.expirationDate,
      required this.onRefetch,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    void _showCustomMenu(BuildContext context) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
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
                    leading: const Icon(Icons.delete),
                    title: const Text('アイテムを削除する'),
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
                                  Navigator.of(contextDialog).pop();
                                  Navigator.of(context).pop();
                                  onDelete();
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
        },
      );
    }

    return InkWell(
      onLongPress: () => _showCustomMenu(context),
      onTap: () => Navigator.pushNamed(context, '/items/id',
          arguments: ItemDetail(
              id: int.parse(id),
              onCallback: () {
                onRefetch();
              })),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              'https://via.placeholder.com/100',
              width: 100,
              height: 100,
            ), // 画像URLを指定
          ),
          Text('$stock個',
              style: const TextStyle(
                  fontSize: 21,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
