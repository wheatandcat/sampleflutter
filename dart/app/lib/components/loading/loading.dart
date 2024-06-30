import 'package:flutter/material.dart';
import 'package:stockkeeper/components/background/background.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const BackgroundImage(
        child: Scaffold(
      body: Stack(
        children: [
          // 背景の黒透過
          Center(
              child: SizedBox(
            height: 60,
            width: 60,
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                strokeWidth: 6.0),
          )),
        ],
      ),
    ));
  }
}
