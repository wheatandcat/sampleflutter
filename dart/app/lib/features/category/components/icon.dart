import 'package:flutter/material.dart';
import 'package:stockkeeper/utils/style.dart';

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
          top: 6,
          bottom: 4,
          child: Container(
            width: 4, // 縦線の幅
            decoration: BoxDecoration(
              color: AppColors.bg, // 縦線の色
              borderRadius: BorderRadius.circular(2), // 角を丸くする
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(left: Spacing.md),
            child: ClipOval(
                child: Container(
                    color: AppColors.bg,
                    width: 80,
                    height: 80,
                    child: imageURL != null
                        ? Image.network(
                            imageURL!,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover, // 画像を枠に合わせて調整
                          )
                        : Image.asset(
                            'images/noimage.png',
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover, // 画像を枠に合わせて調整
                          ))))
      ]);
    }

    return Stack(alignment: Alignment.centerLeft, children: [
      Positioned(
        left: 0,
        top: 6,
        bottom: 4,
        child: Container(
          width: 4, // 縦線の幅
          decoration: BoxDecoration(
            color: Colors.transparent, // 縦線の色
            borderRadius: BorderRadius.circular(2), // 角を丸くする
          ),
// 縦線の色
        ),
      ),
      Padding(
          padding: const EdgeInsets.only(left: Spacing.md),
          child: InkWell(
              onTap: () {
                onPressed();
              },
              onLongPress: () => onLongPressed(),
              child: ClipOval(
                  child: Container(
                      color: AppColors.bg,
                      width: 80,
                      height: 80,
                      child: imageURL != null
                          ? Image.network(
                              imageURL!,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover, // 画像を枠に合わせて調整
                            )
                          : Image.asset(
                              'images/noimage.png',
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover, // 画像を枠に合わせて調整
                            )))))
    ]);
  }
}
