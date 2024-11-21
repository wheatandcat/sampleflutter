import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SelectImages extends HookWidget {
  final void Function(String) onTap;
  final List<String> images;

  const SelectImages({super.key, required this.onTap, required this.images});

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
