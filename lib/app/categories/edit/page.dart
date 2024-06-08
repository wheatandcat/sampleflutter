import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sampleflutter/components/appBar/common.dart';
import 'package:sampleflutter/graphql/updateCategory.gql.dart';
import 'package:sampleflutter/graphql/schema.graphql.dart';
import 'package:sampleflutter/components/background/background.dart';
import 'package:sampleflutter/features/category/components/input.dart';

class CategoryEdit extends HookWidget {
  final int id;
  final String name;
  final void Function() onCallback;

  const CategoryEdit(
      {super.key,
      required this.id,
      required this.name,
      required this.onCallback});

  @override
  Widget build(BuildContext context) {
    debugPrint('CategoryEdit build:$name');

    final mutationHookResult =
        useMutation$UpdateCategory(WidgetOptions$Mutation$UpdateCategory(
      onCompleted:
          (Map<String, dynamic>? data, Mutation$UpdateCategory? result) {
        onCallback();
        Navigator.pop(context);
      },
    ));

    onPressed(InputCategory item) async {
      mutationHookResult.runMutation(Variables$Mutation$UpdateCategory(
          input: Input$UpdateCategory(
        id: id,
        name: item.name,
        order: 0,
      )));
    }

    return Scaffold(
        appBar: const CommonAppBar(title: ""),
        body: BackgroundImage(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Input(
              defaultValue: InputCategory(name: name),
              onPressed: onPressed,
            ),
          ),
        ));
  }
}
