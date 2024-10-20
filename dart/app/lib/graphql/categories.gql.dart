import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Query$Categories {
  Query$Categories({
    this.categories,
    this.$__typename = 'Query',
  });

  factory Query$Categories.fromJson(Map<String, dynamic> json) {
    final l$categories = json['categories'];
    final l$$__typename = json['__typename'];
    return Query$Categories(
      categories: (l$categories as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$Categories$categories.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$Categories$categories?>? categories;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$categories = categories;
    resultData['categories'] = l$categories?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$categories = categories;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$categories == null ? null : Object.hashAll(l$categories.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Categories || runtimeType != other.runtimeType) {
      return false;
    }
    final l$categories = categories;
    final lOther$categories = other.categories;
    if (l$categories != null && lOther$categories != null) {
      if (l$categories.length != lOther$categories.length) {
        return false;
      }
      for (int i = 0; i < l$categories.length; i++) {
        final l$categories$entry = l$categories[i];
        final lOther$categories$entry = lOther$categories[i];
        if (l$categories$entry != lOther$categories$entry) {
          return false;
        }
      }
    } else if (l$categories != lOther$categories) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$Categories on Query$Categories {
  CopyWith$Query$Categories<Query$Categories> get copyWith =>
      CopyWith$Query$Categories(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Categories<TRes> {
  factory CopyWith$Query$Categories(
    Query$Categories instance,
    TRes Function(Query$Categories) then,
  ) = _CopyWithImpl$Query$Categories;

  factory CopyWith$Query$Categories.stub(TRes res) =
      _CopyWithStubImpl$Query$Categories;

  TRes call({
    List<Query$Categories$categories?>? categories,
    String? $__typename,
  });
  TRes categories(
      Iterable<Query$Categories$categories?>? Function(
              Iterable<
                  CopyWith$Query$Categories$categories<
                      Query$Categories$categories>?>?)
          fn);
}

class _CopyWithImpl$Query$Categories<TRes>
    implements CopyWith$Query$Categories<TRes> {
  _CopyWithImpl$Query$Categories(
    this._instance,
    this._then,
  );

  final Query$Categories _instance;

  final TRes Function(Query$Categories) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? categories = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Categories(
        categories: categories == _undefined
            ? _instance.categories
            : (categories as List<Query$Categories$categories?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  @override
  TRes categories(
          Iterable<Query$Categories$categories?>? Function(
                  Iterable<
                      CopyWith$Query$Categories$categories<
                          Query$Categories$categories>?>?)
              fn) =>
      call(
          categories: fn(_instance.categories?.map((e) => e == null
              ? null
              : CopyWith$Query$Categories$categories(
                  e,
                  (i) => i,
                )))?.toList());
}

class _CopyWithStubImpl$Query$Categories<TRes>
    implements CopyWith$Query$Categories<TRes> {
  _CopyWithStubImpl$Query$Categories(this._res);

  final TRes _res;

  @override
  call({
    List<Query$Categories$categories?>? categories,
    String? $__typename,
  }) =>
      _res;

  @override
  categories(fn) => _res;
}

const documentNodeQueryCategories = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'Categories'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'categories'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'imageURL'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'order'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'itemCount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Query$Categories _parserFn$Query$Categories(Map<String, dynamic> data) =>
    Query$Categories.fromJson(data);
typedef OnQueryComplete$Query$Categories = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$Categories?,
);

class Options$Query$Categories extends graphql.QueryOptions<Query$Categories> {
  Options$Query$Categories({
    super.operationName,
    super.fetchPolicy,
    super.errorPolicy,
    super.cacheRereadPolicy,
    Object? optimisticResult,
    Query$Categories? typedOptimisticResult,
    super.pollInterval,
    super.context,
    OnQueryComplete$Query$Categories? onComplete,
    super.onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$Categories(data),
                  ),
          document: documentNodeQueryCategories,
          parserFn: _parserFn$Query$Categories,
        );

  final OnQueryComplete$Query$Categories? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$Categories
    extends graphql.WatchQueryOptions<Query$Categories> {
  WatchOptions$Query$Categories({
    super.operationName,
    super.fetchPolicy,
    super.errorPolicy,
    super.cacheRereadPolicy,
    Object? optimisticResult,
    Query$Categories? typedOptimisticResult,
    super.context,
    super.pollInterval,
    super.eagerlyFetchResults,
    super.carryForwardDataOnException,
    super.fetchResults,
  }) : super(
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          document: documentNodeQueryCategories,
          parserFn: _parserFn$Query$Categories,
        );
}

class FetchMoreOptions$Query$Categories extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$Categories({required super.updateQuery})
      : super(
          document: documentNodeQueryCategories,
        );
}

extension ClientExtension$Query$Categories on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$Categories>> query$Categories(
          [Options$Query$Categories? options]) async =>
      await query(options ?? Options$Query$Categories());
  graphql.ObservableQuery<Query$Categories> watchQuery$Categories(
          [WatchOptions$Query$Categories? options]) =>
      watchQuery(options ?? WatchOptions$Query$Categories());
  void writeQuery$Categories({
    required Query$Categories data,
    bool broadcast = true,
  }) =>
      writeQuery(
        const graphql.Request(
            operation:
                graphql.Operation(document: documentNodeQueryCategories)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$Categories? readQuery$Categories({bool optimistic = true}) {
    final result = readQuery(
      const graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryCategories)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$Categories.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$Categories> useQuery$Categories(
        [Options$Query$Categories? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$Categories());
graphql.ObservableQuery<Query$Categories> useWatchQuery$Categories(
        [WatchOptions$Query$Categories? options]) =>
    graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$Categories());

class Query$Categories$Widget extends graphql_flutter.Query<Query$Categories> {
  Query$Categories$Widget({
    super.key,
    Options$Query$Categories? options,
    required super.builder,
  }) : super(
          options: options ?? Options$Query$Categories(),
        );
}

class Query$Categories$categories {
  Query$Categories$categories({
    required this.id,
    required this.name,
    this.imageURL,
    required this.order,
    this.itemCount,
    this.$__typename = 'Category',
  });

  factory Query$Categories$categories.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$imageURL = json['imageURL'];
    final l$order = json['order'];
    final l$itemCount = json['itemCount'];
    final l$$__typename = json['__typename'];
    return Query$Categories$categories(
      id: (l$id as String),
      name: (l$name as String),
      imageURL: (l$imageURL as String?),
      order: (l$order as int),
      itemCount: (l$itemCount as int?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String? imageURL;

  final int order;

  final int? itemCount;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$id = id;
    resultData['id'] = l$id;
    final l$name = name;
    resultData['name'] = l$name;
    final l$imageURL = imageURL;
    resultData['imageURL'] = l$imageURL;
    final l$order = order;
    resultData['order'] = l$order;
    final l$itemCount = itemCount;
    resultData['itemCount'] = l$itemCount;
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$imageURL = imageURL;
    final l$order = order;
    final l$itemCount = itemCount;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$imageURL,
      l$order,
      l$itemCount,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Categories$categories ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$imageURL = imageURL;
    final lOther$imageURL = other.imageURL;
    if (l$imageURL != lOther$imageURL) {
      return false;
    }
    final l$order = order;
    final lOther$order = other.order;
    if (l$order != lOther$order) {
      return false;
    }
    final l$itemCount = itemCount;
    final lOther$itemCount = other.itemCount;
    if (l$itemCount != lOther$itemCount) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$Categories$categories
    on Query$Categories$categories {
  CopyWith$Query$Categories$categories<Query$Categories$categories>
      get copyWith => CopyWith$Query$Categories$categories(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$Categories$categories<TRes> {
  factory CopyWith$Query$Categories$categories(
    Query$Categories$categories instance,
    TRes Function(Query$Categories$categories) then,
  ) = _CopyWithImpl$Query$Categories$categories;

  factory CopyWith$Query$Categories$categories.stub(TRes res) =
      _CopyWithStubImpl$Query$Categories$categories;

  TRes call({
    String? id,
    String? name,
    String? imageURL,
    int? order,
    int? itemCount,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Categories$categories<TRes>
    implements CopyWith$Query$Categories$categories<TRes> {
  _CopyWithImpl$Query$Categories$categories(
    this._instance,
    this._then,
  );

  final Query$Categories$categories _instance;

  final TRes Function(Query$Categories$categories) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? imageURL = _undefined,
    Object? order = _undefined,
    Object? itemCount = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Categories$categories(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        imageURL:
            imageURL == _undefined ? _instance.imageURL : (imageURL as String?),
        order: order == _undefined || order == null
            ? _instance.order
            : (order as int),
        itemCount:
            itemCount == _undefined ? _instance.itemCount : (itemCount as int?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$Categories$categories<TRes>
    implements CopyWith$Query$Categories$categories<TRes> {
  _CopyWithStubImpl$Query$Categories$categories(this._res);

  final TRes _res;

  @override
  call({
    String? id,
    String? name,
    String? imageURL,
    int? order,
    int? itemCount,
    String? $__typename,
  }) =>
      _res;
}
