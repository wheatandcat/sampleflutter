import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CommonAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      actions: <Widget>[
        IconButton(
            color: Colors.white,
            icon: const Icon(Icons.menu), // メニューアイコン
            onPressed: () {
              // ボタンが押されたときの処理
              debugPrint('Menu button pressed');
            }),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
