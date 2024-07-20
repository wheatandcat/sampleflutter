import 'package:flutter/material.dart';
import 'package:stockkeeper/components/appBar/common.dart';
import 'package:stockkeeper/components/button/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stockkeeper/utils/auth.dart';
import 'package:stockkeeper/graphql/createUser.gql.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stockkeeper/providers/user.dart';
import 'package:stockkeeper/components/background/background.dart';
import 'package:stockkeeper/utils/style.dart';
import 'package:flutter/cupertino.dart';

class Login extends HookConsumerWidget {
  const Login({super.key});

  static final googleLogin = GoogleSignIn(scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ]);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDataAsyncValue = ref.watch(userDataProvider);

    onLogout() async {
      final AuthService authService = AuthService();
      await authService.deleteToken();

      await FirebaseAuth.instance.signOut();
      if (!context.mounted) return;
      Navigator.pop(context);
    }

    final mutationHookResult =
        useMutation$CreateUser(WidgetOptions$Mutation$CreateUser(
      onCompleted:
          (Map<String, dynamic>? data, Mutation$CreateUser? result) async {
        if (!context.mounted) return;
        Navigator.pop(context);
      },
      onError: (error) {
        debugPrint(error.toString());
        // APIでエラーならログアウト
        onLogout();
      },
    ));

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

        final AuthService authService = AuthService();

        await authService.refreshAndStoreToken();

        if (userCredential.additionalUserInfo!.isNewUser) {
          //新規ユーザーの場合の処理
          mutationHookResult.runMutation();
          return;
        }
      } on FirebaseException catch (e) {
        showCupertinoDialog(
          context: context,
          builder: (BuildContext contextDialog) {
            return CupertinoAlertDialog(
              title: const Text('エラー発生'),
              content: Text(e.message ?? "エラーが発生しました"),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: const Text('閉じる'),
                  onPressed: () {
                    Navigator.of(contextDialog).pop();
                  },
                ),
              ],
            );
          },
        );

        debugPrint(e.message);
      } catch (e) {
        showCupertinoDialog(
          context: context,
          builder: (BuildContext contextDialog) {
            return CupertinoAlertDialog(
              title: const Text('エラー発生'),
              content: Text(e.toString()),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: const Text('閉じる'),
                  onPressed: () {
                    Navigator.of(contextDialog).pop();
                  },
                ),
              ],
            );
          },
        );

        print(e);
      }
    }

    return BackgroundImage(
        child: Scaffold(
            appBar: const CommonAppBar(title: "ログイン"),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start, // 垂直方向の中央
                    crossAxisAlignment: CrossAxisAlignment.center, // 水平方向の中央
                    children: [
                  Container(
                      height: 300,
                      margin: const EdgeInsets.only(bottom: Spacing.xl3),
                      child: Image.asset(
                        'images/splash.png',
                        width: 280,
                      )),
                  StreamBuilder(
                      stream: FirebaseAuth.instance.authStateChanges(),
                      builder: (BuildContext context,
                          AsyncSnapshot<User?> snapshot) {
                        if (!snapshot.hasData) {
                          return Column(children: [
                            Button(
                                title: "Googleでログイン",
                                width: 280,
                                height: 50,
                                onPressed: onPressed),
                            const Padding(
                                padding: EdgeInsets.only(top: Spacing.lg),
                                child: Text("ログインしないで進む",
                                    style: TextStyle(
                                        fontSize: FontSize.md,
                                        fontWeight: FontWeight.bold))),
                          ]);
                        } else {
                          return Column(children: [
                            ListTile(
                              title: const Text("ログイン中のユーザー"),
                              subtitle:
                                  Text("ID:${userDataAsyncValue.value?.id}"),
                            ),
                            Button(
                                title: "ログアウト", width: 300, onPressed: onLogout)
                          ]);
                        }
                      }),
                ]))));
  }
}
