import 'package:flutter/material.dart';
import 'package:stockkeeper/utils/style.dart';

class AddIcon extends StatelessWidget {
  const AddIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      padding: const EdgeInsets.all(Spacing.xs),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.bg, width: BorderWidth.md)),
      child: const CircleAvatar(
        radius: 12,
        backgroundColor: Colors.transparent,
        child: Icon(Icons.add, color: AppColors.bg),
      ),
    );
  }
}
