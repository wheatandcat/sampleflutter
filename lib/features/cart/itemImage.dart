import 'package:flutter/material.dart';

class ItemImage extends StatelessWidget {
  final String? imageURL;

  const ItemImage({super.key, this.imageURL});

  @override
  Widget build(BuildContext context) {
    return imageURL != null
        ? ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              imageURL!,
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            ),
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'images/noimage.png',
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            ),
          );
  }
}
