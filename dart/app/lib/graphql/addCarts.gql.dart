import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'schema.graphql.dart';

class Variables$Mutation$AddCarts {
  factory Variables$Mutation$AddCarts({required List<Input$NewCart?> input}) =>
      Variables$Mutation$AddCarts._({
        r'input': input,
      });

  Variables$Mutation$AddCarts._(this._$data);

  factory Variables$Mutation$AddCarts.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = (l$input as List<dynamic>)
        .map((e) => e == null
            ? null
            : Input$NewCart.fromJson((e as Map<String, dynamic>)))
        .toList();
    return Variables$Mutation$AddCarts._(result$data);
  }

  Map<String, dynamic> _$data;

  List<Input$NewCart?> get input => (_$data['input'] as List<Input$NewCart?>);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.map((e) => e?.toJson()).toList();
    return result$data;
  }

  CopyWith$Variables$Mutation$AddCarts<Variables$Mutation$AddCarts>
      get copyWith => CopyWith$Variables$Mutation$AddCarts(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$AddCarts ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input.length != lOther$input.length) {
      return false;
    }
    for (int i = 0; i < l$input.length; i++) {
      final l$input$entry = l$input[i];
      final lOther$input$entry = lOther$input[i];
      if (l$input$entry != lOther$input$entry) {
        return false;
      }
    }
    return true;
  }

  @override
  int get hashCode {
    final l$input = input;
    return Object.hashAll([Object.hashAll(l$input.map((v) => v))]);
  }
}

abstract class CopyWith$Variables$Mutation$AddCarts<TRes> {
  factory CopyWith$Variables$Mutation$AddCarts(
    Variables$Mutation$AddCarts instance,
    TRes Function(Variables$Mutation$AddCarts) then,
  ) = _CopyWithImpl$Variables$Mutation$AddCarts;

  factory CopyWith$Variables$Mutation$AddCarts.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$AddCarts;

  TRes call({List<Input$NewCart?>? input});
}

class _CopyWithImpl$Variables$Mutation$AddCarts<TRes>
    implements CopyWith$Variables$Mutation$AddCarts<TRes> {
  _CopyWithImpl$Variables$Mutation$AddCarts(
    this._instance,
    this._then,
  );

  final Variables$Mutation$AddCarts _instance;

  final TRes Function(Variables$Mutation$AddCarts) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) =>
      _then(Variables$Mutation$AddCarts._({
        ..._instance._$data,
        if (input != _undefined && input != null)
          'input': (input as List<Input$NewCart?>),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$AddCarts<TRes>
    implements CopyWith$Variables$Mutation$AddCarts<TRes> {
  _CopyWithStubImpl$Variables$Mutation$AddCarts(this._res);

  TRes _res;

  call({List<Input$NewCart?>? input}) => _res;
}

class Mutation$AddCarts {
  Mutation$AddCarts({
    required this.addCarts,
    this.$__typename = 'Mutation',
  });

  factory Mutation$AddCarts.fromJson(Map<String, dynamic> json) {
    final l$addCarts = json['addCarts'];
    final l$$__typename = json['__typename'];
    return Mutation$AddCarts(
      addCarts: (l$addCarts as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool addCarts;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$addCarts = addCarts;
    _resultData['addCarts'] = l$addCarts;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$addCarts = addCarts;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$addCarts,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$AddCarts || runtimeType != other.runtimeType) {
      return false;
    }
    final l$addCarts = addCarts;
    final lOther$addCarts = other.addCarts;
    if (l$addCarts != lOther$addCarts) {
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

extension UtilityExtension$Mutation$AddCarts on Mutation$AddCarts {
  CopyWith$Mutation$AddCarts<Mutation$AddCarts> get copyWith =>
      CopyWith$Mutation$AddCarts(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$AddCarts<TRes> {
  factory CopyWith$Mutation$AddCarts(
    Mutation$AddCarts instance,
    TRes Function(Mutation$AddCarts) then,
  ) = _CopyWithImpl$Mutation$AddCarts;

  factory CopyWith$Mutation$AddCarts.stub(TRes res) =
      _CopyWithStubImpl$Mutation$AddCarts;

  TRes call({
    bool? addCarts,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$AddCarts<TRes>
    implements CopyWith$Mutation$AddCarts<TRes> {
  _CopyWithImpl$Mutation$AddCarts(
    this._instance,
    this._then,
  );

  final Mutation$AddCarts _instance;

  final TRes Function(Mutation$AddCarts) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? addCarts = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$AddCarts(
        addCarts: addCarts == _undefined || addCarts == null
            ? _instance.addCarts
            : (addCarts as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$AddCarts<TRes>
    implements CopyWith$Mutation$AddCarts<TRes> {
  _CopyWithStubImpl$Mutation$AddCarts(this._res);

  TRes _res;

  call({
    bool? addCarts,
    String? $__typename,
  }) =>
      _res;
}

const documentNodeMutationAddCarts = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'AddCarts'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: ListTypeNode(
          type: NamedTypeNode(
            name: NameNode(value: 'NewCart'),
            isNonNull: false,
          ),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'addCarts'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          )
        ],
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
]);
Mutation$AddCarts _parserFn$Mutation$AddCarts(Map<String, dynamic> data) =>
    Mutation$AddCarts.fromJson(data);
typedef OnMutationCompleted$Mutation$AddCarts = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$AddCarts?,
);

class Options$Mutation$AddCarts
    extends graphql.MutationOptions<Mutation$AddCarts> {
  Options$Mutation$AddCarts({
    String? operationName,
    required Variables$Mutation$AddCarts variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$AddCarts? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$AddCarts? onCompleted,
    graphql.OnMutationUpdate<Mutation$AddCarts>? update,
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
                    data == null ? null : _parserFn$Mutation$AddCarts(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationAddCarts,
          parserFn: _parserFn$Mutation$AddCarts,
        );

  final OnMutationCompleted$Mutation$AddCarts? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$AddCarts
    extends graphql.WatchQueryOptions<Mutation$AddCarts> {
  WatchOptions$Mutation$AddCarts({
    String? operationName,
    required Variables$Mutation$AddCarts variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$AddCarts? typedOptimisticResult,
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
          document: documentNodeMutationAddCarts,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$AddCarts,
        );
}

extension ClientExtension$Mutation$AddCarts on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$AddCarts>> mutate$AddCarts(
          Options$Mutation$AddCarts options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$AddCarts> watchMutation$AddCarts(
          WatchOptions$Mutation$AddCarts options) =>
      this.watchMutation(options);
}

class Mutation$AddCarts$HookResult {
  Mutation$AddCarts$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$AddCarts runMutation;

  final graphql.QueryResult<Mutation$AddCarts> result;
}

Mutation$AddCarts$HookResult useMutation$AddCarts(
    [WidgetOptions$Mutation$AddCarts? options]) {
  final result =
      graphql_flutter.useMutation(options ?? WidgetOptions$Mutation$AddCarts());
  return Mutation$AddCarts$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$AddCarts> useWatchMutation$AddCarts(
        WatchOptions$Mutation$AddCarts options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$AddCarts
    extends graphql.MutationOptions<Mutation$AddCarts> {
  WidgetOptions$Mutation$AddCarts({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$AddCarts? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$AddCarts? onCompleted,
    graphql.OnMutationUpdate<Mutation$AddCarts>? update,
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
                    data == null ? null : _parserFn$Mutation$AddCarts(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationAddCarts,
          parserFn: _parserFn$Mutation$AddCarts,
        );

  final OnMutationCompleted$Mutation$AddCarts? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$AddCarts
    = graphql.MultiSourceResult<Mutation$AddCarts> Function(
  Variables$Mutation$AddCarts, {
  Object? optimisticResult,
  Mutation$AddCarts? typedOptimisticResult,
});
typedef Builder$Mutation$AddCarts = widgets.Widget Function(
  RunMutation$Mutation$AddCarts,
  graphql.QueryResult<Mutation$AddCarts>?,
);

class Mutation$AddCarts$Widget
    extends graphql_flutter.Mutation<Mutation$AddCarts> {
  Mutation$AddCarts$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$AddCarts? options,
    required Builder$Mutation$AddCarts builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$AddCarts(),
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
