import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// Import the widget from your app
import 'package:stockkeeper/components/button/button.dart';

@widgetbook.UseCase(name: 'Default', type: Button)
Widget buildCoolButtonUseCase(BuildContext context) {
  return Button(title: 'Hello', onPressed: () {});
}
