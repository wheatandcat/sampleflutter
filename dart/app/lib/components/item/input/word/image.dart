import 'package:flutter/material.dart';
import 'package:stockkeeper/utils/style.dart';

class SelectItems extends StatelessWidget {
  final List<String> images;
  final void Function(String) onImage;
  final String? prevText;
  final void Function()? onPrev;

  const SelectItems({
    super.key,
    required this.onImage,
    required this.images,
    this.prevText,
    this.onPrev,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // グリッドビュー部分
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
          padding: const EdgeInsets.all(Spacing.md), // フッターの余白
          child: ElevatedButton(
            onPressed: onPrev,
            child:
                const Text('戻る', style: TextStyle(color: AppColors.textDark)),
          ),
        ),
      ],
    );
  }
}
