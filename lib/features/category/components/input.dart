import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sampleflutter/components/button/button.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class InputCategory {
  late final String name;

  InputCategory({
    required this.name,
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
    final storageRef = FirebaseStorage.instance.ref();

    onPickImage() async {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        image.value = File(pickedFile.path);
      } else {
        debugPrint('No image selected.');
      }
    }

    onInputPressed() async {
      if (image.value != null) {
        try {
          final res = await storageRef
              .child('category/${image.value!.path.split('/').last}')
              .putFile(image.value!);
          final imageUrl = await res.ref.getDownloadURL();
          print(imageUrl);
        } catch (e) {
          print("error: $e");
        }
      }

      if (inputText.text.isEmpty) {
        return;
      }

      onPressed(InputCategory(name: inputText.text));
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
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                  labelText: "部屋の名前",
                  labelStyle: TextStyle(color: Colors.white, fontSize: 26),
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
              onTap: onPickImage,
              child: image.value != null
                  ? Image.file(image.value!, width: 250, height: 250)
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
