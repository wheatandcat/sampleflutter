import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:stockkeeper/features/item/components/input.dart';

@widgetbook.UseCase(name: 'Default', type: Input)
Widget buildCoolButtonUseCase(BuildContext context) {
  return Input(
    onPressed: (item) {},
    loading: false,
  );
}
