import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Query$Item {
  factory Variables$Query$Item({required int id}) => Variables$Query$Item._({
        r'id': id,
      });

  Variables$Query$Item._(this._$data);

  factory Variables$Query$Item.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    return Variables$Query$Item._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$Item<Variables$Query$Item> get copyWith =>
      CopyWith$Variables$Query$Item(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$Item || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Variables$Query$Item<TRes> {
  factory CopyWith$Variables$Query$Item(
    Variables$Query$Item instance,
    TRes Function(Variables$Query$Item) then,
  ) = _CopyWithImpl$Variables$Query$Item;

  factory CopyWith$Variables$Query$Item.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$Item;

  TRes call({int? id});
}

class _CopyWithImpl$Variables$Query$Item<TRes>
    implements CopyWith$Variables$Query$Item<TRes> {
  _CopyWithImpl$Variables$Query$Item(
    this._instance,
    this._then,
  );

  final Variables$Query$Item _instance;

  final TRes Function(Variables$Query$Item) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(Variables$Query$Item._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$Item<TRes>
    implements CopyWith$Variables$Query$Item<TRes> {
  _CopyWithStubImpl$Variables$Query$Item(this._res);

  TRes _res;

  call({int? id}) => _res;
}

class Query$Item {
  Query$Item({
    this.item,
    this.$__typename = 'Query',
  });

  factory Query$Item.fromJson(Map<String, dynamic> json) {
    final l$item = json['item'];
    final l$$__typename = json['__typename'];
    return Query$Item(
      item: l$item == null
          ? null
          : Query$Item$item.fromJson((l$item as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$Item$item? item;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$item = item;
    _resultData['item'] = l$item?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$item = item;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$item,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Item || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$Item on Query$Item {
  CopyWith$Query$Item<Query$Item> get copyWith => CopyWith$Query$Item(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Item<TRes> {
  factory CopyWith$Query$Item(
    Query$Item instance,
    TRes Function(Query$Item) then,
  ) = _CopyWithImpl$Query$Item;

  factory CopyWith$Query$Item.stub(TRes res) = _CopyWithStubImpl$Query$Item;

  TRes call({
    Query$Item$item? item,
    String? $__typename,
  });
  CopyWith$Query$Item$item<TRes> get item;
}

class _CopyWithImpl$Query$Item<TRes> implements CopyWith$Query$Item<TRes> {
  _CopyWithImpl$Query$Item(
    this._instance,
    this._then,
  );

  final Query$Item _instance;

  final TRes Function(Query$Item) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? item = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Item(
        item: item == _undefined ? _instance.item : (item as Query$Item$item?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$Item$item<TRes> get item {
    final local$item = _instance.item;
    return local$item == null
        ? CopyWith$Query$Item$item.stub(_then(_instance))
        : CopyWith$Query$Item$item(local$item, (e) => call(item: e));
  }
}

class _CopyWithStubImpl$Query$Item<TRes> implements CopyWith$Query$Item<TRes> {
  _CopyWithStubImpl$Query$Item(this._res);

  TRes _res;

  call({
    Query$Item$item? item,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$Item$item<TRes> get item =>
      CopyWith$Query$Item$item.stub(_res);
}

const documentNodeQueryItem = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'Item'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'item'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
          )
        ],
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
            name: NameNode(value: 'categoryId'),
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
            name: NameNode(value: 'stock'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'expirationDate'),
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
Query$Item _parserFn$Query$Item(Map<String, dynamic> data) =>
    Query$Item.fromJson(data);
typedef OnQueryComplete$Query$Item = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$Item?,
);

class Options$Query$Item extends graphql.QueryOptions<Query$Item> {
  Options$Query$Item({
    String? operationName,
    required Variables$Query$Item variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Item? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$Item? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables.toJson(),
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
                    data == null ? null : _parserFn$Query$Item(data),
                  ),
          onError: onError,
          document: documentNodeQueryItem,
          parserFn: _parserFn$Query$Item,
        );

  final OnQueryComplete$Query$Item? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$Item extends graphql.WatchQueryOptions<Query$Item> {
  WatchOptions$Query$Item({
    String? operationName,
    required Variables$Query$Item variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Item? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryItem,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$Item,
        );
}

class FetchMoreOptions$Query$Item extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$Item({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$Item variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryItem,
        );
}

extension ClientExtension$Query$Item on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$Item>> query$Item(
          Options$Query$Item options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$Item> watchQuery$Item(
          WatchOptions$Query$Item options) =>
      this.watchQuery(options);
  void writeQuery$Item({
    required Query$Item data,
    required Variables$Query$Item variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryItem),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$Item? readQuery$Item({
    required Variables$Query$Item variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryItem),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$Item.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$Item> useQuery$Item(
        Options$Query$Item options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$Item> useWatchQuery$Item(
        WatchOptions$Query$Item options) =>
    graphql_flutter.useWatchQuery(options);

class Query$Item$Widget extends graphql_flutter.Query<Query$Item> {
  Query$Item$Widget({
    widgets.Key? key,
    required Options$Query$Item options,
    required graphql_flutter.QueryBuilder<Query$Item> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$Item$item {
  Query$Item$item({
    required this.id,
    required this.name,
    this.imageURL,
    required this.categoryId,
    required this.order,
    required this.stock,
    this.expirationDate,
    this.$__typename = 'Item',
  });

  factory Query$Item$item.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$imageURL = json['imageURL'];
    final l$categoryId = json['categoryId'];
    final l$order = json['order'];
    final l$stock = json['stock'];
    final l$expirationDate = json['expirationDate'];
    final l$$__typename = json['__typename'];
    return Query$Item$item(
      id: (l$id as String),
      name: (l$name as String),
      imageURL: (l$imageURL as String?),
      categoryId: (l$categoryId as String),
      order: (l$order as int),
      stock: (l$stock as int),
      expirationDate: (l$expirationDate as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String? imageURL;

  final String categoryId;

  final int order;

  final int stock;

  final String? expirationDate;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$imageURL = imageURL;
    _resultData['imageURL'] = l$imageURL;
    final l$categoryId = categoryId;
    _resultData['categoryId'] = l$categoryId;
    final l$order = order;
    _resultData['order'] = l$order;
    final l$stock = stock;
    _resultData['stock'] = l$stock;
    final l$expirationDate = expirationDate;
    _resultData['expirationDate'] = l$expirationDate;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$imageURL = imageURL;
    final l$categoryId = categoryId;
    final l$order = order;
    final l$stock = stock;
    final l$expirationDate = expirationDate;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$imageURL,
      l$categoryId,
      l$order,
      l$stock,
      l$expirationDate,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Item$item || runtimeType != other.runtimeType) {
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
    final l$categoryId = categoryId;
    final lOther$categoryId = other.categoryId;
    if (l$categoryId != lOther$categoryId) {
      return false;
    }
    final l$order = order;
    final lOther$order = other.order;
    if (l$order != lOther$order) {
      return false;
    }
    final l$stock = stock;
    final lOther$stock = other.stock;
    if (l$stock != lOther$stock) {
      return false;
    }
    final l$expirationDate = expirationDate;
    final lOther$expirationDate = other.expirationDate;
    if (l$expirationDate != lOther$expirationDate) {
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

extension UtilityExtension$Query$Item$item on Query$Item$item {
  CopyWith$Query$Item$item<Query$Item$item> get copyWith =>
      CopyWith$Query$Item$item(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Item$item<TRes> {
  factory CopyWith$Query$Item$item(
    Query$Item$item instance,
    TRes Function(Query$Item$item) then,
  ) = _CopyWithImpl$Query$Item$item;

  factory CopyWith$Query$Item$item.stub(TRes res) =
      _CopyWithStubImpl$Query$Item$item;

  TRes call({
    String? id,
    String? name,
    String? imageURL,
    String? categoryId,
    int? order,
    int? stock,
    String? expirationDate,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Item$item<TRes>
    implements CopyWith$Query$Item$item<TRes> {
  _CopyWithImpl$Query$Item$item(
    this._instance,
    this._then,
  );

  final Query$Item$item _instance;

  final TRes Function(Query$Item$item) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? imageURL = _undefined,
    Object? categoryId = _undefined,
    Object? order = _undefined,
    Object? stock = _undefined,
    Object? expirationDate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Item$item(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        imageURL:
            imageURL == _undefined ? _instance.imageURL : (imageURL as String?),
        categoryId: categoryId == _undefined || categoryId == null
            ? _instance.categoryId
            : (categoryId as String),
        order: order == _undefined || order == null
            ? _instance.order
            : (order as int),
        stock: stock == _undefined || stock == null
            ? _instance.stock
            : (stock as int),
        expirationDate: expirationDate == _undefined
            ? _instance.expirationDate
            : (expirationDate as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$Item$item<TRes>
    implements CopyWith$Query$Item$item<TRes> {
  _CopyWithStubImpl$Query$Item$item(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? imageURL,
    String? categoryId,
    int? order,
    int? stock,
    String? expirationDate,
    String? $__typename,
  }) =>
      _res;
}
