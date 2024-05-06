import 'package:flutter/material.dart';
import 'package:sampleflutter/components/background/background.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sampleflutter/graphql/item.gql.dart';
import 'package:sampleflutter/components/appBar/common.dart';
import 'package:sampleflutter/components/item/input.dart';
import 'package:sampleflutter/utils/graphql.dart';

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

    onPressed(InputItem input) async {
      queryResult.refetch();
    }

    return BackgroundImage(
        child: Scaffold(
      appBar: const CommonAppBar(title: ""),
      body: Input(
          onPressed: onPressed,
          buttonText: "更新する",
          defaultValue: InputItem(
            name: "",
            stock: item.stock,
            expirationDate: item.expirationDate,
            order: item.order,
          )),
    ));
  }
}
