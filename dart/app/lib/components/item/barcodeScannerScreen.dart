import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:stockkeeper/components/appBar/common.dart';

class BarcodeScannerScreen extends HookWidget {
  final Future<void> Function(BarcodeCapture capture) onScan;

  const BarcodeScannerScreen({
    super.key,
    required this.onScan,
  });

  @override
  Widget build(BuildContext context) {
    final cameraController = useMemoized(() => MobileScannerController());

    // アニメーションコントローラを定義（ここでは3秒でスキャンラインが1サイクル）
    final animationController = useAnimationController(
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true); // 繰り返しアニメーションを実行

    return Scaffold(
      appBar: const CommonAppBar(title: ""),
      body: Stack(
        children: [
          // カメラでのバーコード読み取り
          MobileScanner(
            controller: cameraController,
            onDetect: onScan,
          ),
          // スキャンエリアのオーバーレイ
          CustomPaint(
            size: MediaQuery.of(context).size,
            painter: ScannerOverlay(),
          ),
          // スキャンラインのアニメーション
          AnimatedBuilder(
            animation: animationController,
            builder: (context, child) {
              // アニメーションの進行に基づいてスキャンラインの位置を計算
              final position = animationController.value * 300; // 0から300まで移動
              return Positioned(
                top: MediaQuery.of(context).size.height * 0.22 + position,
                left: 40,
                right: 40,
                child: child!,
              );
            },
            child: Container(
              height: 2,
              color: Colors.redAccent,
            ),
          ),
        ],
      ),
    );
  }
}

class ScannerOverlay extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withOpacity(0.5)
      ..style = PaintingStyle.fill;

    // スクリーン全体を半透明で塗りつぶす
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    // スキャンエリア（中央部分の透明な四角形）
    paint.color = Colors.transparent;
    final scanRect = Rect.fromLTWH(40, size.height / 4, size.width - 80, 300);
    canvas.drawRect(scanRect, paint);

    // スキャンエリアの枠線を描く
    final borderPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    canvas.drawRect(scanRect, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
