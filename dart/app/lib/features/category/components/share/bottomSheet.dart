import 'package:flutter/material.dart';
import 'package:stockkeeper/utils/style.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ShareBottomSheet extends StatelessWidget {
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
              title: Text("リストを共有する",
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
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.borderDark,
                    ),
                  ),
                  child: QrImageView(
                    data: '1234567890',
                    version: QrVersions.auto,
                    size: 125.0,
                  ),
                )),
            Container(
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.only(top: Spacing.xl, bottom: Spacing.lg),
                child: const Text('共有したい端末でQRコードを\nスキャンしてください',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.textDark,
                      fontSize: FontSize.md,
                      fontWeight: FontWeight.bold,
                    )))
          ],
        ));
  }
}
