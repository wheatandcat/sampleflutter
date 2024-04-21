import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sampleflutter/components/appBar/common.dart';
import 'package:sampleflutter/components/button/button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends HookWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    onPressed() async {}

    return Scaffold(
      appBar: const CommonAppBar(title: "ログイン"),
      body: Center(child: Button(title: "ログイン", onPressed: onPressed)),
    );
  }
}
