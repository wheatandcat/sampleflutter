import 'package:flutter/material.dart';
import 'package:stockkeeper/graphql/schema.graphql.dart';
import 'package:stockkeeper/utils/style.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:stockkeeper/graphql/createGuest.gql.dart';

class ShareBottomSheet extends HookWidget {
  final String code;

  const ShareBottomSheet({super.key, required this.code});

  @override
  Widget build(BuildContext context) {
    final cgMhr = useMutation$CreateGuest(WidgetOptions$Mutation$CreateGuest(
      onCompleted:
          (Map<String, dynamic>? data, Mutation$CreateGuest? result) async {},
    ));

    useEffect(() {
      cgMhr.runMutation(Variables$Mutation$CreateGuest(
          input: Input$NewGuest(
        code: code,
      )));
      return null;
    }, const []);

    return Padding(
      padding: const EdgeInsets.only(
          top: Spacing.md,
          bottom: Spacing.xl,
          left: Spacing.md,
          right: Spacing.md), // 上に20、下に10の余白を追加
      child: Wrap(
        children: <Widget>[
          const ListTile(
            title: Text("リストを読み込む",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: FontSize.md,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: Spacing.lg),
              child: Container(
                alignment: Alignment.center,
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.borderDark,
                  ),
                ),
                child: SizedBox(
                    height: 200,
                    width: 200,
                    child: MobileScanner(
                      controller: MobileScannerController(
                        detectionSpeed: DetectionSpeed
                            .noDuplicates, // 同じ QR コードを連続でスキャンさせない
                      ),
                      onDetect: (capture) {},
                    )),
              )),
          Container(
              alignment: Alignment.center,
              padding:
                  const EdgeInsets.only(top: Spacing.xl, bottom: Spacing.lg),
              child: const Text('QRコードを\nスキャンしてください',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.textDark,
                    fontSize: FontSize.md,
                    fontWeight: FontWeight.bold,
                  )))
        ],
      ),
    );
  }
}
