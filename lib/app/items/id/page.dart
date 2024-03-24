import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sampleflutter/graphql/item.gql.dart';
import 'package:sampleflutter/components/appBar/common.dart';
import 'package:sampleflutter/components/item/input.dart';

class ItemDetail extends HookWidget {
  final int id;
  final void Function() onCallback;

  const ItemDetail({super.key, required this.id, required this.onCallback});

  @override
  Widget build(BuildContext context) {
    final queryResult = useQuery$Item(
        Options$Query$Item(variables: Variables$Query$Item(id: id)));

    final result = queryResult.result;

    onPressed(InputItem input) async {
      queryResult.refetch();
    }

    if (result.isLoading) {
      return const Scaffold(
        appBar: CommonAppBar(title: ""),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: const CommonAppBar(title: ""),
      body: Input(
        onPressed: onPressed,
      ),
    );
  }
}
