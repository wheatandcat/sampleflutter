import 'package:flutter/material.dart';

class InputItem {
  late final String name;
  late final int stock;
  String? expirationDate;
  late final int order;

  InputItem({
    required this.name,
    required this.stock,
    this.expirationDate,
    required this.order,
  });
}

class CategoryCard extends StatelessWidget {
  final int count;
  final String name;

  const CategoryCard({super.key, required this.count, required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.transparent,
        elevation: 0,
        shape: const Border(bottom: BorderSide(color: Colors.white, width: 3)),
        child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(name,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            subtitle: Text('${count.toString()} ITEM',
                style: const TextStyle(color: Colors.white))));
  }
}
