import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stockkeeper/graphql/itemAll.gql.dart';
import 'package:stockkeeper/components/appBar/common.dart';
import 'package:stockkeeper/graphql/schema.graphql.dart';
import 'package:stockkeeper/utils/graphql.dart';
import 'package:stockkeeper/features/cart/item.dart';
import 'package:stockkeeper/components/button/button.dart';
import 'package:stockkeeper/graphql/addCarts.gql.dart';

class CategoryItemDetail {
  String id;
  String? imageURL;
  String categoryId;
  int stock;
  int addCount;

  CategoryItemDetail(
      {required this.id,
      this.imageURL,
      required this.categoryId,
      required this.stock,
      this.addCount = 0});
}

class CategoryItem {
  String name;
  List<CategoryItemDetail> items;

  CategoryItem(this.name, this.items);
}

class CartItem {
  int itemId;
  int quantity;

  CartItem({required this.itemId, required this.quantity});
}

class CreateList extends HookWidget {
  final void Function() onRefetch;

  const CreateList({super.key, required this.onRefetch});

  @override
  Widget build(BuildContext context) {
    final qia = useQuery$ItemAll(Options$Query$ItemAll());
    final cartItems = useState<List<CartItem>>([]);

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
      List<CategoryItemDetail> itemsInCategoryDetail = itemsInCategory
          .map((item) => CategoryItemDetail(
              id: item.id,
              imageURL: item.imageURL,
              categoryId: item.categoryId,
              stock: item.stock))
          .toList();

      Query$ItemAll$itemAll? category =
          items.firstWhere((item) => item.categoryId == categoryId);
      return CategoryItem(category.category?.name ?? "", itemsInCategoryDetail);
    }).toList();

    final mutationHookResult =
        useMutation$AddCarts(WidgetOptions$Mutation$AddCarts(
      onCompleted:
          (Map<String, dynamic>? data, Mutation$AddCarts? result) async {
        onRefetch();
      },
    ));

    void onAdd(CartItem item) {
      final itemIds = cartItems.value.map((v) => v.itemId).toList();
      final ok = itemIds.contains(item.itemId);
      if (ok) {
        final newCartItems = cartItems.value.map((v) {
          if (v.itemId == item.itemId) {
            return CartItem(itemId: v.itemId, quantity: v.quantity + 1);
          } else {
            return v;
          }
        }).toList();
        cartItems.value = newCartItems;
      } else {
        cartItems.value = [...cartItems.value, item];
      }
    }

    Future<void> onCreate() async {
      mutationHookResult.runMutation(
        Variables$Mutation$AddCarts(
          input: cartItems.value.map((v) {
            return Input$NewCart(
              itemId: v.itemId,
              quantity: v.quantity,
            );
          }).toList(),
        ),
      );
    }

    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 60.0),
          // ボタンの高さ分のパディングを追加
          child: ListView.builder(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top, bottom: 70),
            itemCount: categoryItems.length,
            itemBuilder: (context, index) {
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
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.0,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 0,
                    ),
                    itemCount: categoryItems[index].items.length,
                    itemBuilder: (context, index2) {
                      final item = categoryItems[index].items[index2];
                      return Item(
                        stock: item.stock,
                        imageURL: item.imageURL,
                        onPressed: (int stock) => {
                          onAdd(CartItem(
                              itemId: int.parse(item.id), quantity: stock))
                        },
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.white, width: 2.0),
              ),
              image: DecorationImage(
                image: AssetImage('images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
            height: 70,
            padding: const EdgeInsets.only(bottom: 8),
            child: Center(
                child: Button(
              title: "リストを作成する",
              onPressed: onCreate,
            )),
          ),
        ),
      ],
    );
  }
}
