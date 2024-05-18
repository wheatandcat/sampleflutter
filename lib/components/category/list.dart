import 'package:flutter/material.dart';
import 'package:sampleflutter/graphql/categories.gql.dart';
import 'package:sampleflutter/utils/style.dart';
import 'package:sampleflutter/components/icon/add.dart';
import 'package:sampleflutter/components/category/icon.dart';

class CategoryList extends StatelessWidget {
  final List<Query$Categories$categories> categories;
  final void Function(int categoryId) onPassedItem;
  final void Function(Query$Categories$categories category) onLongPressedItem;
  final void Function() onAdd;

  const CategoryList(
      {super.key,
      required this.categories,
      required this.onPassedItem,
      required this.onLongPressedItem,
      required this.onAdd});

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;

    return Container(
        width: 100,
        height: deviceHeight,
        color: Colors.brown.withOpacity(0.5),
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: SizedBox(
              width: 70,
              height: 70,
              child: ListView.builder(
                  itemCount: categories.length + 1,
                  itemBuilder: (context, index) {
                    if (index == categories.length) {
                      // 最後の要素に追加ボタンを表示
                      return FloatingActionButton(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        onPressed: () {
                          onAdd();
                        },
                        tooltip: 'Increment',
                        child: const AddIcon(),
                      );
                    }

                    return Padding(
                        padding:
                            const EdgeInsets.only(bottom: AppSpacing.large),
                        child: CategoryIcon(
                          onPressed: () =>
                              onPassedItem(int.parse(categories[index].id)),
                          onLongPressed: () =>
                              onLongPressedItem(categories[index]),
                        ));
                  }),
            )),
          ],
        ));
  }
}
