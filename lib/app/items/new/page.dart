import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sampleflutter/components/appBar/common.dart';
import 'package:sampleflutter/graphql/createItem.gql.dart';
import 'package:sampleflutter/components/item/input.dart';
import 'package:sampleflutter/graphql/schema.graphql.dart';

class NewItem extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final mutationHookResult =
        useMutation$CreateItem(WidgetOptions$Mutation$CreateItem(
      onCompleted: (Map<String, dynamic>? data, Mutation$CreateItem? result) {
        Navigator.pop(context);
      },
      onError: (error) {
        debugPrint(error.toString());
      },
    ));

    onPressed(Input$NewItem input) async {
      mutationHookResult
          .runMutation(Variables$Mutation$CreateItem(input: input));
    }

    return Scaffold(
      appBar: const CommonAppBar(title: ""),
      body: Input(
        onPressed: onPressed,
      ),
    );
  }
}
