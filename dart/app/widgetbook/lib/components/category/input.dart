import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:stockkeeper/components/category/input.dart';

@widgetbook.UseCase(name: 'Default', type: Input)
Widget buildInputUseCase(BuildContext context) {
  return Input(
    onPressed: (item) {},
    loading: false,
  );
}
