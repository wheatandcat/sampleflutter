import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/services.dart';
import 'package:stockkeeper/components/button/button.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/cupertino.dart';
import 'package:stockkeeper/utils/image.dart';

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
    int defaultStock = 0;

    if (defaultValue != null) {
      defaultStock = defaultValue!.stock;
    }

    final inputStock = useTextEditingController(text: defaultStock.toString());
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

    Future<void> cropImage(String path) async {
      imageByte.value = await cropImageSetting(path, context);
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
      if (imageByte.value != null) {
        try {
          final fileName = getFileName();
          final res =
              await storageRef.child(fileName).putData(imageByte.value!);
          final imageUrl = await res.ref.getDownloadURL();
          imageURL.value = imageUrl;
        } catch (e) {
          //print("error: $e");
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

      final stock = int.tryParse(inputStock.text) ?? 0;

      onPressed(InputItem(
        name: inputName.value,
        imageURL: imageURL.value,
        stock: stock.toInt(),
        order: 0,
      ));
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
            onTap: showPickImage,
            child: imageByte.value != null
                ? Image.memory(imageByte.value!, width: 250, height: 250)
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
        SizedBox(
            width: 300,
            height: 60,
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const SizedBox(
                  width: 150,
                  child: Text("ストック数",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ),
                Flexible(
                    child: SizedBox(
                  width: 68,
                  height: 40,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextField(
                          controller: inputStock,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly, // 数値のみを許可
                          ],
                          maxLength: 3,
                          textAlign: TextAlign.center,
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                          decoration: const InputDecoration(
                            labelText: '',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            counterText: "",
                          ))),
                ))
              ],
            ))),
        SizedBox(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                    width: 300,
                    child: Text("MEMO",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold))),
                SizedBox(
                    width: 300,
                    height: 100,
                    child: Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: TextField(
                            onChanged: (value) => inputName.value = value,
                            maxLines: null, // 複数行入力可能
                            minLines: 3,
                            cursorColor: Colors.white,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              filled: true,
                              hintText: "備考",
                              hintStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.6),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              fillColor: Colors.black26,
                              border: InputBorder.none,
                            )))),
              ],
            )),
        Center(
            child: Padding(
          padding: const EdgeInsets.only(top: 30),
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
