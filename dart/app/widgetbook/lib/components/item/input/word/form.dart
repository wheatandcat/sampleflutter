import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// Import the widget from your app
import 'package:stockkeeper/components/item/input/word/form.dart';

@widgetbook.UseCase(name: 'Default', type: InputWordForm)
Widget buildInputWordFormUseCase(BuildContext context) {
  return InputWordForm(
    words: const [
      'テスト1',
      'テスト2',
      'テスト3テスト3テスト3テスト3テスト3テスト3',
      'テスト4',
      'テスト5',
    ],
    onPrev: () {},
  );
}
