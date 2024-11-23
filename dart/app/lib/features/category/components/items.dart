import 'package:flutter/material.dart';
import 'package:stockkeeper/graphql/category.gql.dart';
import 'package:stockkeeper/features/category/components/card.dart';
import 'package:stockkeeper/features/category/components/newItem.dart';
import 'package:stockkeeper/features/item/components/card.dart';
import 'package:stockkeeper/utils/style.dart';

class CategoryItems extends StatelessWidget {
  final List<Query$Category$items> items;
  final String categoryName;
  final int categoryId;
  final void Function() onNewItem;
  final void Function() onRefetch;
  final void Function(int itemId) onDelete;

  const CategoryItems({
    super.key,
    required this.categoryName,
    required this.categoryId,
    required this.items,
    required this.onNewItem,
    required this.onRefetch,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(left: Spacing.md, right: Spacing.md),
            child: CategoryCard(name: categoryName)),
        Expanded(
          child: (items.isEmpty)
              ? Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(Spacing.md),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            padding: const EdgeInsets.only(
                              left: Spacing.md,
                            ),
                            margin: const EdgeInsets.all(0),
                            width: 110,
                            height: 100,
                            child: CategoryNewItem(
                              categoryId: categoryId,
                              onCallback: () => onNewItem(),
                            )),
                        const Padding(
                            padding: EdgeInsets.only(
                                left: Spacing.md, top: Spacing.lg),
                            child: Text(
                              'OK！\n次は部屋のアイテムを\n登録してみましょう。',
                              style: TextStyle(
                                  fontSize: FontSize.lg,
                                  fontWeight: FontWeight.bold),
                            )),
                      ]))
              : GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                  padding: const EdgeInsets.all(Spacing.md),
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                  children: List.generate(items.length + 1, (index) {
                    if (index == 0) {
                      return Container(
                          padding: const EdgeInsets.only(
                            right: 24,
                            left: Spacing.md,
                            bottom: Spacing.xl,
                          ),
                          margin: const EdgeInsets.only(top: 0),
                          width: 50,
                          height: 50,
                          child: CategoryNewItem(
                            categoryId: categoryId,
                            onCallback: () => onNewItem(),
                          ));
                    }

                    final item = items[index - 1];

                    return Container(
                        padding: const EdgeInsets.only(
                            right: Spacing.md, left: Spacing.md),
                        child: ItemCard(
                          id: item.id,
                          name: item.name,
                          imageURL: item.imageURL,
                          stock: item.stock,
                          onRefetch: () {
                            onRefetch();
                          },
                          onDelete: () {
                            onDelete(int.tryParse(item.id) ?? 0);
                          },
                        ));
                  })),
        ),
      ],
    );
  }
}
