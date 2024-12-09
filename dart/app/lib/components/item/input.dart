import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/services.dart';
import 'package:stockkeeper/components/button/button.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:stockkeeper/utils/style.dart';
import 'package:stockkeeper/components/item/input/image.dart';
import 'package:stockkeeper/utils/error.dart';

class InputItem {
  late final String name;
  late final String? imageURL;
  late final int stock;
  late final int order;

  InputItem({
    required this.name,
    this.imageURL,
    required this.stock,
    required this.order,
  });
}

class Input extends HookWidget {
  final String? buttonText;
  final InputItem? defaultValue;
  final bool loading;
  final void Function(InputItem) onPressed;

  final picker = ImagePicker();

  Input(
      {super.key,
      required this.onPressed,
      required this.loading,
      this.defaultValue,
      this.buttonText});

  @override
  Widget build(BuildContext context) {
    int defaultStock = 1;

    if (defaultValue != null) {
      defaultStock = defaultValue!.stock;
    }

    final inputStock = useState<int>(defaultStock);
    final inputName = useState('');
    final imageByte = useState<Uint8List?>(null);
    final imageURL = useState<String?>(defaultValue?.imageURL);
    final storageRef = FirebaseStorage.instance.ref();

    String getFileName() {
      if (defaultValue?.imageURL == null) {
        final uuid = const Uuid().v4();
        return "item/$uuid.jpg";
      } else {
        Uri uri = Uri.parse(Uri.decodeFull(defaultValue!.imageURL!));
        String path = uri.path;
        List<String> segments = path.split('/');
        String lastSegment = segments.last;
        String fileName = Uri.decodeComponent(lastSegment);

        return "item/$fileName";
      }
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
          if (!context.mounted) return;
          showErrorDialog(context, "画像のアップロードに失敗しました。もう一度お試しください。(エラーコード: $e)");
        }
      }

      onPressed(InputItem(
        name: inputName.value,
        imageURL: imageURL.value,
        stock: inputStock.value,
        order: 0,
      ));
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InputImage(
          defaultValue: imageURL.value,
          onChangeImageURL: (url) => imageURL.value = url,
          onChangeImageByte: (byte) => imageByte.value = byte,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Text("ストック数",
                  style: TextStyle(
                      fontSize: FontSize.sm, fontWeight: FontWeight.bold)),
            ),
            Container(
                padding: const EdgeInsets.only(left: 4, right: 4),
                width: 290,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        if (inputStock.value > 0) {
                          inputStock.value--;
                        }
                      },
                      icon: const Icon(Icons.remove),
                      color: AppColors.secondary,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        '${inputStock.value}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.secondary,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        inputStock.value++;
                      },
                      icon: const Icon(Icons.add),
                      color: AppColors.secondary,
                    ),
                  ],
                )),
          ],
        ),
        Padding(
            padding: const EdgeInsets.only(top: Spacing.xl),
            child: SizedBox(
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                        width: 300,
                        child: Text("MEMO",
                            style: TextStyle(
                                fontSize: FontSize.md,
                                fontWeight: FontWeight.bold))),
                    SizedBox(
                        width: 300,
                        height: 100,
                        child: Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: TextField(
                                onChanged: (value) => inputName.value = value,
                                maxLines: null, // 複数行入力可能
                                minLines: 5,
                                cursorColor: AppColors.text,
                                style: const TextStyle(
                                    color: AppColors.text,
                                    fontSize: FontSize.md,
                                    fontWeight: FontWeight.bold),
                                decoration: InputDecoration(
                                  filled: true,
                                  hintText: "備考",
                                  hintStyle: TextStyle(
                                      color: AppColors.text.withOpacity(0.6),
                                      fontSize: FontSize.md,
                                      fontWeight: FontWeight.bold),
                                  fillColor: Colors.black26,
                                  border: InputBorder.none,
                                )))),
                  ],
                ))),
        Center(
            child: Padding(
          padding: const EdgeInsets.only(top: Spacing.xl),
          child: Button(
            loading: loading,
            title: buttonText ?? "登録する",
            onPressed: onInputPressed,
          ),
        ))
      ],
    );
  }
}
