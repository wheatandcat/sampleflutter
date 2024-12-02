import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'schema.graphql.dart';

class Variables$Mutation$CreateItem {
  factory Variables$Mutation$CreateItem({required Input$NewItem input}) =>
      Variables$Mutation$CreateItem._({
        r'input': input,
      });

  Variables$Mutation$CreateItem._(this._$data);

  factory Variables$Mutation$CreateItem.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] =
        Input$NewItem.fromJson((l$input as Map<String, dynamic>));
    return Variables$Mutation$CreateItem._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$NewItem get input => (_$data['input'] as Input$NewItem);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$CreateItem<Variables$Mutation$CreateItem>
      get copyWith => CopyWith$Variables$Mutation$CreateItem(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$CreateItem) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$input = input;
    return Object.hashAll([l$input]);
  }
}

abstract class CopyWith$Variables$Mutation$CreateItem<TRes> {
  factory CopyWith$Variables$Mutation$CreateItem(
    Variables$Mutation$CreateItem instance,
    TRes Function(Variables$Mutation$CreateItem) then,
  ) = _CopyWithImpl$Variables$Mutation$CreateItem;

  factory CopyWith$Variables$Mutation$CreateItem.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CreateItem;

  TRes call({Input$NewItem? input});
}

class _CopyWithImpl$Variables$Mutation$CreateItem<TRes>
    implements CopyWith$Variables$Mutation$CreateItem<TRes> {
  _CopyWithImpl$Variables$Mutation$CreateItem(
    this._instance,
    this._then,
  );

  final Variables$Mutation$CreateItem _instance;

  final TRes Function(Variables$Mutation$CreateItem) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) =>
      _then(Variables$Mutation$CreateItem._({
        ..._instance._$data,
        if (input != _undefined && input != null)
          'input': (input as Input$NewItem),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$CreateItem<TRes>
    implements CopyWith$Variables$Mutation$CreateItem<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CreateItem(this._res);

  TRes _res;

  call({Input$NewItem? input}) => _res;
}

class Mutation$CreateItem {
  Mutation$CreateItem({
    required this.createItem,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CreateItem.fromJson(Map<String, dynamic> json) {
    final l$createItem = json['createItem'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateItem(
      createItem: Mutation$CreateItem$createItem.fromJson(
          (l$createItem as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateItem$createItem createItem;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createItem = createItem;
    _resultData['createItem'] = l$createItem.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createItem = createItem;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$createItem,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$CreateItem) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$createItem = createItem;
    final lOther$createItem = other.createItem;
    if (l$createItem != lOther$createItem) {
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

extension UtilityExtension$Mutation$CreateItem on Mutation$CreateItem {
  CopyWith$Mutation$CreateItem<Mutation$CreateItem> get copyWith =>
      CopyWith$Mutation$CreateItem(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$CreateItem<TRes> {
  factory CopyWith$Mutation$CreateItem(
    Mutation$CreateItem instance,
    TRes Function(Mutation$CreateItem) then,
  ) = _CopyWithImpl$Mutation$CreateItem;

  factory CopyWith$Mutation$CreateItem.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateItem;

  TRes call({
    Mutation$CreateItem$createItem? createItem,
    String? $__typename,
  });
  CopyWith$Mutation$CreateItem$createItem<TRes> get createItem;
}

class _CopyWithImpl$Mutation$CreateItem<TRes>
    implements CopyWith$Mutation$CreateItem<TRes> {
  _CopyWithImpl$Mutation$CreateItem(
    this._instance,
    this._then,
  );

  final Mutation$CreateItem _instance;

  final TRes Function(Mutation$CreateItem) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createItem = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateItem(
        createItem: createItem == _undefined || createItem == null
            ? _instance.createItem
            : (createItem as Mutation$CreateItem$createItem),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$CreateItem$createItem<TRes> get createItem {
    final local$createItem = _instance.createItem;
    return CopyWith$Mutation$CreateItem$createItem(
        local$createItem, (e) => call(createItem: e));
  }
}

class _CopyWithStubImpl$Mutation$CreateItem<TRes>
    implements CopyWith$Mutation$CreateItem<TRes> {
  _CopyWithStubImpl$Mutation$CreateItem(this._res);

  TRes _res;

  call({
    Mutation$CreateItem$createItem? createItem,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$CreateItem$createItem<TRes> get createItem =>
      CopyWith$Mutation$CreateItem$createItem.stub(_res);
}

const documentNodeMutationCreateItem = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'CreateItem'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'NewItem'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'createItem'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
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
            name: NameNode(value: 'categoryId'),
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
Mutation$CreateItem _parserFn$Mutation$CreateItem(Map<String, dynamic> data) =>
    Mutation$CreateItem.fromJson(data);
typedef OnMutationCompleted$Mutation$CreateItem = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$CreateItem?,
);

class Options$Mutation$CreateItem
    extends graphql.MutationOptions<Mutation$CreateItem> {
  Options$Mutation$CreateItem({
    String? operationName,
    required Variables$Mutation$CreateItem variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateItem? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateItem? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateItem>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$CreateItem(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCreateItem,
          parserFn: _parserFn$Mutation$CreateItem,
        );

  final OnMutationCompleted$Mutation$CreateItem? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$CreateItem
    extends graphql.WatchQueryOptions<Mutation$CreateItem> {
  WatchOptions$Mutation$CreateItem({
    String? operationName,
    required Variables$Mutation$CreateItem variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateItem? typedOptimisticResult,
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
          document: documentNodeMutationCreateItem,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$CreateItem,
        );
}

extension ClientExtension$Mutation$CreateItem on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CreateItem>> mutate$CreateItem(
          Options$Mutation$CreateItem options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$CreateItem> watchMutation$CreateItem(
          WatchOptions$Mutation$CreateItem options) =>
      this.watchMutation(options);
}

class Mutation$CreateItem$HookResult {
  Mutation$CreateItem$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$CreateItem runMutation;

  final graphql.QueryResult<Mutation$CreateItem> result;
}

Mutation$CreateItem$HookResult useMutation$CreateItem(
    [WidgetOptions$Mutation$CreateItem? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$CreateItem());
  return Mutation$CreateItem$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$CreateItem> useWatchMutation$CreateItem(
        WatchOptions$Mutation$CreateItem options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$CreateItem
    extends graphql.MutationOptions<Mutation$CreateItem> {
  WidgetOptions$Mutation$CreateItem({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateItem? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateItem? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateItem>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$CreateItem(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCreateItem,
          parserFn: _parserFn$Mutation$CreateItem,
        );

  final OnMutationCompleted$Mutation$CreateItem? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$CreateItem
    = graphql.MultiSourceResult<Mutation$CreateItem> Function(
  Variables$Mutation$CreateItem, {
  Object? optimisticResult,
  Mutation$CreateItem? typedOptimisticResult,
});
typedef Builder$Mutation$CreateItem = widgets.Widget Function(
  RunMutation$Mutation$CreateItem,
  graphql.QueryResult<Mutation$CreateItem>?,
);

class Mutation$CreateItem$Widget
    extends graphql_flutter.Mutation<Mutation$CreateItem> {
  Mutation$CreateItem$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$CreateItem? options,
    required Builder$Mutation$CreateItem builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$CreateItem(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$CreateItem$createItem {
  Mutation$CreateItem$createItem({
    required this.id,
    required this.name,
    required this.categoryId,
    this.imageURL,
    required this.order,
    required this.stock,
    this.expirationDate,
    this.$__typename = 'Item',
  });

  factory Mutation$CreateItem$createItem.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$categoryId = json['categoryId'];
    final l$imageURL = json['imageURL'];
    final l$order = json['order'];
    final l$stock = json['stock'];
    final l$expirationDate = json['expirationDate'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateItem$createItem(
      id: (l$id as String),
      name: (l$name as String),
      categoryId: (l$categoryId as String),
      imageURL: (l$imageURL as String?),
      order: (l$order as int),
      stock: (l$stock as int),
      expirationDate: (l$expirationDate as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String categoryId;

  final String? imageURL;

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
    final l$categoryId = categoryId;
    _resultData['categoryId'] = l$categoryId;
    final l$imageURL = imageURL;
    _resultData['imageURL'] = l$imageURL;
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
    final l$categoryId = categoryId;
    final l$imageURL = imageURL;
    final l$order = order;
    final l$stock = stock;
    final l$expirationDate = expirationDate;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$categoryId,
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
    if (!(other is Mutation$CreateItem$createItem) ||
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
    final l$categoryId = categoryId;
    final lOther$categoryId = other.categoryId;
    if (l$categoryId != lOther$categoryId) {
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

extension UtilityExtension$Mutation$CreateItem$createItem
    on Mutation$CreateItem$createItem {
  CopyWith$Mutation$CreateItem$createItem<Mutation$CreateItem$createItem>
      get copyWith => CopyWith$Mutation$CreateItem$createItem(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$CreateItem$createItem<TRes> {
  factory CopyWith$Mutation$CreateItem$createItem(
    Mutation$CreateItem$createItem instance,
    TRes Function(Mutation$CreateItem$createItem) then,
  ) = _CopyWithImpl$Mutation$CreateItem$createItem;

  factory CopyWith$Mutation$CreateItem$createItem.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateItem$createItem;

  TRes call({
    String? id,
    String? name,
    String? categoryId,
    String? imageURL,
    int? order,
    int? stock,
    String? expirationDate,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$CreateItem$createItem<TRes>
    implements CopyWith$Mutation$CreateItem$createItem<TRes> {
  _CopyWithImpl$Mutation$CreateItem$createItem(
    this._instance,
    this._then,
  );

  final Mutation$CreateItem$createItem _instance;

  final TRes Function(Mutation$CreateItem$createItem) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? categoryId = _undefined,
    Object? imageURL = _undefined,
    Object? order = _undefined,
    Object? stock = _undefined,
    Object? expirationDate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateItem$createItem(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        categoryId: categoryId == _undefined || categoryId == null
            ? _instance.categoryId
            : (categoryId as String),
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

class _CopyWithStubImpl$Mutation$CreateItem$createItem<TRes>
    implements CopyWith$Mutation$CreateItem$createItem<TRes> {
  _CopyWithStubImpl$Mutation$CreateItem$createItem(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? categoryId,
    String? imageURL,
    int? order,
    int? stock,
    String? expirationDate,
    String? $__typename,
  }) =>
      _res;
}
