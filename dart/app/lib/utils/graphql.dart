import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:stockkeeper/utils/auth.dart';
import 'package:stockkeeper/utils/guest.dart';
import 'package:flutter/foundation.dart';

Future<String?> getAppCheckToken() async {
  if (!kReleaseMode) {
    // シミュレータはデバッグトークンを使用

    try {
      final appCheckToken = await FirebaseAppCheck.instance.getToken(true);
      return appCheckToken;
    } catch (e) {
      print('Error fetching App Check token: $e');
    }

    return "";
  }

  try {
    final appCheckToken = await FirebaseAppCheck.instance.getToken();
    if (appCheckToken != null) {
      return appCheckToken;
    }
  } catch (e) {
    print('Error fetching App Check t oken: $e');
  }

  return "";
}

List<T> extractGraphQLDataList<T>({
  required Map<String, dynamic>? data,
  required String fieldName,
  required T Function(Map<String, dynamic>) fromJson,
}) {
  if (data == null || data[fieldName] == null) {
    // データまたはフィールドがnullの場合は空のリストを返す
    return <T>[];
  }

  // データを指定された型のリストに変換
  return (data[fieldName] as List<dynamic>)
      .map((item) => fromJson(item as Map<String, dynamic>))
      .toList();
}

T extractGraphQLData<T>({
  required Map<String, dynamic>? data,
  required String fieldName,
  required T Function(Map<String, dynamic>) fromJson,
}) {
  if (data == null || data[fieldName] == null) {
    // データまたはフィールドがnullの場合はnullを返す
    return fromJson(<String, dynamic>{});
  }

  // データを指定された型のリストに変換
  final item = data[fieldName] as dynamic;

  return fromJson(item as Map<String, dynamic>);
}

graphqlClient() {
  final HttpLink httpLink =
      HttpLink('https://stock-keeper-voytob3xvq-an.a.run.app/graphql');

  final AuthService authService = AuthService();
  final Guest guest = Guest();
  final AuthLink authLink = AuthLink(getToken: () async {
    final uid = await guest.getUid();
    if (uid != null) {
      return "Guest $uid";
    }

    final token = await authService.getToken();

    return "Bearer $token";
  });

  // App Checkトークンを設定するAuthLink
  final AuthLink appCheckAuthLink = AuthLink(
    getToken: () async {
      final appCheckToken = await getAppCheckToken();
      return appCheckToken;
    },
    headerKey: 'X-Firebase-AppCheck', // App Check用
  );

  final link = authLink.concat(appCheckAuthLink).concat(httpLink);

  return GraphQLClient(
    link: link,
    cache: GraphQLCache(),
  );
}
