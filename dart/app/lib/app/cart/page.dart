import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stockkeeper/components/background/background.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stockkeeper/components/appBar/common.dart';
import 'package:stockkeeper/features/cart/createList.dart';
import 'package:stockkeeper/graphql/carts.gql.dart';
import 'package:stockkeeper/components/button/button.dart';
import 'package:stockkeeper/utils/graphql.dart';
import 'package:stockkeeper/features/cart/item.dart';
import 'package:stockkeeper/graphql/buying.gql.dart';
import 'package:flutter/cupertino.dart';
import 'package:stockkeeper/components/loading/loading.dart';
import 'package:stockkeeper/utils/style.dart';

class Cart extends HookWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    final qc = useQuery$Carts(Options$Query$Carts());
    if (qc.result.isLoading) {
      return const Loading();
    }

    final List<Query$Carts$carts> carts = extractGraphQLDataList(
      data: qc.result.data,
      fieldName: "carts",
      fromJson: Query$Carts$carts.fromJson,
    );

    if (carts.isEmpty) {
      return BackgroundImage(
        child: Scaffold(
          appBar: const CommonAppBar(title: ""),
          extendBodyBehindAppBar: true,
          body: CreateList(onRefetch: () {
            qc.refetch();
          }),
        ),
      );
    }

    List<String> categoryIds =
        carts.map((cart) => cart.item?.category?.id ?? "").toSet().toList();
    List<CategoryItem> categoryItems = categoryIds.map((categoryId) {
      List<Query$Carts$carts> itemsInCategory =
          carts.where((cart) => cart.item?.category?.id == categoryId).toList();
      List<CategoryItemDetail> itemsInCategoryDetail = itemsInCategory
          .map((cart) => CategoryItemDetail(
                id: cart.item?.id ?? "",
                imageURL: cart.item?.imageURL,
                categoryId: cart.item?.category?.id ?? "",
                stock: cart.item?.stock ?? 0,
                addCount: cart.quantity,
              ))
          .toList();

      Query$Carts$carts? category =
          carts.firstWhere((cart) => cart.item?.category?.id == categoryId);
      return CategoryItem(
          category.item?.category?.name ?? "", itemsInCategoryDetail);
    }).toList();

    final mutationHookResult = useMutation$Buying(WidgetOptions$Mutation$Buying(
      onCompleted: (Map<String, dynamic>? data, Mutation$Buying? result) async {
        qc.refetch();
      },
    ));

    Future<void> onBuying() async {
      showCupertinoDialog(
        context: context,
        builder: (BuildContext contextDialog) {
          return CupertinoAlertDialog(
            title: const Text('買い物を完了しますか？'),
            content: const Text('ストックに追加されます'),
            actions: <Widget>[
              CupertinoDialogAction(
                child: const Text('キャンセル'),
                onPressed: () {
                  contextDialog.pop();
                },
              ),
              CupertinoDialogAction(
                child: const Text(
                  'OK',
                  style: TextStyle(color: AppColors.error),
                ),
                onPressed: () {
                  mutationHookResult.runMutation();
                  contextDialog.pop();
                },
              ),
            ],
          );
        },
      );
    }

    return BackgroundImage(
      child: Scaffold(
          appBar: const CommonAppBar(title: ""),
          extendBodyBehindAppBar: true,
          body: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: Spacing.xl2),
                // ボタンの高さ分のパディングを追加
                child: ListView.builder(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top,
                      bottom: Spacing.xl2),
                  itemCount: categoryItems.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: Spacing.md),
                          child: Text(
                            categoryItems[index].name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: FontSize.lg,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        GridView.builder(
                          padding: const EdgeInsets.only(top: Spacing.xl),
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
                              disabled: true,
                              addCount: item.addCount,
                              stock: item.stock,
                              imageURL: item.imageURL,
                              onPressed: (int stock) => {},
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
                      top: BorderSide(
                          color: AppColors.bg, width: BorderWidth.sm),
                    ),
                    image: DecorationImage(
                      image: AssetImage('images/background.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: 120,
                  padding: const EdgeInsets.only(bottom: Spacing.md),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Button(
                          title: "買い物完了！",
                          onPressed: onBuying,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: Spacing.md),
                          child: Text(
                            "ストックに追加されます",
                            style: TextStyle(
                              fontSize: FontSize.sm,
                            ),
                          ),
                        )
                      ]),
                ),
              ),
            ],
          )),
    );
  }
}
