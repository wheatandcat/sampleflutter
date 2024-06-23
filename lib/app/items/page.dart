import 'package:flutter/material.dart';
import 'package:stockkeeper/components/background/background.dart';
import 'package:stockkeeper/components/appBar/common.dart';
import 'package:stockkeeper/features/category/components/card.dart';
import 'package:stockkeeper/features/item/components/card.dart';
import 'package:stockkeeper/features/item/components/addButton.dart';
import 'package:stockkeeper/graphql/category.gql.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stockkeeper/graphql/deleteItem.gql.dart';
import 'package:stockkeeper/utils/graphql.dart';
import 'package:stockkeeper/app/items/new/page.dart';
import 'package:stockkeeper/components/loading/loading.dart';

class Items extends HookWidget {
  final int id;

  const Items({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final queryResult = useQuery$Category(
        Options$Query$Category(variables: Variables$Query$Category(id: id)));

    final result = queryResult.result;

    final mutationHookResult =
        useMutation$DeleteItem(WidgetOptions$Mutation$DeleteItem(
      onCompleted: (Map<String, dynamic>? data, Mutation$DeleteItem? result) {
        queryResult.refetch();
      },
    ));

    if (result.isLoading) {
      return const Loading();
    }

    final Query$Category$category category = extractGraphQLData(
      data: result.data,
      fieldName: "category",
      fromJson: Query$Category$category.fromJson,
    );

    final List<Query$Category$items> items = extractGraphQLDataList(
      data: result.data,
      fieldName: "items",
      fromJson: Query$Category$items.fromJson,
    );

    return BackgroundImage(
        child: Scaffold(
      appBar: const CommonAppBar(title: ""),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: CategoryCard(name: category.name)),
          Expanded(
            child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                padding: const EdgeInsets.all(10),
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                children: List.generate(items.length + 1, (index) {
                  if (index == items.length) {
                    return ItemAddButton(onAdd: () {
                      Navigator.pushNamed(context, '/items/new',
                          arguments: NewItem(
                            categoryId: id,
                            onCallback: () {
                              queryResult.refetch();
                            },
                          ));
                    });
                  }

                  final item = items[index];

                  return ItemCard(
                    id: item.id,
                    name: item.name,
                    stock: item.stock,
                    onRefetch: () {
                      queryResult.refetch();
                    },
                    onDelete: () {
                      mutationHookResult
                          .runMutation(Variables$Mutation$DeleteItem(
                        id: int.tryParse(item.id) ?? 0,
                      ));
                    },
                  );
                })),
          ),
        ],
      ),
    ));
  }
}
