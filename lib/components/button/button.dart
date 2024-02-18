import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final void Function() onPressed;

  const Button({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 150,
        height: 40,
        child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: Colors.white,
                  width: 3,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50) //こちらを適用
                    ),
                backgroundColor: Colors.transparent),
            onPressed: onPressed,
            child: Text(title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold))));
  }
}
