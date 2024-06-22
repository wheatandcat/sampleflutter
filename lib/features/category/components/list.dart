import 'package:flutter/material.dart';
import 'package:stockkeeper/graphql/categories.gql.dart';
import 'package:stockkeeper/utils/style.dart';
import 'package:stockkeeper/components/icon/add.dart';
import 'package:stockkeeper/features/category/components/icon.dart';
import 'package:stockkeeper/components/appBar/menu.dart';

class CategoryList extends StatelessWidget {
  final List<Query$Categories$categories> categories;
  final int? categoryId;
  final void Function(int categoryId) onPassedItem;
  final void Function(Query$Categories$categories category) onLongPressedItem;
  final void Function() onAdd;

  const CategoryList(
      {super.key,
      this.categoryId,
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
        padding: const EdgeInsets.only(top: 10),
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: SizedBox(
              width: 100,
              height: 60,
              child: ListView.builder(
                  itemCount: categories.length + 1,
                  itemBuilder: (context, index) {
                    if (index == categories.length) {
                      // 最後の要素に追加ボタンを表示
                      return FloatingActionButton(
                        heroTag: "add",
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
                          selected:
                              categoryId == int.parse(categories[index].id),
                          imageURL: categories[index].imageURL,
                          onPressed: () =>
                              onPassedItem(int.parse(categories[index].id)),
                          onLongPressed: () =>
                              onLongPressedItem(categories[index]),
                        ));
                  }),
            )),
            Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: FloatingActionButton(
                  heroTag: "cart",
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  onPressed: () {
                    Navigator.pushNamed(context, '/cart');
                  },
                  tooltip: 'Increment',
                  child: const Icon(
                    Icons.shopping_basket_sharp,
                    color: Colors.white,
                    size: 40,
                  ),
                )),
            Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: FloatingActionButton(
                  heroTag: "setting",
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  onPressed: () {
                    showSettingDialog(context);
                  },
                  tooltip: 'Increment',
                  child: const Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 40,
                  ),
                )),
          ],
        ));
  }
}

void showSettingDialog(BuildContext context) {
  showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return const AppBarMenu();
    },
  );
}
