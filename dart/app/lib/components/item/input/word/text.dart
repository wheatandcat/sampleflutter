import 'package:flutter/material.dart';
import 'package:stockkeeper/utils/style.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class InputWordText extends HookWidget {
  final String defaultValue;
  final void Function() onPrev;
  final void Function(String, bool) onSearch;

  const InputWordText({
    super.key,
    required this.defaultValue,
    required this.onPrev,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    final inputText = useTextEditingController(text: defaultValue);

    return Column(children: [
      Text('商品名を選択してください',
          style: TextStyle(
              fontSize: FontSize.md,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark)),
      Expanded(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: Spacing.xl, left: Spacing.md, right: Spacing.md),
              child: TextField(
                controller: inputText,
                decoration: const InputDecoration(
                  hintText: '商品名を入力してください',
                ),
                style: TextStyle(
                  color: AppColors.textDark,
                  fontSize: FontSize.md,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: Spacing.xl),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.success,
                  minimumSize: Size(130, 50),
                ),
                onPressed: () => onSearch(inputText.text, false),
                child: Text("検索",
                    style: TextStyle(
                        color: AppColors.text,
                        fontSize: FontSize.md,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
      Container(
        color: Colors.white,
        padding: const EdgeInsets.all(Spacing.md),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: onPrev,
              child: Text("戻る", style: TextStyle(color: AppColors.textDark)),
            ),
          ],
        ),
      )
    ]);
  }
}
