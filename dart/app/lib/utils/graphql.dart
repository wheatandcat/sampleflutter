import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:stockkeeper/utils/auth.dart';

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
  final authLink = AuthLink(getToken: () async => authService.getToken());
  final link = authLink.concat(httpLink);

  return GraphQLClient(
    link: link,
    cache: GraphQLCache(),
  );
}
