import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$DeleteItem {
  factory Variables$Mutation$DeleteItem({required int id}) =>
      Variables$Mutation$DeleteItem._({
        r'id': id,
      });

  Variables$Mutation$DeleteItem._(this._$data);

  factory Variables$Mutation$DeleteItem.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    return Variables$Mutation$DeleteItem._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Mutation$DeleteItem<Variables$Mutation$DeleteItem>
      get copyWith => CopyWith$Variables$Mutation$DeleteItem(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$DeleteItem ||
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

abstract class CopyWith$Variables$Mutation$DeleteItem<TRes> {
  factory CopyWith$Variables$Mutation$DeleteItem(
    Variables$Mutation$DeleteItem instance,
    TRes Function(Variables$Mutation$DeleteItem) then,
  ) = _CopyWithImpl$Variables$Mutation$DeleteItem;

  factory CopyWith$Variables$Mutation$DeleteItem.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$DeleteItem;

  TRes call({int? id});
}

class _CopyWithImpl$Variables$Mutation$DeleteItem<TRes>
    implements CopyWith$Variables$Mutation$DeleteItem<TRes> {
  _CopyWithImpl$Variables$Mutation$DeleteItem(
    this._instance,
    this._then,
  );

  final Variables$Mutation$DeleteItem _instance;

  final TRes Function(Variables$Mutation$DeleteItem) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Mutation$DeleteItem._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$DeleteItem<TRes>
    implements CopyWith$Variables$Mutation$DeleteItem<TRes> {
  _CopyWithStubImpl$Variables$Mutation$DeleteItem(this._res);

  TRes _res;

  call({int? id}) => _res;
}

class Mutation$DeleteItem {
  Mutation$DeleteItem({
    required this.deleteItem,
    this.$__typename = 'Mutation',
  });

  factory Mutation$DeleteItem.fromJson(Map<String, dynamic> json) {
    final l$deleteItem = json['deleteItem'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteItem(
      deleteItem: Mutation$DeleteItem$deleteItem.fromJson(
          (l$deleteItem as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$DeleteItem$deleteItem deleteItem;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteItem = deleteItem;
    _resultData['deleteItem'] = l$deleteItem.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteItem = deleteItem;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$deleteItem,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DeleteItem || runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteItem = deleteItem;
    final lOther$deleteItem = other.deleteItem;
    if (l$deleteItem != lOther$deleteItem) {
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

extension UtilityExtension$Mutation$DeleteItem on Mutation$DeleteItem {
  CopyWith$Mutation$DeleteItem<Mutation$DeleteItem> get copyWith =>
      CopyWith$Mutation$DeleteItem(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$DeleteItem<TRes> {
  factory CopyWith$Mutation$DeleteItem(
    Mutation$DeleteItem instance,
    TRes Function(Mutation$DeleteItem) then,
  ) = _CopyWithImpl$Mutation$DeleteItem;

  factory CopyWith$Mutation$DeleteItem.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteItem;

  TRes call({
    Mutation$DeleteItem$deleteItem? deleteItem,
    String? $__typename,
  });
  CopyWith$Mutation$DeleteItem$deleteItem<TRes> get deleteItem;
}

class _CopyWithImpl$Mutation$DeleteItem<TRes>
    implements CopyWith$Mutation$DeleteItem<TRes> {
  _CopyWithImpl$Mutation$DeleteItem(
    this._instance,
    this._then,
  );

  final Mutation$DeleteItem _instance;

  final TRes Function(Mutation$DeleteItem) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deleteItem = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$DeleteItem(
        deleteItem: deleteItem == _undefined || deleteItem == null
            ? _instance.deleteItem
            : (deleteItem as Mutation$DeleteItem$deleteItem),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$DeleteItem$deleteItem<TRes> get deleteItem {
    final local$deleteItem = _instance.deleteItem;
    return CopyWith$Mutation$DeleteItem$deleteItem(
        local$deleteItem, (e) => call(deleteItem: e));
  }
}

class _CopyWithStubImpl$Mutation$DeleteItem<TRes>
    implements CopyWith$Mutation$DeleteItem<TRes> {
  _CopyWithStubImpl$Mutation$DeleteItem(this._res);

  TRes _res;

  call({
    Mutation$DeleteItem$deleteItem? deleteItem,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$DeleteItem$deleteItem<TRes> get deleteItem =>
      CopyWith$Mutation$DeleteItem$deleteItem.stub(_res);
}

const documentNodeMutationDeleteItem = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'DeleteItem'),
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
        name: NameNode(value: 'deleteItem'),
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
Mutation$DeleteItem _parserFn$Mutation$DeleteItem(Map<String, dynamic> data) =>
    Mutation$DeleteItem.fromJson(data);
typedef OnMutationCompleted$Mutation$DeleteItem = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$DeleteItem?,
);

class Options$Mutation$DeleteItem
    extends graphql.MutationOptions<Mutation$DeleteItem> {
  Options$Mutation$DeleteItem({
    String? operationName,
    required Variables$Mutation$DeleteItem variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteItem? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteItem? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteItem>? update,
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
                    data == null ? null : _parserFn$Mutation$DeleteItem(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationDeleteItem,
          parserFn: _parserFn$Mutation$DeleteItem,
        );

  final OnMutationCompleted$Mutation$DeleteItem? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$DeleteItem
    extends graphql.WatchQueryOptions<Mutation$DeleteItem> {
  WatchOptions$Mutation$DeleteItem({
    String? operationName,
    required Variables$Mutation$DeleteItem variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteItem? typedOptimisticResult,
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
          document: documentNodeMutationDeleteItem,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$DeleteItem,
        );
}

extension ClientExtension$Mutation$DeleteItem on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$DeleteItem>> mutate$DeleteItem(
          Options$Mutation$DeleteItem options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$DeleteItem> watchMutation$DeleteItem(
          WatchOptions$Mutation$DeleteItem options) =>
      this.watchMutation(options);
}

class Mutation$DeleteItem$HookResult {
  Mutation$DeleteItem$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$DeleteItem runMutation;

  final graphql.QueryResult<Mutation$DeleteItem> result;
}

Mutation$DeleteItem$HookResult useMutation$DeleteItem(
    [WidgetOptions$Mutation$DeleteItem? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$DeleteItem());
  return Mutation$DeleteItem$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$DeleteItem> useWatchMutation$DeleteItem(
        WatchOptions$Mutation$DeleteItem options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$DeleteItem
    extends graphql.MutationOptions<Mutation$DeleteItem> {
  WidgetOptions$Mutation$DeleteItem({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteItem? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteItem? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteItem>? update,
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
                    data == null ? null : _parserFn$Mutation$DeleteItem(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationDeleteItem,
          parserFn: _parserFn$Mutation$DeleteItem,
        );

  final OnMutationCompleted$Mutation$DeleteItem? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$DeleteItem
    = graphql.MultiSourceResult<Mutation$DeleteItem> Function(
  Variables$Mutation$DeleteItem, {
  Object? optimisticResult,
  Mutation$DeleteItem? typedOptimisticResult,
});
typedef Builder$Mutation$DeleteItem = widgets.Widget Function(
  RunMutation$Mutation$DeleteItem,
  graphql.QueryResult<Mutation$DeleteItem>?,
);

class Mutation$DeleteItem$Widget
    extends graphql_flutter.Mutation<Mutation$DeleteItem> {
  Mutation$DeleteItem$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$DeleteItem? options,
    required Builder$Mutation$DeleteItem builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$DeleteItem(),
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

class Mutation$DeleteItem$deleteItem {
  Mutation$DeleteItem$deleteItem({
    required this.id,
    this.$__typename = 'Item',
  });

  factory Mutation$DeleteItem$deleteItem.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteItem$deleteItem(
      id: (l$id as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DeleteItem$deleteItem ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Mutation$DeleteItem$deleteItem
    on Mutation$DeleteItem$deleteItem {
  CopyWith$Mutation$DeleteItem$deleteItem<Mutation$DeleteItem$deleteItem>
      get copyWith => CopyWith$Mutation$DeleteItem$deleteItem(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$DeleteItem$deleteItem<TRes> {
  factory CopyWith$Mutation$DeleteItem$deleteItem(
    Mutation$DeleteItem$deleteItem instance,
    TRes Function(Mutation$DeleteItem$deleteItem) then,
  ) = _CopyWithImpl$Mutation$DeleteItem$deleteItem;

  factory CopyWith$Mutation$DeleteItem$deleteItem.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteItem$deleteItem;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$DeleteItem$deleteItem<TRes>
    implements CopyWith$Mutation$DeleteItem$deleteItem<TRes> {
  _CopyWithImpl$Mutation$DeleteItem$deleteItem(
    this._instance,
    this._then,
  );

  final Mutation$DeleteItem$deleteItem _instance;

  final TRes Function(Mutation$DeleteItem$deleteItem) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$DeleteItem$deleteItem(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$DeleteItem$deleteItem<TRes>
    implements CopyWith$Mutation$DeleteItem$deleteItem<TRes> {
  _CopyWithStubImpl$Mutation$DeleteItem$deleteItem(this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}
