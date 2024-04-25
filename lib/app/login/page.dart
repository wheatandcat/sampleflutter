import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sampleflutter/components/appBar/common.dart';
import 'package:sampleflutter/components/button/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends HookWidget {
  const Login({Key? key}) : super(key: key);

  static final googleLogin = GoogleSignIn(scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ]);

  @override
  Widget build(BuildContext context) {
    onPressed() async {
      try {
        //Google認証フローを起動する
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        //リクエストから認証情報を取得する
        final googleAuth = await googleUser?.authentication;
        //firebaseAuthで認証を行う為、credentialを作成
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        //作成したcredentialを元にfirebaseAuthで認証を行う
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        if (userCredential.additionalUserInfo!.isNewUser) {
          //新規ユーザーの場合の処理
          debugPrint("新規ユーザー");
        } else {
          //既存ユーザーの場合の処理
          debugPrint("既存ユーザー");
        }
      } on FirebaseException catch (e) {
        debugPrint(e.message);
      } catch (e) {
        print(e);
      }
    }

    onLogout() async {
      await FirebaseAuth.instance.signOut();
    }

    return Scaffold(
        appBar: const CommonAppBar(title: "ログイン"),
        body: Center(
            child: StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
                  if (!snapshot.hasData) {
                    return Button(
                        title: "Google ログイン", width: 300, onPressed: onPressed);
                  } else {
                    return Button(
                        title: "ログアウト", width: 300, onPressed: onLogout);
                  }
                })));
  }
}
