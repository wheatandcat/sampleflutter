import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

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
          color: Colors.black26,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero, // Cardの角を直角にする
          ),
          elevation: 0,
          child: SizedBox(
              width: 250,
              height: 250,
              child: Container(
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(2), // ボーダーの幅を調整
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 40,
                ),
              )));
    }
  }
}
