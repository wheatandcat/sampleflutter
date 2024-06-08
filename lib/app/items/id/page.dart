import 'package:flutter/material.dart';
import 'package:sampleflutter/components/background/background.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sampleflutter/graphql/item.gql.dart';
import 'package:sampleflutter/components/appBar/common.dart';
import 'package:sampleflutter/features/item/components/input.dart';
import 'package:sampleflutter/utils/graphql.dart';
import 'package:sampleflutter/graphql/updateItem.gql.dart';
import 'package:sampleflutter/graphql/schema.graphql.dart';

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
      return const Scaffold(
        appBar: CommonAppBar(title: ""),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
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
          onPressed: onPressed,
          buttonText: "保存",
          defaultValue: InputItem(
            name: "",
            stock: item.stock,
            order: item.order,
          )),
    ));
  }
}
