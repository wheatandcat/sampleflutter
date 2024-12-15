import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:mocktail/mocktail.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stockkeeper/components/item/input/word/form.dart';
import 'package:stockkeeper/providers/graphql.dart';

// Mockクラスの作成
class FakeQueryOptions extends Fake implements QueryOptions {}

class MockGraphQLClient extends Mock implements GraphQLClient {}

@widgetbook.UseCase(name: 'Default', type: InputWordForm)
Widget buildInputWordFormUseCase(BuildContext context) {
  final mockGraphQLClient = MockGraphQLClient();

  when(() => mockGraphQLClient.query(any())).thenAnswer(
    (_) async => QueryResult(
      options: QueryOptions(document: gql('')),
      source: QueryResultSource.network,
      data: null,
    ),
  );

  return ProviderScope(
    overrides: [graphqlClientProvider.overrideWithValue(mockGraphQLClient)],
    child: InputWordForm(
      scanImage: null,
      defaultImages: const [],
      words: const [
        'テスト1',
        'テスト2',
        'テスト3テスト3テスト3テスト3テスト3テスト3',
        'テスト4',
        'テスト5',
      ],
      defaultScreen: screenSelectWords,
      onImage: (url) {},
      onCropImage: () {},
      onCancel: () {},
    ),
  );
}
