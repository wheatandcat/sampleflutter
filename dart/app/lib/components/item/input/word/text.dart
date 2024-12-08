import 'package:flutter/material.dart';
import 'package:stockkeeper/utils/style.dart';

class SelectWords extends StatelessWidget {
  final List<String> words;
  final void Function(String) onWord;
  final void Function() onPrev;

  const SelectWords({
    super.key,
    required this.onWord,
    required this.words,
    required this.onPrev,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // 全画面表示するために高さを画面サイズに設定
      height: MediaQuery.of(context).size.height - 100,
      padding: const EdgeInsets.all(16.0), // 余白の調整
      child: Column(
        children: [
          Text('商品名を選択してください',
              style: TextStyle(
                  fontSize: FontSize.md,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark)),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: Spacing.xl),
              child: Wrap(
                spacing: Spacing.sm,
                runSpacing: Spacing.sm,
                children: List.generate(words.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(Spacing.sm),
                    child: ElevatedButton(
                      onPressed: () => onWord(words[index]),
                      child: Text(words[index],
                          style: TextStyle(
                              fontSize: FontSize.md,
                              color: AppColors.textDark)),
                    ),
                  );
                }),
              ),
            ),
          ),
          Container(
            color: Colors.white, // 背景色を設定（オプション）
            padding: const EdgeInsets.all(16.0), // フッターの余白
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: onPrev,
                  child:
                      Text("戻る", style: TextStyle(color: AppColors.textDark)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
