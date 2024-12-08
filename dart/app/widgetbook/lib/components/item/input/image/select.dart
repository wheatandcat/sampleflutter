import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// Import the widget from your app
import 'package:stockkeeper/components/item/input/image/select.dart';

const images = [
  'https://firebasestorage.googleapis.com/v0/b/stock-keeper-review.appspot.com/o/sample%2Fliving.png?alt=media&token=cdb8f191-7d6c-49f5-b250-e9b10e5dc20d',
  'https://firebasestorage.googleapis.com/v0/b/stock-keeper-review.appspot.com/o/sample%2Fdining.png?alt=media&token=ef4df1f3-c186-4a86-8090-a2be866dc2b1',
  'https://firebasestorage.googleapis.com/v0/b/stock-keeper-review.appspot.com/o/sample%2Fkitchen.png?alt=media&token=5a6ec0f2-7ae5-46b9-a068-24f41be5c5f2',
  'https://firebasestorage.googleapis.com/v0/b/stock-keeper-review.appspot.com/o/sample%2Fbathroom.png?alt=media&token=8c94662c-ce0a-48d8-944b-b25c4eb57478',
  'https://firebasestorage.googleapis.com/v0/b/stock-keeper-review.appspot.com/o/sample%2Fbedroom.png?alt=media&token=57aede80-3102-41f7-89df-5f0b9e1ce4ee',
  'https://firebasestorage.googleapis.com/v0/b/stock-keeper-review.appspot.com/o/sample%2Fgarage.png?alt=media&token=e6cd82fb-dac4-417e-95e1-97e67026c479',
  'https://firebasestorage.googleapis.com/v0/b/stock-keeper-review.appspot.com/o/sample%2Fstorage.png?alt=media&token=5f9ded09-410a-48b3-8d89-fe689261fe6b'
];

@widgetbook.UseCase(name: 'Default', type: SelectItems)
Widget buildSelectItemsUseCase(BuildContext context) {
  return SelectItems(
    onImage: (String url) {},
    images: images,
    prevText: 'キャンセル',
    nextText: '次へ',
    onPrev: () {},
    onNext: () {},
  );
}
