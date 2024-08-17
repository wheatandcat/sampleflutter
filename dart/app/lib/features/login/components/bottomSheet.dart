import 'package:flutter/material.dart';
import 'package:stockkeeper/graphql/schema.graphql.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stockkeeper/utils/style.dart';
import 'package:stockkeeper/utils/guest.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:stockkeeper/graphql/createGuest.gql.dart';
import 'package:stockkeeper/providers/user.dart';

class ShareBottomSheet extends HookConsumerWidget {
  final String code;

  const ShareBottomSheet({super.key, required this.code});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final g = Guest();
    final guestDataAsyncValue = ref.watch(guestDataProvider);

    final cgMhr = useMutation$CreateGuest(WidgetOptions$Mutation$CreateGuest(
      onCompleted:
          (Map<String, dynamic>? data, Mutation$CreateGuest? result) async {
        final uid = result?.createGuest.uid;
        if (uid == null) {
          return;
        }
        await g.setUid(uid);
        ref.read(guestStateProvider.notifier).state =
            GuestData(id: "", uid: uid);
      },
    ));

    useEffect(() {
      cgMhr.runMutation(Variables$Mutation$CreateGuest(
          input: Input$NewGuest(
        code: code,
      )));
      return null;
    }, const []);

    useEffect(() {
      if (guestDataAsyncValue.asData?.value?.uid != null) {
        //Navigator.pop(context);
      }
      return null;
    }, [guestDataAsyncValue.asData?.value?.uid]);

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
