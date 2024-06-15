import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sampleflutter/components/button/button.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter/cupertino.dart';

class InputCategory {
  late final String name;
  late final String? imageURL;

  InputCategory({
    required this.name,
    this.imageURL,
  });
}

class Input extends HookWidget {
  final void Function(InputCategory) onPressed;
  final InputCategory? defaultValue;

  final picker = ImagePicker();

  Input({
    super.key,
    this.defaultValue,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final inputText = useTextEditingController(text: defaultValue?.name ?? '');
    final image = useState<File?>(null);
    final imageURL = useState<String?>(defaultValue?.imageURL);
    final storageRef = FirebaseStorage.instance.ref();

    Future<void> cropImage(String path) async {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: path,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: '画像を切り取る',
              initAspectRatio: CropAspectRatioPreset.square,
              lockAspectRatio: true,
              aspectRatioPresets: [
                CropAspectRatioPreset.square,
              ]),
          IOSUiSettings(
            title: '画像を切り取る',
            minimumAspectRatio: 1.0,
            aspectRatioPresets: [
              CropAspectRatioPreset.square,
            ],
            aspectRatioLockEnabled: true,
          ),
          WebUiSettings(
            context: context,
          ),
        ],
      );

      if (croppedFile != null) {
        image.value = File(croppedFile.path);
      }
    }

    void showPickImage() {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Padding(
              padding: const EdgeInsets.only(
                  top: 10.0,
                  bottom: 40.0,
                  left: 10.0,
                  right: 10.0), // 上に20、下に10の余白を追加
              child: Wrap(
                children: <Widget>[
                  const ListTile(
                    title: Text("画像をアップロード",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  ListTile(
                    leading: const Icon(Icons.camera_alt),
                    title: const Text('カメラを起動する'),
                    onTap: () async {
                      Navigator.pop(context);
                      final pickedFile =
                          await picker.pickImage(source: ImageSource.camera);
                      if (pickedFile != null) {
                        cropImage(pickedFile.path);
                      }
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.image_search),
                    title: const Text('アルバムから選択する'),
                    onTap: () async {
                      Navigator.pop(context);
                      final pickedFile =
                          await picker.pickImage(source: ImageSource.gallery);
                      if (pickedFile != null) {
                        cropImage(pickedFile.path);
                      }
                    },
                  ),
                ],
              ));
        },
      );
    }

    onInputPressed() async {
      if (image.value != null) {
        try {
          final uuid = const Uuid().v4();
          final fileName = "$uuid.${image.value!.path.split('.').last}";
          final res = await storageRef
              .child('category/$fileName}')
              .putFile(image.value!);
          final imageUrl = await res.ref.getDownloadURL();
          imageURL.value = imageUrl;
        } catch (e) {
          showDialog(
              context: context,
              builder: (BuildContext contextDialog) {
                return CupertinoAlertDialog(
                  title: const Text("エラーが発生しました"),
                  content: Text("画像のアップロードに失敗しました。もう一度お試しください。(エラーコード: $e)"),
                  actions: [
                    CupertinoDialogAction(
                      child: const Text('OK'),
                      onPressed: () => Navigator.pop(contextDialog),
                    ),
                  ],
                );
              });
          return;
        }
      }

      if (inputText.text.isEmpty) {
        showDialog(
            context: context,
            builder: (BuildContext contextDialog) {
              return CupertinoAlertDialog(
                title: const Text("入力エラー"),
                content: const Text("部屋の名前を入力してください。"),
                actions: [
                  CupertinoDialogAction(
                    child: const Text('OK'),
                    onPressed: () => Navigator.pop(contextDialog),
                  ),
                ],
              );
            });
        return;
      }

      onPressed(InputCategory(name: inputText.text, imageURL: imageURL.value));
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Center(
            child: TextField(
                controller: inputText,
                cursorColor: Colors.white,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                  labelText: "部屋の名前",
                  labelStyle: TextStyle(color: Colors.white, fontSize: 16),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ))),
        Container(
          padding: const EdgeInsets.only(top: 30),
          child: InkWell(
              onTap: showPickImage,
              child: image.value != null
                  ? Image.file(image.value!, width: 250, height: 250)
                  : imageURL.value != null
                      ? Image.network(imageURL.value!, width: 250, height: 250)
                      : Card(
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
                              )))),
        ),
        Flexible(
            child: Center(
                heightFactor: 3,
                child: Button(title: "保存", onPressed: onInputPressed))),
      ],
    );
  }
}
