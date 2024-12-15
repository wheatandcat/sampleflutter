import 'package:flutter/material.dart';
import 'package:stockkeeper/utils/style.dart';

class SelectWords extends StatelessWidget {
  final List<String> words;
  final void Function(String) onWord;
  final String? prevText;
  final void Function() onPrev;

  const SelectWords({
    super.key,
    required this.onWord,
    required this.words,
    required this.onPrev,
    this.prevText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('商品名を選択してください',
            style: TextStyle(
                fontSize: FontSize.md,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark)),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: Spacing.xl),
            child: SingleChildScrollView(
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
        ),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(Spacing.md),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: onPrev,
                child: Text(prevText ?? '戻る',
                    style: TextStyle(color: AppColors.textDark)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
