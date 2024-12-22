import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Query$SearchItem {
  factory Variables$Query$SearchItem({
    required String name,
    bool? isAnalyze,
  }) =>
      Variables$Query$SearchItem._({
        r'name': name,
        if (isAnalyze != null) r'isAnalyze': isAnalyze,
      });

  Variables$Query$SearchItem._(this._$data);

  factory Variables$Query$SearchItem.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    if (data.containsKey('isAnalyze')) {
      final l$isAnalyze = data['isAnalyze'];
      result$data['isAnalyze'] = (l$isAnalyze as bool?);
    }
    return Variables$Query$SearchItem._(result$data);
  }

  Map<String, dynamic> _$data;

  String get name => (_$data['name'] as String);

  bool? get isAnalyze => (_$data['isAnalyze'] as bool?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$name = name;
    result$data['name'] = l$name;
    if (_$data.containsKey('isAnalyze')) {
      final l$isAnalyze = isAnalyze;
      result$data['isAnalyze'] = l$isAnalyze;
    }
    return result$data;
  }

  CopyWith$Variables$Query$SearchItem<Variables$Query$SearchItem>
      get copyWith => CopyWith$Variables$Query$SearchItem(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$SearchItem ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$isAnalyze = isAnalyze;
    final lOther$isAnalyze = other.isAnalyze;
    if (_$data.containsKey('isAnalyze') !=
        other._$data.containsKey('isAnalyze')) {
      return false;
    }
    if (l$isAnalyze != lOther$isAnalyze) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$isAnalyze = isAnalyze;
    return Object.hashAll([
      l$name,
      _$data.containsKey('isAnalyze') ? l$isAnalyze : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$SearchItem<TRes> {
  factory CopyWith$Variables$Query$SearchItem(
    Variables$Query$SearchItem instance,
    TRes Function(Variables$Query$SearchItem) then,
  ) = _CopyWithImpl$Variables$Query$SearchItem;

  factory CopyWith$Variables$Query$SearchItem.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$SearchItem;

  TRes call({
    String? name,
    bool? isAnalyze,
  });
}

class _CopyWithImpl$Variables$Query$SearchItem<TRes>
    implements CopyWith$Variables$Query$SearchItem<TRes> {
  _CopyWithImpl$Variables$Query$SearchItem(
    this._instance,
    this._then,
  );

  final Variables$Query$SearchItem _instance;

  final TRes Function(Variables$Query$SearchItem) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? name = _undefined,
    Object? isAnalyze = _undefined,
  }) =>
      _then(Variables$Query$SearchItem._({
        ..._instance._$data,
        if (name != _undefined && name != null) 'name': (name as String),
        if (isAnalyze != _undefined) 'isAnalyze': (isAnalyze as bool?),
      }));
}

class _CopyWithStubImpl$Variables$Query$SearchItem<TRes>
    implements CopyWith$Variables$Query$SearchItem<TRes> {
  _CopyWithStubImpl$Variables$Query$SearchItem(this._res);

  final TRes _res;

  @override
  call({
    String? name,
    bool? isAnalyze,
  }) =>
      _res;
}

class Query$SearchItem {
  Query$SearchItem({
    this.searchItem,
    this.$__typename = 'Query',
  });

  factory Query$SearchItem.fromJson(Map<String, dynamic> json) {
    final l$searchItem = json['searchItem'];
    final l$$__typename = json['__typename'];
    return Query$SearchItem(
      searchItem: l$searchItem == null
          ? null
          : Query$SearchItem$searchItem.fromJson(
              (l$searchItem as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$SearchItem$searchItem? searchItem;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$searchItem = searchItem;
    resultData['searchItem'] = l$searchItem?.toJson();
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$searchItem = searchItem;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$searchItem,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$SearchItem || runtimeType != other.runtimeType) {
      return false;
    }
    final l$searchItem = searchItem;
    final lOther$searchItem = other.searchItem;
    if (l$searchItem != lOther$searchItem) {
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

extension UtilityExtension$Query$SearchItem on Query$SearchItem {
  CopyWith$Query$SearchItem<Query$SearchItem> get copyWith =>
      CopyWith$Query$SearchItem(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$SearchItem<TRes> {
  factory CopyWith$Query$SearchItem(
    Query$SearchItem instance,
    TRes Function(Query$SearchItem) then,
  ) = _CopyWithImpl$Query$SearchItem;

  factory CopyWith$Query$SearchItem.stub(TRes res) =
      _CopyWithStubImpl$Query$SearchItem;

  TRes call({
    Query$SearchItem$searchItem? searchItem,
    String? $__typename,
  });
  CopyWith$Query$SearchItem$searchItem<TRes> get searchItem;
}

class _CopyWithImpl$Query$SearchItem<TRes>
    implements CopyWith$Query$SearchItem<TRes> {
  _CopyWithImpl$Query$SearchItem(
    this._instance,
    this._then,
  );

  final Query$SearchItem _instance;

  final TRes Function(Query$SearchItem) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? searchItem = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$SearchItem(
        searchItem: searchItem == _undefined
            ? _instance.searchItem
            : (searchItem as Query$SearchItem$searchItem?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  @override
  CopyWith$Query$SearchItem$searchItem<TRes> get searchItem {
    final local$searchItem = _instance.searchItem;
    return local$searchItem == null
        ? CopyWith$Query$SearchItem$searchItem.stub(_then(_instance))
        : CopyWith$Query$SearchItem$searchItem(
            local$searchItem, (e) => call(searchItem: e));
  }
}

class _CopyWithStubImpl$Query$SearchItem<TRes>
    implements CopyWith$Query$SearchItem<TRes> {
  _CopyWithStubImpl$Query$SearchItem(this._res);

  final TRes _res;

  @override
  call({
    Query$SearchItem$searchItem? searchItem,
    String? $__typename,
  }) =>
      _res;

  @override
  CopyWith$Query$SearchItem$searchItem<TRes> get searchItem =>
      CopyWith$Query$SearchItem$searchItem.stub(_res);
}

const documentNodeQuerySearchItem = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'SearchItem'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'name')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'isAnalyze')),
        type: NamedTypeNode(
          name: NameNode(value: 'Boolean'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: BooleanValueNode(value: false)),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'searchItem'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'name'),
            value: VariableNode(name: NameNode(value: 'name')),
          ),
          ArgumentNode(
            name: NameNode(value: 'isAnalyze'),
            value: VariableNode(name: NameNode(value: 'isAnalyze')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
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
            name: NameNode(value: 'images'),
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
Query$SearchItem _parserFn$Query$SearchItem(Map<String, dynamic> data) =>
    Query$SearchItem.fromJson(data);
typedef OnQueryComplete$Query$SearchItem = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$SearchItem?,
);

class Options$Query$SearchItem extends graphql.QueryOptions<Query$SearchItem> {
  Options$Query$SearchItem({
    String? operationName,
    required Variables$Query$SearchItem variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$SearchItem? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$SearchItem? onComplete,
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
                    data == null ? null : _parserFn$Query$SearchItem(data),
                  ),
          onError: onError,
          document: documentNodeQuerySearchItem,
          parserFn: _parserFn$Query$SearchItem,
        );

  final OnQueryComplete$Query$SearchItem? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$SearchItem
    extends graphql.WatchQueryOptions<Query$SearchItem> {
  WatchOptions$Query$SearchItem({
    String? operationName,
    required Variables$Query$SearchItem variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$SearchItem? typedOptimisticResult,
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
          document: documentNodeQuerySearchItem,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$SearchItem,
        );
}

class FetchMoreOptions$Query$SearchItem extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$SearchItem({
    required super.updateQuery,
    required Variables$Query$SearchItem variables,
  }) : super(
          variables: variables.toJson(),
          document: documentNodeQuerySearchItem,
        );
}

extension ClientExtension$Query$SearchItem on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$SearchItem>> query$SearchItem(
          Options$Query$SearchItem options) async =>
      await query(options);
  graphql.ObservableQuery<Query$SearchItem> watchQuery$SearchItem(
          WatchOptions$Query$SearchItem options) =>
      watchQuery(options);
  void writeQuery$SearchItem({
    required Query$SearchItem data,
    required Variables$Query$SearchItem variables,
    bool broadcast = true,
  }) =>
      writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQuerySearchItem),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$SearchItem? readQuery$SearchItem({
    required Variables$Query$SearchItem variables,
    bool optimistic = true,
  }) {
    final result = readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQuerySearchItem),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$SearchItem.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$SearchItem> useQuery$SearchItem(
        Options$Query$SearchItem options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$SearchItem> useWatchQuery$SearchItem(
        WatchOptions$Query$SearchItem options) =>
    graphql_flutter.useWatchQuery(options);

class Query$SearchItem$Widget extends graphql_flutter.Query<Query$SearchItem> {
  const Query$SearchItem$Widget({
    widgets.Key? key,
    required Options$Query$SearchItem options,
    required graphql_flutter.QueryBuilder<Query$SearchItem> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$SearchItem$searchItem {
  Query$SearchItem$searchItem({
    required this.name,
    this.imageURL,
    this.images,
    this.$__typename = 'SearchItem',
  });

  factory Query$SearchItem$searchItem.fromJson(Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$imageURL = json['imageURL'];
    final l$images = json['images'];
    final l$$__typename = json['__typename'];
    return Query$SearchItem$searchItem(
      name: (l$name as String),
      imageURL: (l$imageURL as String?),
      images: (l$images as List<dynamic>?)?.map((e) => (e as String?)).toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String name;

  final String? imageURL;

  final List<String?>? images;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$name = name;
    resultData['name'] = l$name;
    final l$imageURL = imageURL;
    resultData['imageURL'] = l$imageURL;
    final l$images = images;
    resultData['images'] = l$images?.map((e) => e).toList();
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$imageURL = imageURL;
    final l$images = images;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$imageURL,
      l$images == null ? null : Object.hashAll(l$images.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$SearchItem$searchItem ||
        runtimeType != other.runtimeType) {
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
    final l$images = images;
    final lOther$images = other.images;
    if (l$images != null && lOther$images != null) {
      if (l$images.length != lOther$images.length) {
        return false;
      }
      for (int i = 0; i < l$images.length; i++) {
        final l$images$entry = l$images[i];
        final lOther$images$entry = lOther$images[i];
        if (l$images$entry != lOther$images$entry) {
          return false;
        }
      }
    } else if (l$images != lOther$images) {
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

extension UtilityExtension$Query$SearchItem$searchItem
    on Query$SearchItem$searchItem {
  CopyWith$Query$SearchItem$searchItem<Query$SearchItem$searchItem>
      get copyWith => CopyWith$Query$SearchItem$searchItem(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$SearchItem$searchItem<TRes> {
  factory CopyWith$Query$SearchItem$searchItem(
    Query$SearchItem$searchItem instance,
    TRes Function(Query$SearchItem$searchItem) then,
  ) = _CopyWithImpl$Query$SearchItem$searchItem;

  factory CopyWith$Query$SearchItem$searchItem.stub(TRes res) =
      _CopyWithStubImpl$Query$SearchItem$searchItem;

  TRes call({
    String? name,
    String? imageURL,
    List<String?>? images,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$SearchItem$searchItem<TRes>
    implements CopyWith$Query$SearchItem$searchItem<TRes> {
  _CopyWithImpl$Query$SearchItem$searchItem(
    this._instance,
    this._then,
  );

  final Query$SearchItem$searchItem _instance;

  final TRes Function(Query$SearchItem$searchItem) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? name = _undefined,
    Object? imageURL = _undefined,
    Object? images = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$SearchItem$searchItem(
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        imageURL:
            imageURL == _undefined ? _instance.imageURL : (imageURL as String?),
        images: images == _undefined
            ? _instance.images
            : (images as List<String?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$SearchItem$searchItem<TRes>
    implements CopyWith$Query$SearchItem$searchItem<TRes> {
  _CopyWithStubImpl$Query$SearchItem$searchItem(this._res);

  final TRes _res;

  @override
  call({
    String? name,
    String? imageURL,
    List<String?>? images,
    String? $__typename,
  }) =>
      _res;
}
