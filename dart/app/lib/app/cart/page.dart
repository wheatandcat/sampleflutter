import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stockkeeper/components/background/background.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stockkeeper/components/appBar/common.dart';
import 'package:stockkeeper/features/cart/createList.dart';
import 'package:stockkeeper/graphql/carts.gql.dart';
import 'package:stockkeeper/utils/graphql.dart';
import 'package:stockkeeper/graphql/buying.gql.dart';
import 'package:stockkeeper/features/cart/page.dart';
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
        body: CartPage(
          categoryItems: categoryItems,
          onBuying: onBuying,
        ),
      ),
    );
  }
}
