import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sampleflutter/components/appBar/common.dart';
import 'package:sampleflutter/graphql/createCategory.gql.dart';
import 'package:sampleflutter/graphql/schema.graphql.dart';
import 'package:sampleflutter/components/background/background.dart';
import 'package:sampleflutter/features/category/components/input.dart';

class CategoryNew extends HookWidget {
  final void Function() onCallback;

  const CategoryNew({super.key, required this.onCallback});

  @override
  Widget build(BuildContext context) {
    final mutationHookResult =
        useMutation$CreateCategory(WidgetOptions$Mutation$CreateCategory(
      onCompleted:
          (Map<String, dynamic>? data, Mutation$CreateCategory? result) async {
        onCallback();
        Navigator.pop(context);
      },
    ));

    onPressed(InputCategory item) async {
      mutationHookResult.runMutation(Variables$Mutation$CreateCategory(
          input: Input$NewCategory(
        name: item.name,
        imageURL: item.imageURL,
        order: 0,
      )));
    }

    return Scaffold(
        appBar: const CommonAppBar(title: ""),
        body: BackgroundImage(
          child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Input(
                onPressed: onPressed,
              )),
        ));
  }
}
