import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stockkeeper/components/background/background.dart';
import 'package:stockkeeper/components/appBar/common.dart';
import 'package:stockkeeper/graphql/createItem.gql.dart';
import 'package:stockkeeper/graphql/itemFromQR.gql.dart';
import 'package:stockkeeper/providers/graphql.dart';
import 'package:stockkeeper/components/item/input.dart';
import 'package:stockkeeper/components/item/barcodeScannerScreen.dart';
import 'package:stockkeeper/graphql/schema.graphql.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class NewItem extends HookConsumerWidget {
  final int categoryId;
  final bool scanBarcode;
  final void Function() onCallback;

  const NewItem(
      {super.key,
      required this.scanBarcode,
      required this.categoryId,
      required this.onCallback});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final client = ref.read(graphqlClientProvider);

    final defaultValue = useState<InputItem?>(null);
    final scan = useState<bool>(false);

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

    Future<void> onScan(BarcodeCapture capture) async {
      final List<Barcode> barcodes = capture.barcodes;
      final value = barcodes.first.rawValue;

      if (value != null && barcodes.first.format == BarcodeFormat.ean13) {
        final String code = value;
        print('Scanned JAN code: $code');

        final result = await client.query<Query$ItemFromQR>(QueryOptions(
            document: documentNodeQueryItemFromQR,
            variables: {'janCode': code}));

        if (result.hasException) {
          debugPrint(result.exception.toString());
          scan.value = true;
          return;
        }

        print(result.data!['itemFromQR']['name']);
        print(result.data!['itemFromQR']['imageURL']);

        defaultValue.value = InputItem(
          name: result.data!['itemFromQR']['name'],
          imageURL: result.data!['itemFromQR']['imageURL'],
          stock: 0,
          order: 0,
        );

        scan.value = true;
      }
    }

    if (scanBarcode && !scan.value) {
      return BarcodeScannerScreen(onScan: onScan);
    }

    return BackgroundImage(
        child: Scaffold(
      appBar: const CommonAppBar(title: ""),
      body: Input(
        defaultValue: defaultValue.value,
        loading: mutationHookResult.result.isLoading,
        onPressed: onPressed,
      ),
    ));
  }
}
