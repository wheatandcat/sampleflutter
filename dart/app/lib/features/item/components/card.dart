import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stockkeeper/app/items/id/page.dart';
import 'package:flutter/cupertino.dart';
import 'package:stockkeeper/utils/style.dart';

class ItemCard extends StatelessWidget {
  final String id;
  final String name;
  String? imageURL;
  final int stock;
  final void Function() onRefetch;
  final void Function() onDelete;

  ItemCard(
      {super.key,
      required this.id,
      required this.name,
      this.imageURL,
      required this.stock,
      required this.onRefetch,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    void showCustomMenu(BuildContext context) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Padding(
              padding: const EdgeInsets.only(
                  top: Spacing.md,
                  bottom: Spacing.xl,
                  left: Spacing.md,
                  right: Spacing.md), // 上に20、下に10の余白を追加
              child: Wrap(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.delete),
                    title: const Text('アイテムを削除する'),
                    onTap: () {
                      showCupertinoDialog(
                        context: context,
                        builder: (BuildContext contextDialog) {
                          return CupertinoAlertDialog(
                            title: const Text('確認'),
                            content: const Text('本当に削除しますか？'),
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
                                  onDelete();
                                  contextDialog.pop();
                                  context.pop();
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InkWell(
          onLongPress: () => showCustomMenu(context),
          onTap: () => context.push('/items/$id',
              extra: ItemDetail(
                  id: int.parse(id),
                  onCallback: () {
                    onRefetch();
                  })),
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.bg, borderRadius: BorderRadius.circular(10)),
            width: 100,
            height: 100,
            child: imageURL != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      imageURL!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ), // 画像URLを指定
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'images/noimage.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ), // 画像URLを指定
                  ),
          ),
        ),
        Text('$stock個',
            style: const TextStyle(
                fontSize: FontSize.lg, fontWeight: FontWeight.bold)),
        const SizedBox(width: 20),
      ],
    );
  }
}
