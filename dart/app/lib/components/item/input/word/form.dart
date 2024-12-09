import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stockkeeper/utils/style.dart';
import 'package:stockkeeper/components/item/input/word/select.dart';
import 'package:stockkeeper/components/item/input/word/text.dart';

const screenSelectWords = 1;
const screenInputText = 2;

class InputWordForm extends HookWidget {
  final List<String> words;
  final void Function() onPrev;
  final void Function(String) onSearch;

  const InputWordForm({
    super.key,
    required this.words,
    required this.onPrev,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    final screen = useState(screenSelectWords);
    final inputText = useState("");

    return Container(
      height: MediaQuery.of(context).size.height - 100,
      padding: const EdgeInsets.all(Spacing.md), // 余白の調整
      child: screen.value == screenSelectWords
          ? SelectWords(
              onWord: (word) => {
                inputText.value = word,
                screen.value = screenInputText,
              },
              words: words,
              onPrev: onPrev,
            )
          : InputWordText(
              defaultValue: inputText.value,
              onPrev: () => screen.value = screenSelectWords,
              onSearch: onSearch,
            ),
    );
  }
}
