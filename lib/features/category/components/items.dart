import 'package:flutter/material.dart';
import 'package:sampleflutter/graphql/category.gql.dart';
import 'package:sampleflutter/features/category/components/card.dart';
import 'package:sampleflutter/features/category/components/newItem.dart';
import 'package:sampleflutter/features/item/components/card.dart';

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
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: CategoryCard(name: categoryName)),
        Expanded(
          child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              padding: const EdgeInsets.all(10),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              children: List.generate(items.length + 1, (index) {
                if (index == items.length) {
                  return Padding(
                      padding:
                          const EdgeInsets.only(right: 20, left: 5, bottom: 28),
                      child: CategoryNewItem(
                        categoryId: categoryId,
                        onCallback: () => onNewItem(),
                      ));
                }

                final item = items[index];

                return Container(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: ItemCard(
                      id: item.id,
                      name: item.name,
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
