import 'package:flutter/material.dart';

class CategoryIcon extends StatelessWidget {
  final String? imageURL;
  final void Function() onPressed;
  final void Function() onLongPressed;

  const CategoryIcon({
    super.key,
    this.imageURL,
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
            child: Container(
                color: Colors.white,
                width: 70,
                height: 70,
                child: imageURL != null
                    ? Image.network(
                        imageURL!,
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover, // 画像を枠に合わせて調整
                      )
                    : Image.asset(
                        'images/noimage.png',
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover, // 画像を枠に合わせて調整
                      ))));
  }
}
