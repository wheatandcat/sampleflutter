import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'schema.graphql.dart';

class Variables$Mutation$UpdateItem {
  factory Variables$Mutation$UpdateItem({required Input$UpdateItem input}) =>
      Variables$Mutation$UpdateItem._({
        r'input': input,
      });

  Variables$Mutation$UpdateItem._(this._$data);

  factory Variables$Mutation$UpdateItem.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] =
        Input$UpdateItem.fromJson((l$input as Map<String, dynamic>));
    return Variables$Mutation$UpdateItem._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$UpdateItem get input => (_$data['input'] as Input$UpdateItem);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$UpdateItem<Variables$Mutation$UpdateItem>
      get copyWith => CopyWith$Variables$Mutation$UpdateItem(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$UpdateItem ||
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

abstract class CopyWith$Variables$Mutation$UpdateItem<TRes> {
  factory CopyWith$Variables$Mutation$UpdateItem(
    Variables$Mutation$UpdateItem instance,
    TRes Function(Variables$Mutation$UpdateItem) then,
  ) = _CopyWithImpl$Variables$Mutation$UpdateItem;

  factory CopyWith$Variables$Mutation$UpdateItem.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UpdateItem;

  TRes call({Input$UpdateItem? input});
}

class _CopyWithImpl$Variables$Mutation$UpdateItem<TRes>
    implements CopyWith$Variables$Mutation$UpdateItem<TRes> {
  _CopyWithImpl$Variables$Mutation$UpdateItem(
    this._instance,
    this._then,
  );

  final Variables$Mutation$UpdateItem _instance;

  final TRes Function(Variables$Mutation$UpdateItem) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({Object? input = _undefined}) =>
      _then(Variables$Mutation$UpdateItem._({
        ..._instance._$data,
        if (input != _undefined && input != null)
          'input': (input as Input$UpdateItem),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$UpdateItem<TRes>
    implements CopyWith$Variables$Mutation$UpdateItem<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UpdateItem(this._res);

  final TRes _res;

  @override
  call({Input$UpdateItem? input}) => _res;
}

class Mutation$UpdateItem {
  Mutation$UpdateItem({
    required this.updateItem,
    this.$__typename = 'Mutation',
  });

  factory Mutation$UpdateItem.fromJson(Map<String, dynamic> json) {
    final l$updateItem = json['updateItem'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateItem(
      updateItem: Mutation$UpdateItem$updateItem.fromJson(
          (l$updateItem as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdateItem$updateItem updateItem;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$updateItem = updateItem;
    resultData['updateItem'] = l$updateItem.toJson();
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$updateItem = updateItem;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$updateItem,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateItem || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateItem = updateItem;
    final lOther$updateItem = other.updateItem;
    if (l$updateItem != lOther$updateItem) {
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

extension UtilityExtension$Mutation$UpdateItem on Mutation$UpdateItem {
  CopyWith$Mutation$UpdateItem<Mutation$UpdateItem> get copyWith =>
      CopyWith$Mutation$UpdateItem(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$UpdateItem<TRes> {
  factory CopyWith$Mutation$UpdateItem(
    Mutation$UpdateItem instance,
    TRes Function(Mutation$UpdateItem) then,
  ) = _CopyWithImpl$Mutation$UpdateItem;

  factory CopyWith$Mutation$UpdateItem.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateItem;

  TRes call({
    Mutation$UpdateItem$updateItem? updateItem,
    String? $__typename,
  });
  CopyWith$Mutation$UpdateItem$updateItem<TRes> get updateItem;
}

class _CopyWithImpl$Mutation$UpdateItem<TRes>
    implements CopyWith$Mutation$UpdateItem<TRes> {
  _CopyWithImpl$Mutation$UpdateItem(
    this._instance,
    this._then,
  );

  final Mutation$UpdateItem _instance;

  final TRes Function(Mutation$UpdateItem) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? updateItem = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdateItem(
        updateItem: updateItem == _undefined || updateItem == null
            ? _instance.updateItem
            : (updateItem as Mutation$UpdateItem$updateItem),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  @override
  CopyWith$Mutation$UpdateItem$updateItem<TRes> get updateItem {
    final local$updateItem = _instance.updateItem;
    return CopyWith$Mutation$UpdateItem$updateItem(
        local$updateItem, (e) => call(updateItem: e));
  }
}

class _CopyWithStubImpl$Mutation$UpdateItem<TRes>
    implements CopyWith$Mutation$UpdateItem<TRes> {
  _CopyWithStubImpl$Mutation$UpdateItem(this._res);

  final TRes _res;

  @override
  call({
    Mutation$UpdateItem$updateItem? updateItem,
    String? $__typename,
  }) =>
      _res;

  @override
  CopyWith$Mutation$UpdateItem$updateItem<TRes> get updateItem =>
      CopyWith$Mutation$UpdateItem$updateItem.stub(_res);
}

const documentNodeMutationUpdateItem = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'UpdateItem'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'UpdateItem'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'updateItem'),
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
Mutation$UpdateItem _parserFn$Mutation$UpdateItem(Map<String, dynamic> data) =>
    Mutation$UpdateItem.fromJson(data);
typedef OnMutationCompleted$Mutation$UpdateItem = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$UpdateItem?,
);

class Options$Mutation$UpdateItem
    extends graphql.MutationOptions<Mutation$UpdateItem> {
  Options$Mutation$UpdateItem({
    super.operationName,
    required Variables$Mutation$UpdateItem variables,
    super.fetchPolicy,
    super.errorPolicy,
    super.cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateItem? typedOptimisticResult,
    super.context,
    OnMutationCompleted$Mutation$UpdateItem? onCompleted,
    super.update,
    super.onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$UpdateItem(data),
                  ),
          document: documentNodeMutationUpdateItem,
          parserFn: _parserFn$Mutation$UpdateItem,
        );

  final OnMutationCompleted$Mutation$UpdateItem? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$UpdateItem
    extends graphql.WatchQueryOptions<Mutation$UpdateItem> {
  WatchOptions$Mutation$UpdateItem({
    super.operationName,
    required Variables$Mutation$UpdateItem variables,
    super.fetchPolicy,
    super.errorPolicy,
    super.cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateItem? typedOptimisticResult,
    super.context,
    super.pollInterval,
    super.eagerlyFetchResults,
    super.carryForwardDataOnException,
    super.fetchResults,
  }) : super(
          variables: variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          document: documentNodeMutationUpdateItem,
          parserFn: _parserFn$Mutation$UpdateItem,
        );
}

extension ClientExtension$Mutation$UpdateItem on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UpdateItem>> mutate$UpdateItem(
          Options$Mutation$UpdateItem options) async =>
      await mutate(options);
  graphql.ObservableQuery<Mutation$UpdateItem> watchMutation$UpdateItem(
          WatchOptions$Mutation$UpdateItem options) =>
      watchMutation(options);
}

class Mutation$UpdateItem$HookResult {
  Mutation$UpdateItem$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$UpdateItem runMutation;

  final graphql.QueryResult<Mutation$UpdateItem> result;
}

Mutation$UpdateItem$HookResult useMutation$UpdateItem(
    [WidgetOptions$Mutation$UpdateItem? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$UpdateItem());
  return Mutation$UpdateItem$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$UpdateItem> useWatchMutation$UpdateItem(
        WatchOptions$Mutation$UpdateItem options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$UpdateItem
    extends graphql.MutationOptions<Mutation$UpdateItem> {
  WidgetOptions$Mutation$UpdateItem({
    super.operationName,
    super.fetchPolicy,
    super.errorPolicy,
    super.cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateItem? typedOptimisticResult,
    super.context,
    OnMutationCompleted$Mutation$UpdateItem? onCompleted,
    super.update,
    super.onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$UpdateItem(data),
                  ),
          document: documentNodeMutationUpdateItem,
          parserFn: _parserFn$Mutation$UpdateItem,
        );

  final OnMutationCompleted$Mutation$UpdateItem? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$UpdateItem
    = graphql.MultiSourceResult<Mutation$UpdateItem> Function(
  Variables$Mutation$UpdateItem, {
  Object? optimisticResult,
  Mutation$UpdateItem? typedOptimisticResult,
});
typedef Builder$Mutation$UpdateItem = widgets.Widget Function(
  RunMutation$Mutation$UpdateItem,
  graphql.QueryResult<Mutation$UpdateItem>?,
);

class Mutation$UpdateItem$Widget
    extends graphql_flutter.Mutation<Mutation$UpdateItem> {
  Mutation$UpdateItem$Widget({
    super.key,
    WidgetOptions$Mutation$UpdateItem? options,
    required Builder$Mutation$UpdateItem builder,
  }) : super(
          options: options ?? WidgetOptions$Mutation$UpdateItem(),
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

class Mutation$UpdateItem$updateItem {
  Mutation$UpdateItem$updateItem({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.order,
    required this.stock,
    this.expirationDate,
    this.$__typename = 'Item',
  });

  factory Mutation$UpdateItem$updateItem.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$categoryId = json['categoryId'];
    final l$order = json['order'];
    final l$stock = json['stock'];
    final l$expirationDate = json['expirationDate'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateItem$updateItem(
      id: (l$id as String),
      name: (l$name as String),
      categoryId: (l$categoryId as String),
      order: (l$order as int),
      stock: (l$stock as int),
      expirationDate: (l$expirationDate as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String categoryId;

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
    final l$categoryId = categoryId;
    resultData['categoryId'] = l$categoryId;
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
    final l$categoryId = categoryId;
    final l$order = order;
    final l$stock = stock;
    final l$expirationDate = expirationDate;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
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
    if (other is! Mutation$UpdateItem$updateItem ||
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

extension UtilityExtension$Mutation$UpdateItem$updateItem
    on Mutation$UpdateItem$updateItem {
  CopyWith$Mutation$UpdateItem$updateItem<Mutation$UpdateItem$updateItem>
      get copyWith => CopyWith$Mutation$UpdateItem$updateItem(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UpdateItem$updateItem<TRes> {
  factory CopyWith$Mutation$UpdateItem$updateItem(
    Mutation$UpdateItem$updateItem instance,
    TRes Function(Mutation$UpdateItem$updateItem) then,
  ) = _CopyWithImpl$Mutation$UpdateItem$updateItem;

  factory CopyWith$Mutation$UpdateItem$updateItem.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateItem$updateItem;

  TRes call({
    String? id,
    String? name,
    String? categoryId,
    int? order,
    int? stock,
    String? expirationDate,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$UpdateItem$updateItem<TRes>
    implements CopyWith$Mutation$UpdateItem$updateItem<TRes> {
  _CopyWithImpl$Mutation$UpdateItem$updateItem(
    this._instance,
    this._then,
  );

  final Mutation$UpdateItem$updateItem _instance;

  final TRes Function(Mutation$UpdateItem$updateItem) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? categoryId = _undefined,
    Object? order = _undefined,
    Object? stock = _undefined,
    Object? expirationDate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdateItem$updateItem(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
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

class _CopyWithStubImpl$Mutation$UpdateItem$updateItem<TRes>
    implements CopyWith$Mutation$UpdateItem$updateItem<TRes> {
  _CopyWithStubImpl$Mutation$UpdateItem$updateItem(this._res);

  final TRes _res;

  @override
  call({
    String? id,
    String? name,
    String? categoryId,
    int? order,
    int? stock,
    String? expirationDate,
    String? $__typename,
  }) =>
      _res;
}
