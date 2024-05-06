import 'package:flutter/material.dart';
import 'package:sampleflutter/components/appBar/common.dart';
import 'package:sampleflutter/components/button/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sampleflutter/utils/auth.dart';
import 'package:sampleflutter/graphql/createUser.gql.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sampleflutter/providers/user.dart';

class Login extends HookConsumerWidget {
  const Login({Key? key}) : super(key: key);

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

        if (!context.mounted) return;
        Navigator.pop(context);
      } on FirebaseException catch (e) {
        debugPrint(e.message);
      } catch (e) {
        print(e);
      }
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
                    return Column(children: [
                      ListTile(
                        title: const Text("ログイン中のユーザー"),
                        subtitle: Text("ID:${userDataAsyncValue.value!.id}"),
                      ),
                      Button(title: "ログアウト", width: 300, onPressed: onLogout)
                    ]);
                  }
                })));
  }
}
