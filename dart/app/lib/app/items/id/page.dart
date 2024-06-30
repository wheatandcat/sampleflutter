import 'package:flutter/material.dart';
import 'package:stockkeeper/components/background/background.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stockkeeper/graphql/item.gql.dart';
import 'package:stockkeeper/components/appBar/common.dart';
import 'package:stockkeeper/features/item/components/input.dart';
import 'package:stockkeeper/utils/graphql.dart';
import 'package:stockkeeper/graphql/updateItem.gql.dart';
import 'package:stockkeeper/graphql/schema.graphql.dart';
import 'package:stockkeeper/components/loading/loading.dart';

class ItemDetail extends HookWidget {
  final int id;
  final void Function() onCallback;

  const ItemDetail({super.key, required this.id, required this.onCallback});

  @override
  Widget build(BuildContext context) {
    final queryResult = useQuery$Item(
        Options$Query$Item(variables: Variables$Query$Item(id: id)));

    final result = queryResult.result;

    if (result.isLoading) {
      return const Loading();
    }

    final Query$Item$item item = extractGraphQLData(
      data: result.data,
      fieldName: "item",
      fromJson: Query$Item$item.fromJson,
    );

    final mutationHookResult =
        useMutation$UpdateItem(WidgetOptions$Mutation$UpdateItem(
      onCompleted: (Map<String, dynamic>? data, Mutation$UpdateItem? result) {
        onCallback();
        Navigator.pop(context);
      },
      onError: (error) {
        debugPrint(error.toString());
      },
    ));

    onPressed(InputItem input) async {
      final Input$UpdateItem p = Input$UpdateItem(
        id: id,
        categoryId: int.parse(item.categoryId),
        imageURL: input.imageURL,
        name: input.name,
        stock: input.stock,
        order: input.order,
      );

      mutationHookResult.runMutation(Variables$Mutation$UpdateItem(input: p));
    }

    return BackgroundImage(
        child: Scaffold(
      appBar: const CommonAppBar(title: ""),
      body: Input(
          loading: mutationHookResult.result.isLoading,
          onPressed: onPressed,
          buttonText: "保存",
          defaultValue: InputItem(
            name: "",
            imageURL: item.imageURL,
            stock: item.stock,
            order: item.order,
          )),
    ));
  }
}
