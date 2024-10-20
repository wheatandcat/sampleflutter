import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Mutation$Buying {
  Mutation$Buying({
    required this.buying,
    this.$__typename = 'Mutation',
  });

  factory Mutation$Buying.fromJson(Map<String, dynamic> json) {
    final l$buying = json['buying'];
    final l$$__typename = json['__typename'];
    return Mutation$Buying(
      buying: (l$buying as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool buying;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$buying = buying;
    resultData['buying'] = l$buying;
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$buying = buying;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$buying,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$Buying || runtimeType != other.runtimeType) {
      return false;
    }
    final l$buying = buying;
    final lOther$buying = other.buying;
    if (l$buying != lOther$buying) {
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

extension UtilityExtension$Mutation$Buying on Mutation$Buying {
  CopyWith$Mutation$Buying<Mutation$Buying> get copyWith =>
      CopyWith$Mutation$Buying(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$Buying<TRes> {
  factory CopyWith$Mutation$Buying(
    Mutation$Buying instance,
    TRes Function(Mutation$Buying) then,
  ) = _CopyWithImpl$Mutation$Buying;

  factory CopyWith$Mutation$Buying.stub(TRes res) =
      _CopyWithStubImpl$Mutation$Buying;

  TRes call({
    bool? buying,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$Buying<TRes>
    implements CopyWith$Mutation$Buying<TRes> {
  _CopyWithImpl$Mutation$Buying(
    this._instance,
    this._then,
  );

  final Mutation$Buying _instance;

  final TRes Function(Mutation$Buying) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? buying = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$Buying(
        buying: buying == _undefined || buying == null
            ? _instance.buying
            : (buying as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$Buying<TRes>
    implements CopyWith$Mutation$Buying<TRes> {
  _CopyWithStubImpl$Mutation$Buying(this._res);

  final TRes _res;

  @override
  call({
    bool? buying,
    String? $__typename,
  }) =>
      _res;
}

const documentNodeMutationBuying = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'Buying'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'buying'),
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
]);
Mutation$Buying _parserFn$Mutation$Buying(Map<String, dynamic> data) =>
    Mutation$Buying.fromJson(data);
typedef OnMutationCompleted$Mutation$Buying = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$Buying?,
);

class Options$Mutation$Buying extends graphql.MutationOptions<Mutation$Buying> {
  Options$Mutation$Buying({
    super.operationName,
    super.fetchPolicy,
    super.errorPolicy,
    super.cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$Buying? typedOptimisticResult,
    super.context,
    OnMutationCompleted$Mutation$Buying? onCompleted,
    super.update,
    super.onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$Buying(data),
                  ),
          document: documentNodeMutationBuying,
          parserFn: _parserFn$Mutation$Buying,
        );

  final OnMutationCompleted$Mutation$Buying? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$Buying
    extends graphql.WatchQueryOptions<Mutation$Buying> {
  WatchOptions$Mutation$Buying({
    super.operationName,
    super.fetchPolicy,
    super.errorPolicy,
    super.cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$Buying? typedOptimisticResult,
    super.context,
    super.pollInterval,
    super.eagerlyFetchResults,
    super.carryForwardDataOnException,
    super.fetchResults,
  }) : super(
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          document: documentNodeMutationBuying,
          parserFn: _parserFn$Mutation$Buying,
        );
}

extension ClientExtension$Mutation$Buying on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$Buying>> mutate$Buying(
          [Options$Mutation$Buying? options]) async =>
      await mutate(options ?? Options$Mutation$Buying());
  graphql.ObservableQuery<Mutation$Buying> watchMutation$Buying(
          [WatchOptions$Mutation$Buying? options]) =>
      watchMutation(options ?? WatchOptions$Mutation$Buying());
}

class Mutation$Buying$HookResult {
  Mutation$Buying$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$Buying runMutation;

  final graphql.QueryResult<Mutation$Buying> result;
}

Mutation$Buying$HookResult useMutation$Buying(
    [WidgetOptions$Mutation$Buying? options]) {
  final result =
      graphql_flutter.useMutation(options ?? WidgetOptions$Mutation$Buying());
  return Mutation$Buying$HookResult(
    ({optimisticResult, typedOptimisticResult}) => result.runMutation(
      const {},
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$Buying> useWatchMutation$Buying(
        [WatchOptions$Mutation$Buying? options]) =>
    graphql_flutter.useWatchMutation(options ?? WatchOptions$Mutation$Buying());

class WidgetOptions$Mutation$Buying
    extends graphql.MutationOptions<Mutation$Buying> {
  WidgetOptions$Mutation$Buying({
    super.operationName,
    super.fetchPolicy,
    super.errorPolicy,
    super.cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$Buying? typedOptimisticResult,
    super.context,
    OnMutationCompleted$Mutation$Buying? onCompleted,
    super.update,
    super.onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$Buying(data),
                  ),
          document: documentNodeMutationBuying,
          parserFn: _parserFn$Mutation$Buying,
        );

  final OnMutationCompleted$Mutation$Buying? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$Buying = graphql.MultiSourceResult<Mutation$Buying>
    Function({
  Object? optimisticResult,
  Mutation$Buying? typedOptimisticResult,
});
typedef Builder$Mutation$Buying = widgets.Widget Function(
  RunMutation$Mutation$Buying,
  graphql.QueryResult<Mutation$Buying>?,
);

class Mutation$Buying$Widget extends graphql_flutter.Mutation<Mutation$Buying> {
  Mutation$Buying$Widget({
    super.key,
    WidgetOptions$Mutation$Buying? options,
    required Builder$Mutation$Buying builder,
  }) : super(
          options: options ?? WidgetOptions$Mutation$Buying(),
          builder: (
            run,
            result,
          ) =>
              builder(
            ({
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              const {},
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}
