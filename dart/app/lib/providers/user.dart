import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stockkeeper/providers/graphql.dart';
import 'package:stockkeeper/graphql/me.gql.dart';
import 'package:flutter/material.dart';
import 'package:stockkeeper/utils/style.dart';

class UserData {
  late final String id;
  late final String uid;

  UserData({
    required this.id,
    required this.uid,
  });

  void update(UserData newUser) {
    id = newUser.id;
    uid = newUser.uid;
  }
}

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final authStateChangesProvider = StreamProvider<User?>((ref) {
  return ref.read(firebaseAuthProvider).authStateChanges();
});

final userDataProvider = FutureProvider.autoDispose<UserData?>((ref) async {
  final user = ref.watch(authStateChangesProvider).asData?.value;
  if (user == null) {
    return null;
  }
  final client = ref.read(graphqlClientProvider);

  int retryCount = 0;
  QueryResult? result;
  while (retryCount < 4) {
    result = await client.query<Query$Me>(
      QueryOptions(
        document: documentNodeQueryMe,
        fetchPolicy: FetchPolicy.networkOnly,
        errorPolicy: ErrorPolicy.all,
        pollInterval: const Duration(seconds: 5), // タイムアウトまでの時間を伸ばす
      ),
    );

    if (!result.hasException) {
      break;
    }
    await Future.delayed(const Duration(milliseconds: 300));
    retryCount++;
  }

  if (result == null || result.hasException) {
    final errorMessage = result?.exception.toString() ?? '不明なエラーが発生しました。';

    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: ref.read(navigatorKeyProvider).currentContext!,
        builder: (context) {
          return AlertDialog(
            title: const Text('エラー'),
            content: SingleChildScrollView(
              child: Text(
                'データの取得に失敗しました（リトライ:$retryCount回）。\n$errorMessage',
                style: const TextStyle(
                    fontSize: FontSize.sm, color: AppColors.textDark),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    });
    return null;
  }

  final userData = result.data!['me'];
  return UserData(
    id: userData['id'],
    uid: userData['uid'],
  );
});

// NavigatorKeyを提供するProvider
final navigatorKeyProvider = Provider<GlobalKey<NavigatorState>>((ref) {
  return GlobalKey<NavigatorState>();
});
