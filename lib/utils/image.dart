import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

Future<Uint8List?> cropImageSetting(String path, BuildContext context) async {
  final croppedFile = await ImageCropper().cropImage(
    sourcePath: path,
    aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
    uiSettings: [
      AndroidUiSettings(
        toolbarTitle: '画像を切り取る',
        initAspectRatio: CropAspectRatioPreset.square,
        lockAspectRatio: true,
      ),
      IOSUiSettings(
        title: '画像を切り取る',
        minimumAspectRatio: 1.0,
      ),
      WebUiSettings(
        context: context,
        initialAspectRatio: 1.0,
      ),
    ],
  );

  if (croppedFile == null) {
    return null;
  }

  final data = await croppedFile.readAsBytes();

  return await FlutterImageCompress.compressWithList(
    data,
    minWidth: 800,
    minHeight: 800,
    quality: 85,
  );
}
