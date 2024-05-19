import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sampleflutter/utils/graphql.dart';
import 'package:sampleflutter/graphql/category.gql.dart';
import 'package:sampleflutter/providers/graphql.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

UseItems useItems(WidgetRef ref) {
  final items = useState<List<Query$Category$items>>([]);
  final client = ref.read(graphqlClientProvider);

  Future<void> getItems(int categoryId) async {
    final result = await client.query<Query$Category>(
      QueryOptions(
        document: documentNodeQueryCategory,
        fetchPolicy: FetchPolicy.networkOnly,
        variables: <String, dynamic>{
          'id': categoryId,
        },
      ),
    );
    if (result.hasException) {
      return;
    }

    items.value = extractGraphQLDataList(
      data: result.data,
      fieldName: "items",
      fromJson: Query$Category$items.fromJson,
    );
  }

  return UseItems(
    value: items.value,
    get: getItems,
  );
}

class UseItems {
  final List<Query$Category$items> value;
  final Future<void> Function(int categoryId) get;

  UseItems({
    required this.value,
    required this.get,
  });
}
