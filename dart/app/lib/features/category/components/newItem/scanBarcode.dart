import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:stockkeeper/utils/style.dart';

class ScanBarcode extends StatelessWidget {
  const ScanBarcode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    void onScan(BarcodeCapture capture) {}

    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Dialog(
        child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: Spacing.lg),
            child: Container(
              alignment: Alignment.center,
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.borderDark,
                ),
              ),
              child: SizedBox(
                  width: 300,
                  height: 300,
                  child: MobileScanner(
                    fit: BoxFit.cover,
                    controller: MobileScannerController(
                      detectionSpeed:
                          DetectionSpeed.noDuplicates, // 同じ QR コードを連続でスキャンさせない
                    ),
                    onDetect: onScan,
                  )),
            )),
      ),
    );
  }
}
