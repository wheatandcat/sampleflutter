import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Query$ItemAll {
  Query$ItemAll({
    this.itemAll,
    this.$__typename = 'Query',
  });

  factory Query$ItemAll.fromJson(Map<String, dynamic> json) {
    final l$itemAll = json['itemAll'];
    final l$$__typename = json['__typename'];
    return Query$ItemAll(
      itemAll: (l$itemAll as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$ItemAll$itemAll.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$ItemAll$itemAll?>? itemAll;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$itemAll = itemAll;
    resultData['itemAll'] = l$itemAll?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$itemAll = itemAll;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$itemAll == null ? null : Object.hashAll(l$itemAll.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$ItemAll || runtimeType != other.runtimeType) {
      return false;
    }
    final l$itemAll = itemAll;
    final lOther$itemAll = other.itemAll;
    if (l$itemAll != null && lOther$itemAll != null) {
      if (l$itemAll.length != lOther$itemAll.length) {
        return false;
      }
      for (int i = 0; i < l$itemAll.length; i++) {
        final l$itemAll$entry = l$itemAll[i];
        final lOther$itemAll$entry = lOther$itemAll[i];
        if (l$itemAll$entry != lOther$itemAll$entry) {
          return false;
        }
      }
    } else if (l$itemAll != lOther$itemAll) {
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

extension UtilityExtension$Query$ItemAll on Query$ItemAll {
  CopyWith$Query$ItemAll<Query$ItemAll> get copyWith => CopyWith$Query$ItemAll(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$ItemAll<TRes> {
  factory CopyWith$Query$ItemAll(
    Query$ItemAll instance,
    TRes Function(Query$ItemAll) then,
  ) = _CopyWithImpl$Query$ItemAll;

  factory CopyWith$Query$ItemAll.stub(TRes res) =
      _CopyWithStubImpl$Query$ItemAll;

  TRes call({
    List<Query$ItemAll$itemAll?>? itemAll,
    String? $__typename,
  });
  TRes itemAll(
      Iterable<Query$ItemAll$itemAll?>? Function(
              Iterable<CopyWith$Query$ItemAll$itemAll<Query$ItemAll$itemAll>?>?)
          fn);
}

class _CopyWithImpl$Query$ItemAll<TRes>
    implements CopyWith$Query$ItemAll<TRes> {
  _CopyWithImpl$Query$ItemAll(
    this._instance,
    this._then,
  );

  final Query$ItemAll _instance;

  final TRes Function(Query$ItemAll) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? itemAll = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$ItemAll(
        itemAll: itemAll == _undefined
            ? _instance.itemAll
            : (itemAll as List<Query$ItemAll$itemAll?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  @override
  TRes itemAll(
          Iterable<Query$ItemAll$itemAll?>? Function(
                  Iterable<
                      CopyWith$Query$ItemAll$itemAll<Query$ItemAll$itemAll>?>?)
              fn) =>
      call(
          itemAll: fn(_instance.itemAll?.map((e) => e == null
              ? null
              : CopyWith$Query$ItemAll$itemAll(
                  e,
                  (i) => i,
                )))?.toList());
}

class _CopyWithStubImpl$Query$ItemAll<TRes>
    implements CopyWith$Query$ItemAll<TRes> {
  _CopyWithStubImpl$Query$ItemAll(this._res);

  final TRes _res;

  @override
  call({
    List<Query$ItemAll$itemAll?>? itemAll,
    String? $__typename,
  }) =>
      _res;

  @override
  itemAll(fn) => _res;
}

const documentNodeQueryItemAll = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'ItemAll'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'itemAll'),
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
            name: NameNode(value: 'imageURL'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'categoryId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'stock'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'category'),
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
Query$ItemAll _parserFn$Query$ItemAll(Map<String, dynamic> data) =>
    Query$ItemAll.fromJson(data);
typedef OnQueryComplete$Query$ItemAll = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$ItemAll?,
);

class Options$Query$ItemAll extends graphql.QueryOptions<Query$ItemAll> {
  Options$Query$ItemAll({
    super.operationName,
    super.fetchPolicy,
    super.errorPolicy,
    super.cacheRereadPolicy,
    Object? optimisticResult,
    Query$ItemAll? typedOptimisticResult,
    super.pollInterval,
    super.context,
    OnQueryComplete$Query$ItemAll? onComplete,
    super.onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$ItemAll(data),
                  ),
          document: documentNodeQueryItemAll,
          parserFn: _parserFn$Query$ItemAll,
        );

  final OnQueryComplete$Query$ItemAll? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$ItemAll
    extends graphql.WatchQueryOptions<Query$ItemAll> {
  WatchOptions$Query$ItemAll({
    super.operationName,
    super.fetchPolicy,
    super.errorPolicy,
    super.cacheRereadPolicy,
    Object? optimisticResult,
    Query$ItemAll? typedOptimisticResult,
    super.context,
    super.pollInterval,
    super.eagerlyFetchResults,
    super.carryForwardDataOnException,
    super.fetchResults,
  }) : super(
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          document: documentNodeQueryItemAll,
          parserFn: _parserFn$Query$ItemAll,
        );
}

class FetchMoreOptions$Query$ItemAll extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$ItemAll({required super.updateQuery})
      : super(
          document: documentNodeQueryItemAll,
        );
}

extension ClientExtension$Query$ItemAll on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$ItemAll>> query$ItemAll(
          [Options$Query$ItemAll? options]) async =>
      await query(options ?? Options$Query$ItemAll());
  graphql.ObservableQuery<Query$ItemAll> watchQuery$ItemAll(
          [WatchOptions$Query$ItemAll? options]) =>
      watchQuery(options ?? WatchOptions$Query$ItemAll());
  void writeQuery$ItemAll({
    required Query$ItemAll data,
    bool broadcast = true,
  }) =>
      writeQuery(
        const graphql.Request(
            operation: graphql.Operation(document: documentNodeQueryItemAll)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$ItemAll? readQuery$ItemAll({bool optimistic = true}) {
    final result = readQuery(
      const graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryItemAll)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$ItemAll.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$ItemAll> useQuery$ItemAll(
        [Options$Query$ItemAll? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$ItemAll());
graphql.ObservableQuery<Query$ItemAll> useWatchQuery$ItemAll(
        [WatchOptions$Query$ItemAll? options]) =>
    graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$ItemAll());

class Query$ItemAll$Widget extends graphql_flutter.Query<Query$ItemAll> {
  Query$ItemAll$Widget({
    super.key,
    Options$Query$ItemAll? options,
    required super.builder,
  }) : super(
          options: options ?? Options$Query$ItemAll(),
        );
}

class Query$ItemAll$itemAll {
  Query$ItemAll$itemAll({
    required this.id,
    this.imageURL,
    required this.categoryId,
    required this.stock,
    this.category,
    this.$__typename = 'Item',
  });

  factory Query$ItemAll$itemAll.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$imageURL = json['imageURL'];
    final l$categoryId = json['categoryId'];
    final l$stock = json['stock'];
    final l$category = json['category'];
    final l$$__typename = json['__typename'];
    return Query$ItemAll$itemAll(
      id: (l$id as String),
      imageURL: (l$imageURL as String?),
      categoryId: (l$categoryId as String),
      stock: (l$stock as int),
      category: l$category == null
          ? null
          : Query$ItemAll$itemAll$category.fromJson(
              (l$category as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? imageURL;

  final String categoryId;

  final int stock;

  final Query$ItemAll$itemAll$category? category;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$id = id;
    resultData['id'] = l$id;
    final l$imageURL = imageURL;
    resultData['imageURL'] = l$imageURL;
    final l$categoryId = categoryId;
    resultData['categoryId'] = l$categoryId;
    final l$stock = stock;
    resultData['stock'] = l$stock;
    final l$category = category;
    resultData['category'] = l$category?.toJson();
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$imageURL = imageURL;
    final l$categoryId = categoryId;
    final l$stock = stock;
    final l$category = category;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$imageURL,
      l$categoryId,
      l$stock,
      l$category,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$ItemAll$itemAll || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$imageURL = imageURL;
    final lOther$imageURL = other.imageURL;
    if (l$imageURL != lOther$imageURL) {
      return false;
    }
    final l$categoryId = categoryId;
    final lOther$categoryId = other.categoryId;
    if (l$categoryId != lOther$categoryId) {
      return false;
    }
    final l$stock = stock;
    final lOther$stock = other.stock;
    if (l$stock != lOther$stock) {
      return false;
    }
    final l$category = category;
    final lOther$category = other.category;
    if (l$category != lOther$category) {
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

extension UtilityExtension$Query$ItemAll$itemAll on Query$ItemAll$itemAll {
  CopyWith$Query$ItemAll$itemAll<Query$ItemAll$itemAll> get copyWith =>
      CopyWith$Query$ItemAll$itemAll(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$ItemAll$itemAll<TRes> {
  factory CopyWith$Query$ItemAll$itemAll(
    Query$ItemAll$itemAll instance,
    TRes Function(Query$ItemAll$itemAll) then,
  ) = _CopyWithImpl$Query$ItemAll$itemAll;

  factory CopyWith$Query$ItemAll$itemAll.stub(TRes res) =
      _CopyWithStubImpl$Query$ItemAll$itemAll;

  TRes call({
    String? id,
    String? imageURL,
    String? categoryId,
    int? stock,
    Query$ItemAll$itemAll$category? category,
    String? $__typename,
  });
  CopyWith$Query$ItemAll$itemAll$category<TRes> get category;
}

class _CopyWithImpl$Query$ItemAll$itemAll<TRes>
    implements CopyWith$Query$ItemAll$itemAll<TRes> {
  _CopyWithImpl$Query$ItemAll$itemAll(
    this._instance,
    this._then,
  );

  final Query$ItemAll$itemAll _instance;

  final TRes Function(Query$ItemAll$itemAll) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? id = _undefined,
    Object? imageURL = _undefined,
    Object? categoryId = _undefined,
    Object? stock = _undefined,
    Object? category = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$ItemAll$itemAll(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        imageURL:
            imageURL == _undefined ? _instance.imageURL : (imageURL as String?),
        categoryId: categoryId == _undefined || categoryId == null
            ? _instance.categoryId
            : (categoryId as String),
        stock: stock == _undefined || stock == null
            ? _instance.stock
            : (stock as int),
        category: category == _undefined
            ? _instance.category
            : (category as Query$ItemAll$itemAll$category?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  @override
  CopyWith$Query$ItemAll$itemAll$category<TRes> get category {
    final local$category = _instance.category;
    return local$category == null
        ? CopyWith$Query$ItemAll$itemAll$category.stub(_then(_instance))
        : CopyWith$Query$ItemAll$itemAll$category(
            local$category, (e) => call(category: e));
  }
}

class _CopyWithStubImpl$Query$ItemAll$itemAll<TRes>
    implements CopyWith$Query$ItemAll$itemAll<TRes> {
  _CopyWithStubImpl$Query$ItemAll$itemAll(this._res);

  final TRes _res;

  @override
  call({
    String? id,
    String? imageURL,
    String? categoryId,
    int? stock,
    Query$ItemAll$itemAll$category? category,
    String? $__typename,
  }) =>
      _res;

  @override
  CopyWith$Query$ItemAll$itemAll$category<TRes> get category =>
      CopyWith$Query$ItemAll$itemAll$category.stub(_res);
}

class Query$ItemAll$itemAll$category {
  Query$ItemAll$itemAll$category({
    required this.id,
    required this.name,
    this.$__typename = 'Category',
  });

  factory Query$ItemAll$itemAll$category.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$ItemAll$itemAll$category(
      id: (l$id as String),
      name: (l$name as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$id = id;
    resultData['id'] = l$id;
    final l$name = name;
    resultData['name'] = l$name;
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$ItemAll$itemAll$category ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$ItemAll$itemAll$category
    on Query$ItemAll$itemAll$category {
  CopyWith$Query$ItemAll$itemAll$category<Query$ItemAll$itemAll$category>
      get copyWith => CopyWith$Query$ItemAll$itemAll$category(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$ItemAll$itemAll$category<TRes> {
  factory CopyWith$Query$ItemAll$itemAll$category(
    Query$ItemAll$itemAll$category instance,
    TRes Function(Query$ItemAll$itemAll$category) then,
  ) = _CopyWithImpl$Query$ItemAll$itemAll$category;

  factory CopyWith$Query$ItemAll$itemAll$category.stub(TRes res) =
      _CopyWithStubImpl$Query$ItemAll$itemAll$category;

  TRes call({
    String? id,
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$ItemAll$itemAll$category<TRes>
    implements CopyWith$Query$ItemAll$itemAll$category<TRes> {
  _CopyWithImpl$Query$ItemAll$itemAll$category(
    this._instance,
    this._then,
  );

  final Query$ItemAll$itemAll$category _instance;

  final TRes Function(Query$ItemAll$itemAll$category) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$ItemAll$itemAll$category(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$ItemAll$itemAll$category<TRes>
    implements CopyWith$Query$ItemAll$itemAll$category<TRes> {
  _CopyWithStubImpl$Query$ItemAll$itemAll$category(this._res);

  final TRes _res;

  @override
  call({
    String? id,
    String? name,
    String? $__typename,
  }) =>
      _res;
}
