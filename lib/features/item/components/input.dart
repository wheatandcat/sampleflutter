import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/services.dart';
import 'package:sampleflutter/components/button/button.dart';

class InputItem {
  late final String name;
  late final int stock;
  late final int order;

  InputItem({
    required this.name,
    required this.stock,
    required this.order,
  });
}

class Input extends HookWidget {
  final String? buttonText;
  final InputItem? defaultValue;
  final void Function(InputItem) onPressed;

  const Input(
      {super.key, required this.onPressed, this.defaultValue, this.buttonText});

  @override
  Widget build(BuildContext context) {
    int defaultStock = 0;

    if (defaultValue != null) {
      defaultStock = defaultValue!.stock;
    }

    final inputStock = useTextEditingController(text: defaultStock.toString());
    final inputName = useState('');

    onInputPressed() {
      final stock = int.tryParse(inputStock.text) ?? 0;

      onPressed(InputItem(
        name: inputName.value,
        stock: stock.toInt(),
        order: 0,
      ));
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Card(
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
                ))),
        SizedBox(
            width: 300,
            height: 60,
            child: Center(
                child: Row(
              children: <Widget>[
                const SizedBox(
                  width: 150,
                  child: Text("ストック数",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
                ),
                Flexible(
                    child: SizedBox(
                  width: 68,
                  height: 40,
                  child: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 20),
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
            title: buttonText ?? "登録する",
            onPressed: onInputPressed,
          ),
        ))
      ],
    );
  }
}
