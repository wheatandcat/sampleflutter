import 'package:flutter/material.dart';
import 'package:sampleflutter/components/background/background.dart';
import 'package:sampleflutter/components/appBar/common.dart';
import 'package:sampleflutter/components/icon/add.dart';
import 'package:sampleflutter/features/category/components/card.dart';
import 'package:sampleflutter/features/item/components/card.dart';
import 'package:sampleflutter/graphql/category.gql.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sampleflutter/graphql/deleteItem.gql.dart';
import 'package:sampleflutter/utils/graphql.dart';
import 'package:sampleflutter/app/items/new/page.dart';

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
      return const Scaffold(
        appBar: CommonAppBar(title: ""),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
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
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/items/new',
                            arguments: NewItem(
                              categoryId: id,
                              onCallback: () {
                                queryResult.refetch();
                              },
                            ));
                      },
                      child: const Card(
                        color: Colors.black45,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero, // Cardの角を直角にする
                        ),
                        elevation: 0,
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Center(
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                AddIcon(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }

                  final item = items[index];

                  return ItemCard(
                    id: item.id,
                    name: item.name,
                    stock: item.stock,
                    expirationDate: item.expirationDate,
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
