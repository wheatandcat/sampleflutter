import 'package:flutter/material.dart';

class CategoryIcon extends StatelessWidget {
  final void Function() onPressed;
  final void Function() onLongPressed;

  const CategoryIcon({
    super.key,
    required this.onPressed,
    required this.onLongPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          onPressed();
        },
        onLongPress: () => onLongPressed(),
        child: ClipOval(
            child: Image.asset(
          'images/150x150.png',
          width: 70,
          height: 70,
          fit: BoxFit.cover, // 画像を枠に合わせて調整
        )));
  }
}
