import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Query$Carts {
  Query$Carts({
    this.carts,
    this.$__typename = 'Query',
  });

  factory Query$Carts.fromJson(Map<String, dynamic> json) {
    final l$carts = json['carts'];
    final l$$__typename = json['__typename'];
    return Query$Carts(
      carts: (l$carts as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$Carts$carts.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$Carts$carts?>? carts;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$carts = carts;
    _resultData['carts'] = l$carts?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$carts = carts;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$carts == null ? null : Object.hashAll(l$carts.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Carts) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$carts = carts;
    final lOther$carts = other.carts;
    if (l$carts != null && lOther$carts != null) {
      if (l$carts.length != lOther$carts.length) {
        return false;
      }
      for (int i = 0; i < l$carts.length; i++) {
        final l$carts$entry = l$carts[i];
        final lOther$carts$entry = lOther$carts[i];
        if (l$carts$entry != lOther$carts$entry) {
          return false;
        }
      }
    } else if (l$carts != lOther$carts) {
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

extension UtilityExtension$Query$Carts on Query$Carts {
  CopyWith$Query$Carts<Query$Carts> get copyWith => CopyWith$Query$Carts(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Carts<TRes> {
  factory CopyWith$Query$Carts(
    Query$Carts instance,
    TRes Function(Query$Carts) then,
  ) = _CopyWithImpl$Query$Carts;

  factory CopyWith$Query$Carts.stub(TRes res) = _CopyWithStubImpl$Query$Carts;

  TRes call({
    List<Query$Carts$carts?>? carts,
    String? $__typename,
  });
  TRes carts(
      Iterable<Query$Carts$carts?>? Function(
              Iterable<CopyWith$Query$Carts$carts<Query$Carts$carts>?>?)
          _fn);
}

class _CopyWithImpl$Query$Carts<TRes> implements CopyWith$Query$Carts<TRes> {
  _CopyWithImpl$Query$Carts(
    this._instance,
    this._then,
  );

  final Query$Carts _instance;

  final TRes Function(Query$Carts) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? carts = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Carts(
        carts: carts == _undefined
            ? _instance.carts
            : (carts as List<Query$Carts$carts?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes carts(
          Iterable<Query$Carts$carts?>? Function(
                  Iterable<CopyWith$Query$Carts$carts<Query$Carts$carts>?>?)
              _fn) =>
      call(
          carts: _fn(_instance.carts?.map((e) => e == null
              ? null
              : CopyWith$Query$Carts$carts(
                  e,
                  (i) => i,
                )))?.toList());
}

class _CopyWithStubImpl$Query$Carts<TRes>
    implements CopyWith$Query$Carts<TRes> {
  _CopyWithStubImpl$Query$Carts(this._res);

  TRes _res;

  call({
    List<Query$Carts$carts?>? carts,
    String? $__typename,
  }) =>
      _res;

  carts(_fn) => _res;
}

const documentNodeQueryCarts = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'Carts'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'carts'),
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
            name: NameNode(value: 'quantity'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'item'),
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
                    name: NameNode(value: 'imageURL'),
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
Query$Carts _parserFn$Query$Carts(Map<String, dynamic> data) =>
    Query$Carts.fromJson(data);
typedef OnQueryComplete$Query$Carts = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$Carts?,
);

class Options$Query$Carts extends graphql.QueryOptions<Query$Carts> {
  Options$Query$Carts({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Carts? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$Carts? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$Carts(data),
                  ),
          onError: onError,
          document: documentNodeQueryCarts,
          parserFn: _parserFn$Query$Carts,
        );

  final OnQueryComplete$Query$Carts? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$Carts extends graphql.WatchQueryOptions<Query$Carts> {
  WatchOptions$Query$Carts({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Carts? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryCarts,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$Carts,
        );
}

class FetchMoreOptions$Query$Carts extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$Carts({required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryCarts,
        );
}

extension ClientExtension$Query$Carts on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$Carts>> query$Carts(
          [Options$Query$Carts? options]) async =>
      await this.query(options ?? Options$Query$Carts());
  graphql.ObservableQuery<Query$Carts> watchQuery$Carts(
          [WatchOptions$Query$Carts? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$Carts());
  void writeQuery$Carts({
    required Query$Carts data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(document: documentNodeQueryCarts)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$Carts? readQuery$Carts({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryCarts)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$Carts.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$Carts> useQuery$Carts(
        [Options$Query$Carts? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$Carts());
graphql.ObservableQuery<Query$Carts> useWatchQuery$Carts(
        [WatchOptions$Query$Carts? options]) =>
    graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$Carts());

class Query$Carts$Widget extends graphql_flutter.Query<Query$Carts> {
  Query$Carts$Widget({
    widgets.Key? key,
    Options$Query$Carts? options,
    required graphql_flutter.QueryBuilder<Query$Carts> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$Carts(),
          builder: builder,
        );
}

class Query$Carts$carts {
  Query$Carts$carts({
    required this.id,
    required this.quantity,
    this.item,
    this.$__typename = 'Cart',
  });

  factory Query$Carts$carts.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$quantity = json['quantity'];
    final l$item = json['item'];
    final l$$__typename = json['__typename'];
    return Query$Carts$carts(
      id: (l$id as String),
      quantity: (l$quantity as int),
      item: l$item == null
          ? null
          : Query$Carts$carts$item.fromJson((l$item as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final int quantity;

  final Query$Carts$carts$item? item;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$quantity = quantity;
    _resultData['quantity'] = l$quantity;
    final l$item = item;
    _resultData['item'] = l$item?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$quantity = quantity;
    final l$item = item;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$quantity,
      l$item,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Carts$carts) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$quantity = quantity;
    final lOther$quantity = other.quantity;
    if (l$quantity != lOther$quantity) {
      return false;
    }
    final l$item = item;
    final lOther$item = other.item;
    if (l$item != lOther$item) {
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

extension UtilityExtension$Query$Carts$carts on Query$Carts$carts {
  CopyWith$Query$Carts$carts<Query$Carts$carts> get copyWith =>
      CopyWith$Query$Carts$carts(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Carts$carts<TRes> {
  factory CopyWith$Query$Carts$carts(
    Query$Carts$carts instance,
    TRes Function(Query$Carts$carts) then,
  ) = _CopyWithImpl$Query$Carts$carts;

  factory CopyWith$Query$Carts$carts.stub(TRes res) =
      _CopyWithStubImpl$Query$Carts$carts;

  TRes call({
    String? id,
    int? quantity,
    Query$Carts$carts$item? item,
    String? $__typename,
  });
  CopyWith$Query$Carts$carts$item<TRes> get item;
}

class _CopyWithImpl$Query$Carts$carts<TRes>
    implements CopyWith$Query$Carts$carts<TRes> {
  _CopyWithImpl$Query$Carts$carts(
    this._instance,
    this._then,
  );

  final Query$Carts$carts _instance;

  final TRes Function(Query$Carts$carts) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? quantity = _undefined,
    Object? item = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Carts$carts(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        quantity: quantity == _undefined || quantity == null
            ? _instance.quantity
            : (quantity as int),
        item: item == _undefined
            ? _instance.item
            : (item as Query$Carts$carts$item?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$Carts$carts$item<TRes> get item {
    final local$item = _instance.item;
    return local$item == null
        ? CopyWith$Query$Carts$carts$item.stub(_then(_instance))
        : CopyWith$Query$Carts$carts$item(local$item, (e) => call(item: e));
  }
}

class _CopyWithStubImpl$Query$Carts$carts<TRes>
    implements CopyWith$Query$Carts$carts<TRes> {
  _CopyWithStubImpl$Query$Carts$carts(this._res);

  TRes _res;

  call({
    String? id,
    int? quantity,
    Query$Carts$carts$item? item,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$Carts$carts$item<TRes> get item =>
      CopyWith$Query$Carts$carts$item.stub(_res);
}

class Query$Carts$carts$item {
  Query$Carts$carts$item({
    required this.id,
    this.imageURL,
    required this.categoryId,
    required this.stock,
    this.category,
    this.$__typename = 'Item',
  });

  factory Query$Carts$carts$item.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$imageURL = json['imageURL'];
    final l$categoryId = json['categoryId'];
    final l$stock = json['stock'];
    final l$category = json['category'];
    final l$$__typename = json['__typename'];
    return Query$Carts$carts$item(
      id: (l$id as String),
      imageURL: (l$imageURL as String?),
      categoryId: (l$categoryId as String),
      stock: (l$stock as int),
      category: l$category == null
          ? null
          : Query$Carts$carts$item$category.fromJson(
              (l$category as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? imageURL;

  final String categoryId;

  final int stock;

  final Query$Carts$carts$item$category? category;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$imageURL = imageURL;
    _resultData['imageURL'] = l$imageURL;
    final l$categoryId = categoryId;
    _resultData['categoryId'] = l$categoryId;
    final l$stock = stock;
    _resultData['stock'] = l$stock;
    final l$category = category;
    _resultData['category'] = l$category?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
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
    if (!(other is Query$Carts$carts$item) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$Carts$carts$item on Query$Carts$carts$item {
  CopyWith$Query$Carts$carts$item<Query$Carts$carts$item> get copyWith =>
      CopyWith$Query$Carts$carts$item(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Carts$carts$item<TRes> {
  factory CopyWith$Query$Carts$carts$item(
    Query$Carts$carts$item instance,
    TRes Function(Query$Carts$carts$item) then,
  ) = _CopyWithImpl$Query$Carts$carts$item;

  factory CopyWith$Query$Carts$carts$item.stub(TRes res) =
      _CopyWithStubImpl$Query$Carts$carts$item;

  TRes call({
    String? id,
    String? imageURL,
    String? categoryId,
    int? stock,
    Query$Carts$carts$item$category? category,
    String? $__typename,
  });
  CopyWith$Query$Carts$carts$item$category<TRes> get category;
}

class _CopyWithImpl$Query$Carts$carts$item<TRes>
    implements CopyWith$Query$Carts$carts$item<TRes> {
  _CopyWithImpl$Query$Carts$carts$item(
    this._instance,
    this._then,
  );

  final Query$Carts$carts$item _instance;

  final TRes Function(Query$Carts$carts$item) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? imageURL = _undefined,
    Object? categoryId = _undefined,
    Object? stock = _undefined,
    Object? category = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Carts$carts$item(
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
            : (category as Query$Carts$carts$item$category?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$Carts$carts$item$category<TRes> get category {
    final local$category = _instance.category;
    return local$category == null
        ? CopyWith$Query$Carts$carts$item$category.stub(_then(_instance))
        : CopyWith$Query$Carts$carts$item$category(
            local$category, (e) => call(category: e));
  }
}

class _CopyWithStubImpl$Query$Carts$carts$item<TRes>
    implements CopyWith$Query$Carts$carts$item<TRes> {
  _CopyWithStubImpl$Query$Carts$carts$item(this._res);

  TRes _res;

  call({
    String? id,
    String? imageURL,
    String? categoryId,
    int? stock,
    Query$Carts$carts$item$category? category,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$Carts$carts$item$category<TRes> get category =>
      CopyWith$Query$Carts$carts$item$category.stub(_res);
}

class Query$Carts$carts$item$category {
  Query$Carts$carts$item$category({
    required this.id,
    required this.name,
    this.imageURL,
    this.$__typename = 'Category',
  });

  factory Query$Carts$carts$item$category.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$imageURL = json['imageURL'];
    final l$$__typename = json['__typename'];
    return Query$Carts$carts$item$category(
      id: (l$id as String),
      name: (l$name as String),
      imageURL: (l$imageURL as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String? imageURL;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$imageURL = imageURL;
    _resultData['imageURL'] = l$imageURL;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$imageURL = imageURL;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$imageURL,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Carts$carts$item$category) ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$Carts$carts$item$category
    on Query$Carts$carts$item$category {
  CopyWith$Query$Carts$carts$item$category<Query$Carts$carts$item$category>
      get copyWith => CopyWith$Query$Carts$carts$item$category(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$Carts$carts$item$category<TRes> {
  factory CopyWith$Query$Carts$carts$item$category(
    Query$Carts$carts$item$category instance,
    TRes Function(Query$Carts$carts$item$category) then,
  ) = _CopyWithImpl$Query$Carts$carts$item$category;

  factory CopyWith$Query$Carts$carts$item$category.stub(TRes res) =
      _CopyWithStubImpl$Query$Carts$carts$item$category;

  TRes call({
    String? id,
    String? name,
    String? imageURL,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Carts$carts$item$category<TRes>
    implements CopyWith$Query$Carts$carts$item$category<TRes> {
  _CopyWithImpl$Query$Carts$carts$item$category(
    this._instance,
    this._then,
  );

  final Query$Carts$carts$item$category _instance;

  final TRes Function(Query$Carts$carts$item$category) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? imageURL = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Carts$carts$item$category(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        imageURL:
            imageURL == _undefined ? _instance.imageURL : (imageURL as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$Carts$carts$item$category<TRes>
    implements CopyWith$Query$Carts$carts$item$category<TRes> {
  _CopyWithStubImpl$Query$Carts$carts$item$category(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? imageURL,
    String? $__typename,
  }) =>
      _res;
}
