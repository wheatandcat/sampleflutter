import 'package:flutter/material.dart';
import 'package:stockkeeper/utils/style.dart';
import 'package:stockkeeper/features/category/components/shapeTransition.dart';

const double iconSize = 60;

class CategoryIcon extends StatelessWidget {
  final String? imageURL;
  final bool selected;
  final void Function() onPressed;
  final void Function() onLongPressed;

  const CategoryIcon({
    super.key,
    this.imageURL,
    required this.selected,
    required this.onPressed,
    required this.onLongPressed,
  });

  @override
  Widget build(BuildContext context) {
    if (selected) {
      return Stack(alignment: Alignment.centerLeft, children: [
        Positioned(
          left: 0,
          top: 0,
          bottom: 0,
          child: Container(
            width: 4, // 縦線の幅
            decoration: BoxDecoration(
              color: AppColors.bg, // 縦線の色
              borderRadius: BorderRadius.circular(2), // 角を丸くする
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(left: Spacing.md + 4),
            child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onLongPress: () => onLongPressed(),
                child: ShapeTransitionIcon(
                  imageURL: imageURL,
                  size: iconSize,
                )))
      ]);
    }

    return Stack(alignment: Alignment.centerLeft, children: [
      Positioned(
        left: 0,
        top: 0,
        bottom: 0,
        child: Container(
          width: 4, // 縦線の幅
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ),
      Padding(
          padding: const EdgeInsets.only(left: Spacing.md + 4),
          child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                onPressed();
              },
              onLongPress: () => onLongPressed(),
              child: ClipOval(
                  child: Container(
                      color: AppColors.bg,
                      width: iconSize,
                      height: iconSize,
                      child: imageURL != null
                          ? Image.network(
                              imageURL!,
                              width: iconSize,
                              height: iconSize,
                              fit: BoxFit.cover, // 画像を枠に合わせて調整
                            )
                          : Image.asset(
                              'images/noimage.png',
                              width: iconSize,
                              height: iconSize,
                              fit: BoxFit.cover, // 画像を枠に合わせて調整
                            )))))
    ]);
  }
}
