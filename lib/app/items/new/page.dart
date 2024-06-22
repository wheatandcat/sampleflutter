import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stockkeeper/components/background/background.dart';
import 'package:stockkeeper/components/appBar/common.dart';
import 'package:stockkeeper/graphql/createItem.gql.dart';
import 'package:stockkeeper/features/item/components/input.dart';
import 'package:stockkeeper/graphql/schema.graphql.dart';

class NewItem extends HookWidget {
  final int categoryId;
  final void Function() onCallback;

  const NewItem(
      {super.key, required this.categoryId, required this.onCallback});

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
        categoryId: categoryId,
        name: input.name,
        imageURL: input.imageURL,
        stock: input.stock,
        order: input.order,
      );

      mutationHookResult.runMutation(Variables$Mutation$CreateItem(input: p));
    }

    return BackgroundImage(
        child: Scaffold(
      appBar: const CommonAppBar(title: ""),
      body: Input(
        loading: mutationHookResult.result.isLoading,
        onPressed: onPressed,
      ),
    ));
  }
}
