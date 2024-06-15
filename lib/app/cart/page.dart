import 'package:flutter/material.dart';
import 'package:sampleflutter/components/background/background.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sampleflutter/graphql/itemAll.gql.dart';
import 'package:sampleflutter/components/appBar/common.dart';
import 'package:sampleflutter/utils/graphql.dart';
import 'package:sampleflutter/features/cart/item.dart';
import 'package:sampleflutter/components/button/button.dart';

class CategoryItem {
  String name;
  List<Query$ItemAll$itemAll> items;

  CategoryItem(this.name, this.items);
}

class Cart extends HookWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    final qia = useQuery$ItemAll(Options$Query$ItemAll());

    if (qia.result.isLoading) {
      return const Scaffold(
        appBar: CommonAppBar(title: ""),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final List<Query$ItemAll$itemAll> items = extractGraphQLDataList(
      data: qia.result.data,
      fieldName: "itemAll",
      fromJson: Query$ItemAll$itemAll.fromJson,
    );

    List<String> categoryIds =
        items.map((item) => item.categoryId).toSet().toList();

    List<CategoryItem> categoryItems = categoryIds.map((categoryId) {
      List<Query$ItemAll$itemAll> itemsInCategory =
          items.where((item) => item.categoryId == categoryId).toList();
      Query$ItemAll$itemAll? category =
          items.firstWhere((item) => item.categoryId == categoryId);
      return CategoryItem(category.category?.name ?? "", itemsInCategory);
    }).toList();

    return BackgroundImage(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const CommonAppBar(title: ""),
        body: ListView.builder(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          itemCount: categoryItems.length + 1,
          itemBuilder: (context, index) {
            if (index == categoryItems.length) {
              return Container(
                margin: const EdgeInsets.only(bottom: 100),
                height: 100,
                child: Center(
                  child: Button(
                      title: "リストを作成する",
                      onPressed: () =>
                          Navigator.pushNamed(context, "/cart/create")),
                ),
              );
            }

            return Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    categoryItems[index].name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                GridView.builder(
                  padding: const EdgeInsets.only(top: 20),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                  ),
                  itemCount: categoryItems[index].items.length,
                  itemBuilder: (context, index2) {
                    final item = categoryItems[index].items[index2];
                    return Item(stock: item.stock, imageURL: item.imageURL);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
