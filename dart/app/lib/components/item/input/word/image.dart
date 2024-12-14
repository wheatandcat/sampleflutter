import 'package:flutter/material.dart';
import 'package:stockkeeper/utils/style.dart';

class SelectItems extends StatelessWidget {
  final List<String> images;
  final void Function(String) onImage;
  final String? prevText;
  final void Function()? onPrev;
  final String? nextText;
  final void Function()? onNext;

  const SelectItems({
    super.key,
    required this.onImage,
    required this.images,
    this.prevText,
    this.onPrev,
    this.nextText,
    this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.count(
            crossAxisCount: 2, // 2列に設定
            childAspectRatio: 1.0,
            children: List.generate(images.length, (index) {
              return Container(
                padding: const EdgeInsets.all(Spacing.md), // 余白の調整
                child: InkWell(
                    onTap: () => onImage(images[index]),
                    child: Image.network(images[index], fit: BoxFit.cover)),
              );
            }),
          ),
        ),
        Container(
          color: Colors.white, // 背景色を設定（オプション）
          padding: const EdgeInsets.all(16.0), // フッターの余白
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (onPrev != null)
                ElevatedButton(
                  onPressed: onPrev,
                  child: Text(prevText ?? 'キャンセル'),
                ),
              if (onNext != null)
                ElevatedButton(
                  onPressed: onNext,
                  child: Text(nextText ?? '次へ'),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
