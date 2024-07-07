import 'package:flutter/material.dart';
import 'package:stockkeeper/utils/style.dart';

class Button extends StatelessWidget {
  final String title;
  final double? width;
  final double? height;
  final bool loading;
  final void Function() onPressed;

  const Button(
      {super.key,
      this.loading = false,
      required this.title,
      required this.onPressed,
      this.width = 210,
      this.height = 42});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: AppColors.bg,
                  width: 0,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                backgroundColor: AppColors.bg),
            onPressed: onPressed,
            child: Padding(
                padding: const EdgeInsets.only(bottom: Spacing.xs),
                child: loading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: AppColors.secondary,
                        ),
                      )
                    : Text(title,
                        style: const TextStyle(
                            color: AppColors.secondary,
                            fontSize: FontSize.lg,
                            fontWeight: FontWeight.bold)))));
  }
}
