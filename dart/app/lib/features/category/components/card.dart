import 'package:flutter/material.dart';
import 'package:stockkeeper/utils/style.dart';

class CategoryCard extends StatelessWidget {
  final String name;

  const CategoryCard({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.transparent,
        elevation: 0,
        child: ListTile(
          contentPadding: const EdgeInsets.only(top: Spacing.lg),
          title: Text(name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: AppColors.text,
                  fontSize: FontSize.lg,
                  fontWeight: FontWeight.bold)),
        ));
  }
}
