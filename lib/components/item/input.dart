import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:sampleflutter/components/appBar/common.dart';
import 'package:sampleflutter/components/button/button.dart';
import 'package:sampleflutter/graphql/schema.graphql.dart';

class Input extends HookWidget {
  final void Function(Input$NewItem) onPressed;

  const Input({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final inputStockPercentage = useState(0.0);
    final inputStock = useState(0);
    final expirationDate = useState<DateTime?>(null);
    final inputName = useState('');

    // 日付選択ダイアログを表示する関数
    Future<void> setExpirationDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: expirationDate.value ?? DateTime.now(), // 初期選択日付
        firstDate: DateTime(2023), // 選択可能な最初の日付
        lastDate: DateTime(2030), // 選択可能な最後の日付
        locale: const Locale('ja'),
      );
      if (picked != null && picked != expirationDate.value) {
        expirationDate.value = picked.add(const Duration(hours: 9));

        debugPrint(picked.toString());
      }
    }

    onInputPressed() async {
      final stock = inputStock.value * 100 + inputStockPercentage.value;

      debugPrint(
        expirationDate.value?.toIso8601String(),
      );

      String? ed;
      if (expirationDate.value != null) {
        ed = '${expirationDate.value!.toIso8601String()}+09:00';
      }

      onPressed(Input$NewItem(
        categoryId: 1,
        name: inputName.value,
        stock: stock.toInt(),
        expirationDate: ed,
        order: 0,
      ));
    }

    return Scaffold(
      appBar: const CommonAppBar(title: ""),
      body: Column(
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
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("  0%",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: 250,
                    child: Slider(
                      activeColor: Colors.white,
                      inactiveColor: Colors.black.withOpacity(0.2),
                      value: inputStockPercentage.value,
                      min: 0.0,
                      max: 100.0,
                      divisions: 100,
                      onChanged: (double value) {
                        inputStockPercentage.value = value;
                      },
                    ),
                  ),
                  const Text("100%",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ],
              )),
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
                            onChanged: (value) =>
                                {inputStock.value = int.tryParse(value) ?? 0},
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
              height: 60,
              child: Center(
                  child: Row(
                children: <Widget>[
                  const SizedBox(
                      width: 150,
                      child: Text("消費期限",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold))),
                  Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: SizedBox(
                          child: InkWell(
                              onTap: () => {
                                    setExpirationDate(context),
                                  },
                              child: (expirationDate.value == null)
                                  ? const Text("設定なし",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                      ))
                                  : Text(
                                      DateFormat('yyyy/MM/dd').format(
                                          DateTime.parse(
                                              expirationDate.value.toString())),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                      ))))),
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
                          padding: EdgeInsets.only(top: 0),
                          child: TextField(
                              onChanged: (value) => inputName.value = value,
                              maxLines: null, // 複数行入力可能
                              minLines: 3,
                              cursorColor: Colors.white,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.black26,
                                border: InputBorder.none,
                              )))),
                ],
              )),
          Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Button(
              title: "登録する",
              onPressed: onInputPressed,
            ),
          ))
        ],
      ),
    );
  }
}
