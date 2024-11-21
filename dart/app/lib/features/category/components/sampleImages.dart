import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

const images = [
  'https://firebasestorage.googleapis.com/v0/b/stock-keeper-review.appspot.com/o/sample%2Fliving.png?alt=media&token=cdb8f191-7d6c-49f5-b250-e9b10e5dc20d',
  'https://firebasestorage.googleapis.com/v0/b/stock-keeper-review.appspot.com/o/sample%2Fdining.png?alt=media&token=ef4df1f3-c186-4a86-8090-a2be866dc2b1',
  'https://firebasestorage.googleapis.com/v0/b/stock-keeper-review.appspot.com/o/sample%2Fkitchen.png?alt=media&token=5a6ec0f2-7ae5-46b9-a068-24f41be5c5f2',
  'https://firebasestorage.googleapis.com/v0/b/stock-keeper-review.appspot.com/o/sample%2Fbathroom.png?alt=media&token=8c94662c-ce0a-48d8-944b-b25c4eb57478',
  'https://firebasestorage.googleapis.com/v0/b/stock-keeper-review.appspot.com/o/sample%2Fbedroom.png?alt=media&token=57aede80-3102-41f7-89df-5f0b9e1ce4ee',
  'https://firebasestorage.googleapis.com/v0/b/stock-keeper-review.appspot.com/o/sample%2Fgarage.png?alt=media&token=e6cd82fb-dac4-417e-95e1-97e67026c479',
  'https://firebasestorage.googleapis.com/v0/b/stock-keeper-review.appspot.com/o/sample%2Fstorage.png?alt=media&token=5f9ded09-410a-48b3-8d89-fe689261fe6b'
];

class SampleImages extends HookWidget {
  final void Function(String) onTap;

  const SampleImages({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      // 全画面表示するために高さを画面サイズに設定
      height: MediaQuery.of(context).size.height - 100,
      padding: const EdgeInsets.all(16.0), // 余白の調整
      child: GridView.count(
        crossAxisCount: 2, // 2列に設定
        childAspectRatio: 1.0,
        children: List.generate(images.length, (index) {
          return Container(
            padding: const EdgeInsets.all(8.0), // 余白の調整
            child: InkWell(
                onTap: () => onTap(images[index]),
                child: Image.network(images[index], fit: BoxFit.cover)),
          );
        }),
      ),
    );
  }
}
