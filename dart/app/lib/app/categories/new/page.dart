import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stockkeeper/components/appBar/common.dart';
import 'package:stockkeeper/graphql/createCategory.gql.dart';
import 'package:stockkeeper/graphql/schema.graphql.dart';
import 'package:stockkeeper/components/background/background.dart';
import 'package:stockkeeper/features/category/components/input.dart';
import 'package:stockkeeper/utils/style.dart';

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

    return BackgroundImage(
        child: Scaffold(
      appBar: const CommonAppBar(title: ""),
      body: Padding(
          padding: const EdgeInsets.only(left: Spacing.lg, right: Spacing.lg),
          child: Input(
            loading: mutationHookResult.result.isLoading,
            onPressed: onPressed,
          )),
    ));
  }
}
