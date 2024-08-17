import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  final Color color;

  const Progress({super.key, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      height: 60,
      width: 60,
      child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(color), strokeWidth: 6.0),
    ));
  }
}
