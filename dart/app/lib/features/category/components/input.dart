import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:stockkeeper/components/button/button.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/cupertino.dart';
import 'package:stockkeeper/utils/image.dart';
import 'package:stockkeeper/utils/style.dart';
import 'package:stockkeeper/features/category/components/sampleImages.dart';

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
  final bool loading;

  final picker = ImagePicker();

  Input({
    super.key,
    this.defaultValue,
    required this.loading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final inputText = useTextEditingController(text: defaultValue?.name ?? '');
    final imageURL = useState<String?>(defaultValue?.imageURL);
    final imageByte = useState<Uint8List?>(null);
    final storageRef = FirebaseStorage.instance.ref();

    String getFileName() {
      if (defaultValue?.imageURL == null) {
        final uuid = const Uuid().v4();
        return "category/$uuid.jpg";
      } else {
        Uri uri = Uri.parse(Uri.decodeFull(defaultValue!.imageURL!));
        String path = uri.path;
        List<String> segments = path.split('/');
        String lastSegment = segments.last;
        String fileName = Uri.decodeComponent(lastSegment);

        return "category/$fileName";
      }
    }

    Future<void> cropImage(String path) async {
      imageByte.value = await cropImageSetting(path, context);
    }

    void showSampleImage() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return SampleImages(
            onTap: (String url) {
              context.pop();
              imageURL.value = url;
            },
          );
        },
      );
    }

    void showPickImage() {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Padding(
              padding: const EdgeInsets.only(
                  top: Spacing.md,
                  bottom: Spacing.lg,
                  left: Spacing.md,
                  right: Spacing.md), // 上に20、下に10の余白を追加
              child: Wrap(
                children: <Widget>[
                  const ListTile(
                    title: Text("画像をアップロード",
                        style: TextStyle(
                            fontSize: FontSize.lg,
                            fontWeight: FontWeight.bold)),
                  ),
                  ListTile(
                    leading: const Icon(Icons.image),
                    title: const Text('サンプル画像を使用する'),
                    onTap: () async {
                      context.pop();
                      showSampleImage();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.camera_alt),
                    title: const Text('カメラを起動する'),
                    onTap: () async {
                      context.pop();
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
                      context.pop();
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
      if (imageByte.value != null) {
        try {
          final fileName = getFileName();
          final res =
              await storageRef.child(fileName).putData(imageByte.value!);
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
                      onPressed: () => contextDialog.pop(),
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
                    onPressed: () => contextDialog.pop(),
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
                cursorColor: AppColors.text,
                style: const TextStyle(
                    color: AppColors.text,
                    fontSize: FontSize.lg,
                    fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                  labelText: "部屋の名前",
                  labelStyle:
                      TextStyle(color: AppColors.text, fontSize: FontSize.md),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.bg),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.bg),
                  ),
                ))),
        Container(
          padding: const EdgeInsets.only(top: Spacing.xl),
          child: InkWell(
              onTap: showPickImage,
              child: imageByte.value != null
                  ? Image.memory(imageByte.value!, width: 250, height: 250)
                  : imageURL.value != null
                      ? Image.network(imageURL.value!, width: 250, height: 250)
                      : Card(
                          color: Colors.black26,
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
                              )))),
        ),
        Flexible(
            child: Center(
                heightFactor: 3,
                child: Button(
                    loading: loading, title: "保存", onPressed: onInputPressed))),
      ],
    );
  }
}
