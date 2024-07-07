import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:stockkeeper/utils/style.dart';

class ItemImage extends StatelessWidget {
  final String? imageURL;
  final Uint8List? imageBinary;

  const ItemImage({
    super.key,
    this.imageBinary,
    this.imageURL,
  });

  @override
  Widget build(BuildContext context) {
    if (kIsWeb && imageBinary != null) {
      return Image.memory(
        imageBinary!,
        width: 250,
        height: 250,
        fit: BoxFit.cover,
      );
    } else if (imageURL != null) {
      return Image.network(
        imageURL!,
        width: 250,
        height: 250,
        fit: BoxFit.cover,
      );
    } else {
      return Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          elevation: 0,
          child: SizedBox(
              width: 250,
              height: 250,
              child: Container(
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(Spacing.xs),
                child: const Icon(
                  Icons.camera_alt,
                  color: AppColors.text,
                  size: 40,
                ),
              )));
    }
  }
}
