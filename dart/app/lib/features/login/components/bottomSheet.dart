import 'package:flutter/material.dart';
import 'package:stockkeeper/utils/style.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ShareBottomSheet extends HookWidget {
  const ShareBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
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
