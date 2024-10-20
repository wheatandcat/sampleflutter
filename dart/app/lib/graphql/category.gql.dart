import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Query$Category {
  factory Variables$Query$Category({required int id}) =>
      Variables$Query$Category._({
        r'id': id,
      });

  Variables$Query$Category._(this._$data);

  factory Variables$Query$Category.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    return Variables$Query$Category._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$Category<Variables$Query$Category> get copyWith =>
      CopyWith$Variables$Query$Category(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$Category ||
        runtimeType != other.runtimeType) {
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

abstract class CopyWith$Variables$Query$Category<TRes> {
  factory CopyWith$Variables$Query$Category(
    Variables$Query$Category instance,
    TRes Function(Variables$Query$Category) then,
  ) = _CopyWithImpl$Variables$Query$Category;

  factory CopyWith$Variables$Query$Category.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$Category;

  TRes call({int? id});
}

class _CopyWithImpl$Variables$Query$Category<TRes>
    implements CopyWith$Variables$Query$Category<TRes> {
  _CopyWithImpl$Variables$Query$Category(
    this._instance,
    this._then,
  );

  final Variables$Query$Category _instance;

  final TRes Function(Variables$Query$Category) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({Object? id = _undefined}) => _then(Variables$Query$Category._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$Category<TRes>
    implements CopyWith$Variables$Query$Category<TRes> {
  _CopyWithStubImpl$Variables$Query$Category(this._res);

  final TRes _res;

  @override
  call({int? id}) => _res;
}

class Query$Category {
  Query$Category({
    this.category,
    this.items,
    this.$__typename = 'Query',
  });

  factory Query$Category.fromJson(Map<String, dynamic> json) {
    final l$category = json['category'];
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$Category(
      category: l$category == null
          ? null
          : Query$Category$category.fromJson(
              (l$category as Map<String, dynamic>)),
      items: (l$items as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$Category$items.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$Category$category? category;

  final List<Query$Category$items?>? items;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$category = category;
    resultData['category'] = l$category?.toJson();
    final l$items = items;
    resultData['items'] = l$items?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$category = category;
    final l$items = items;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$category,
      l$items == null ? null : Object.hashAll(l$items.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Category || runtimeType != other.runtimeType) {
      return false;
    }
    final l$category = category;
    final lOther$category = other.category;
    if (l$category != lOther$category) {
      return false;
    }
    final l$items = items;
    final lOther$items = other.items;
    if (l$items != null && lOther$items != null) {
      if (l$items.length != lOther$items.length) {
        return false;
      }
      for (int i = 0; i < l$items.length; i++) {
        final l$items$entry = l$items[i];
        final lOther$items$entry = lOther$items[i];
        if (l$items$entry != lOther$items$entry) {
          return false;
        }
      }
    } else if (l$items != lOther$items) {
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

extension UtilityExtension$Query$Category on Query$Category {
  CopyWith$Query$Category<Query$Category> get copyWith =>
      CopyWith$Query$Category(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Category<TRes> {
  factory CopyWith$Query$Category(
    Query$Category instance,
    TRes Function(Query$Category) then,
  ) = _CopyWithImpl$Query$Category;

  factory CopyWith$Query$Category.stub(TRes res) =
      _CopyWithStubImpl$Query$Category;

  TRes call({
    Query$Category$category? category,
    List<Query$Category$items?>? items,
    String? $__typename,
  });
  CopyWith$Query$Category$category<TRes> get category;
  TRes items(
      Iterable<Query$Category$items?>? Function(
              Iterable<CopyWith$Query$Category$items<Query$Category$items>?>?)
          fn);
}

class _CopyWithImpl$Query$Category<TRes>
    implements CopyWith$Query$Category<TRes> {
  _CopyWithImpl$Query$Category(
    this._instance,
    this._then,
  );

  final Query$Category _instance;

  final TRes Function(Query$Category) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? category = _undefined,
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Category(
        category: category == _undefined
            ? _instance.category
            : (category as Query$Category$category?),
        items: items == _undefined
            ? _instance.items
            : (items as List<Query$Category$items?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  @override
  CopyWith$Query$Category$category<TRes> get category {
    final local$category = _instance.category;
    return local$category == null
        ? CopyWith$Query$Category$category.stub(_then(_instance))
        : CopyWith$Query$Category$category(
            local$category, (e) => call(category: e));
  }

  @override
  TRes items(
          Iterable<Query$Category$items?>? Function(
                  Iterable<
                      CopyWith$Query$Category$items<Query$Category$items>?>?)
              fn) =>
      call(
          items: fn(_instance.items?.map((e) => e == null
              ? null
              : CopyWith$Query$Category$items(
                  e,
                  (i) => i,
                )))?.toList());
}

class _CopyWithStubImpl$Query$Category<TRes>
    implements CopyWith$Query$Category<TRes> {
  _CopyWithStubImpl$Query$Category(this._res);

  final TRes _res;

  @override
  call({
    Query$Category$category? category,
    List<Query$Category$items?>? items,
    String? $__typename,
  }) =>
      _res;

  @override
  CopyWith$Query$Category$category<TRes> get category =>
      CopyWith$Query$Category$category.stub(_res);

  @override
  items(fn) => _res;
}

const documentNodeQueryCategory = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'Category'),
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
        name: NameNode(value: 'category'),
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
            name: NameNode(value: 'order'),
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
        name: NameNode(value: 'items'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'categoryId'),
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
Query$Category _parserFn$Query$Category(Map<String, dynamic> data) =>
    Query$Category.fromJson(data);
typedef OnQueryComplete$Query$Category = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$Category?,
);

class Options$Query$Category extends graphql.QueryOptions<Query$Category> {
  Options$Query$Category({
    super.operationName,
    required Variables$Query$Category variables,
    super.fetchPolicy,
    super.errorPolicy,
    super.cacheRereadPolicy,
    Object? optimisticResult,
    Query$Category? typedOptimisticResult,
    super.pollInterval,
    super.context,
    OnQueryComplete$Query$Category? onComplete,
    super.onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$Category(data),
                  ),
          document: documentNodeQueryCategory,
          parserFn: _parserFn$Query$Category,
        );

  final OnQueryComplete$Query$Category? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$Category
    extends graphql.WatchQueryOptions<Query$Category> {
  WatchOptions$Query$Category({
    super.operationName,
    required Variables$Query$Category variables,
    super.fetchPolicy,
    super.errorPolicy,
    super.cacheRereadPolicy,
    Object? optimisticResult,
    Query$Category? typedOptimisticResult,
    super.context,
    super.pollInterval,
    super.eagerlyFetchResults,
    super.carryForwardDataOnException,
    super.fetchResults,
  }) : super(
          variables: variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          document: documentNodeQueryCategory,
          parserFn: _parserFn$Query$Category,
        );
}

class FetchMoreOptions$Query$Category extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$Category({
    required super.updateQuery,
    required Variables$Query$Category variables,
  }) : super(
          variables: variables.toJson(),
          document: documentNodeQueryCategory,
        );
}

extension ClientExtension$Query$Category on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$Category>> query$Category(
          Options$Query$Category options) async =>
      await query(options);
  graphql.ObservableQuery<Query$Category> watchQuery$Category(
          WatchOptions$Query$Category options) =>
      watchQuery(options);
  void writeQuery$Category({
    required Query$Category data,
    required Variables$Query$Category variables,
    bool broadcast = true,
  }) =>
      writeQuery(
        graphql.Request(
          operation:
              const graphql.Operation(document: documentNodeQueryCategory),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$Category? readQuery$Category({
    required Variables$Query$Category variables,
    bool optimistic = true,
  }) {
    final result = readQuery(
      graphql.Request(
        operation: const graphql.Operation(document: documentNodeQueryCategory),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$Category.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$Category> useQuery$Category(
        Options$Query$Category options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$Category> useWatchQuery$Category(
        WatchOptions$Query$Category options) =>
    graphql_flutter.useWatchQuery(options);

class Query$Category$Widget extends graphql_flutter.Query<Query$Category> {
  const Query$Category$Widget({
    super.key,
    required Options$Query$Category super.options,
    required super.builder,
  });
}

class Query$Category$category {
  Query$Category$category({
    required this.id,
    required this.name,
    this.imageURL,
    required this.order,
    this.$__typename = 'Category',
  });

  factory Query$Category$category.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$imageURL = json['imageURL'];
    final l$order = json['order'];
    final l$$__typename = json['__typename'];
    return Query$Category$category(
      id: (l$id as String),
      name: (l$name as String),
      imageURL: (l$imageURL as String?),
      order: (l$order as int),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String? imageURL;

  final int order;

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
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$imageURL,
      l$order,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Category$category || runtimeType != other.runtimeType) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$Category$category on Query$Category$category {
  CopyWith$Query$Category$category<Query$Category$category> get copyWith =>
      CopyWith$Query$Category$category(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Category$category<TRes> {
  factory CopyWith$Query$Category$category(
    Query$Category$category instance,
    TRes Function(Query$Category$category) then,
  ) = _CopyWithImpl$Query$Category$category;

  factory CopyWith$Query$Category$category.stub(TRes res) =
      _CopyWithStubImpl$Query$Category$category;

  TRes call({
    String? id,
    String? name,
    String? imageURL,
    int? order,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Category$category<TRes>
    implements CopyWith$Query$Category$category<TRes> {
  _CopyWithImpl$Query$Category$category(
    this._instance,
    this._then,
  );

  final Query$Category$category _instance;

  final TRes Function(Query$Category$category) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? imageURL = _undefined,
    Object? order = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Category$category(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        imageURL:
            imageURL == _undefined ? _instance.imageURL : (imageURL as String?),
        order: order == _undefined || order == null
            ? _instance.order
            : (order as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$Category$category<TRes>
    implements CopyWith$Query$Category$category<TRes> {
  _CopyWithStubImpl$Query$Category$category(this._res);

  final TRes _res;

  @override
  call({
    String? id,
    String? name,
    String? imageURL,
    int? order,
    String? $__typename,
  }) =>
      _res;
}

class Query$Category$items {
  Query$Category$items({
    required this.id,
    required this.name,
    this.imageURL,
    required this.order,
    required this.stock,
    this.expirationDate,
    this.$__typename = 'Item',
  });

  factory Query$Category$items.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$imageURL = json['imageURL'];
    final l$order = json['order'];
    final l$stock = json['stock'];
    final l$expirationDate = json['expirationDate'];
    final l$$__typename = json['__typename'];
    return Query$Category$items(
      id: (l$id as String),
      name: (l$name as String),
      imageURL: (l$imageURL as String?),
      order: (l$order as int),
      stock: (l$stock as int),
      expirationDate: (l$expirationDate as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String? imageURL;

  final int order;

  final int stock;

  final String? expirationDate;

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
    final l$stock = stock;
    resultData['stock'] = l$stock;
    final l$expirationDate = expirationDate;
    resultData['expirationDate'] = l$expirationDate;
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
    final l$stock = stock;
    final l$expirationDate = expirationDate;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$imageURL,
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
    if (other is! Query$Category$items || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$Category$items on Query$Category$items {
  CopyWith$Query$Category$items<Query$Category$items> get copyWith =>
      CopyWith$Query$Category$items(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Category$items<TRes> {
  factory CopyWith$Query$Category$items(
    Query$Category$items instance,
    TRes Function(Query$Category$items) then,
  ) = _CopyWithImpl$Query$Category$items;

  factory CopyWith$Query$Category$items.stub(TRes res) =
      _CopyWithStubImpl$Query$Category$items;

  TRes call({
    String? id,
    String? name,
    String? imageURL,
    int? order,
    int? stock,
    String? expirationDate,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Category$items<TRes>
    implements CopyWith$Query$Category$items<TRes> {
  _CopyWithImpl$Query$Category$items(
    this._instance,
    this._then,
  );

  final Query$Category$items _instance;

  final TRes Function(Query$Category$items) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? imageURL = _undefined,
    Object? order = _undefined,
    Object? stock = _undefined,
    Object? expirationDate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Category$items(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        imageURL:
            imageURL == _undefined ? _instance.imageURL : (imageURL as String?),
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

class _CopyWithStubImpl$Query$Category$items<TRes>
    implements CopyWith$Query$Category$items<TRes> {
  _CopyWithStubImpl$Query$Category$items(this._res);

  final TRes _res;

  @override
  call({
    String? id,
    String? name,
    String? imageURL,
    int? order,
    int? stock,
    String? expirationDate,
    String? $__typename,
  }) =>
      _res;
}
