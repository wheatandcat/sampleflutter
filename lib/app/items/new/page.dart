import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sampleflutter/components/appBar/common.dart';
import 'package:sampleflutter/graphql/createItem.gql.dart';
import 'package:sampleflutter/components/item/input.dart';
import 'package:sampleflutter/graphql/schema.graphql.dart';

class NewItem extends HookWidget {
  final void Function() onCallback;

  const NewItem({super.key, required this.onCallback});

  @override
  Widget build(BuildContext context) {
    final mutationHookResult =
        useMutation$CreateItem(WidgetOptions$Mutation$CreateItem(
      onCompleted: (Map<String, dynamic>? data, Mutation$CreateItem? result) {
        onCallback();
        Navigator.pop(context);
      },
      onError: (error) {
        debugPrint(error.toString());
      },
    ));

    onPressed(InputItem input) async {
      final Input$NewItem p = Input$NewItem(
        categoryId: 1,
        name: input.name,
        stock: input.stock,
        expirationDate: input.expirationDate,
        order: input.order,
      );

      mutationHookResult.runMutation(Variables$Mutation$CreateItem(input: p));
    }

    return Scaffold(
      appBar: const CommonAppBar(title: ""),
      body: Input(
        onPressed: onPressed,
      ),
    );
  }
}
