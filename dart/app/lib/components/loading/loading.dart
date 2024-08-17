import 'package:flutter/material.dart';
import 'package:stockkeeper/components/background/background.dart';
import 'package:stockkeeper/components/loading/progres.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const BackgroundImage(
        child: Scaffold(
      body: Stack(
        children: [
          // 背景の黒透過
          Progress()
        ],
      ),
    ));
  }
}
