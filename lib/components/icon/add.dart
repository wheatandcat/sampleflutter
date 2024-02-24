import 'package:flutter/material.dart';

class AddIcon extends StatelessWidget {
  const AddIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      padding: const EdgeInsets.all(2), // ボーダーの幅を調整
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 4)),
      child: const CircleAvatar(
        radius: 12,
        backgroundColor: Colors.transparent,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
