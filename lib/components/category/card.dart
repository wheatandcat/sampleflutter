import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String name;

  const CategoryCard({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.transparent,
        elevation: 0,
        child: ListTile(
          contentPadding: const EdgeInsets.only(top: 20),
          title: Text(name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ));
  }
}
