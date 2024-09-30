import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stockkeeper/components/background/background.dart';
import 'package:stockkeeper/components/appBar/common.dart';
import 'package:stockkeeper/graphql/createItem.gql.dart';
import 'package:stockkeeper/features/item/components/input.dart';
import 'package:stockkeeper/graphql/schema.graphql.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class NewItem extends HookWidget {
  final int categoryId;
  final bool scanBarcode;
  final void Function() onCallback;

  const NewItem(
      {super.key,
      required this.scanBarcode,
      required this.categoryId,
      required this.onCallback});

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

    if (scanBarcode) {
      return MobileScanner(
          fit: BoxFit.cover,
          controller: MobileScannerController(
            detectionSpeed:
                DetectionSpeed.noDuplicates, // 同じ QR コードを連続でスキャンさせない
          ));
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
