import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final double? width;
  final void Function() onPressed;

  const Button(
      {super.key,
      required this.title,
      required this.onPressed,
      this.width = 210});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
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
