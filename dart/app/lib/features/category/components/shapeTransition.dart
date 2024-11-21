import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ShapeTransitionIcon extends HookWidget {
  final String? imageURL;
  final double size;
  const ShapeTransitionIcon({
    super.key,
    this.imageURL,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    // AnimationController をフックで作成
    final controller = useAnimationController(
      duration: const Duration(milliseconds: 750), // アニメーションの長さ
    );

    // 0.0 (完全な円形) から 16.0 (角丸) への補間を管理
    final animation = useMemoized(
      () => Tween<double>(begin: 100.0, end: 25.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInOut),
      ),
      [controller],
    );

    // アニメーションを開始
    useEffect(() {
      controller.forward();
      return null; // クリーンアップは不要
    }, [controller]);

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return ClipRRect(
            borderRadius: BorderRadius.circular(animation.value), // 動的な半径
            child: imageURL != null
                ? Image.network(
                    imageURL!,
                    width: size,
                    height: size,
                    fit: BoxFit.cover, // 画像を枠に合わせて調整
                  )
                : Image.asset(
                    'images/noimage.png',
                    width: size,
                    height: size,
                    fit: BoxFit.cover, // 画像を枠に合わせて調整
                  ));
      },
    );
  }
}
