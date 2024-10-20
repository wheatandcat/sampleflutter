import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Mutation$LogoutGuest {
  Mutation$LogoutGuest({
    required this.logoutGuest,
    this.$__typename = 'Mutation',
  });

  factory Mutation$LogoutGuest.fromJson(Map<String, dynamic> json) {
    final l$logoutGuest = json['logoutGuest'];
    final l$$__typename = json['__typename'];
    return Mutation$LogoutGuest(
      logoutGuest: (l$logoutGuest as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool logoutGuest;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$logoutGuest = logoutGuest;
    resultData['logoutGuest'] = l$logoutGuest;
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$logoutGuest = logoutGuest;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$logoutGuest,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$LogoutGuest || runtimeType != other.runtimeType) {
      return false;
    }
    final l$logoutGuest = logoutGuest;
    final lOther$logoutGuest = other.logoutGuest;
    if (l$logoutGuest != lOther$logoutGuest) {
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

extension UtilityExtension$Mutation$LogoutGuest on Mutation$LogoutGuest {
  CopyWith$Mutation$LogoutGuest<Mutation$LogoutGuest> get copyWith =>
      CopyWith$Mutation$LogoutGuest(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$LogoutGuest<TRes> {
  factory CopyWith$Mutation$LogoutGuest(
    Mutation$LogoutGuest instance,
    TRes Function(Mutation$LogoutGuest) then,
  ) = _CopyWithImpl$Mutation$LogoutGuest;

  factory CopyWith$Mutation$LogoutGuest.stub(TRes res) =
      _CopyWithStubImpl$Mutation$LogoutGuest;

  TRes call({
    bool? logoutGuest,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$LogoutGuest<TRes>
    implements CopyWith$Mutation$LogoutGuest<TRes> {
  _CopyWithImpl$Mutation$LogoutGuest(
    this._instance,
    this._then,
  );

  final Mutation$LogoutGuest _instance;

  final TRes Function(Mutation$LogoutGuest) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? logoutGuest = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$LogoutGuest(
        logoutGuest: logoutGuest == _undefined || logoutGuest == null
            ? _instance.logoutGuest
            : (logoutGuest as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$LogoutGuest<TRes>
    implements CopyWith$Mutation$LogoutGuest<TRes> {
  _CopyWithStubImpl$Mutation$LogoutGuest(this._res);

  final TRes _res;

  @override
  call({
    bool? logoutGuest,
    String? $__typename,
  }) =>
      _res;
}

const documentNodeMutationLogoutGuest = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'LogoutGuest'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'logoutGuest'),
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
Mutation$LogoutGuest _parserFn$Mutation$LogoutGuest(
        Map<String, dynamic> data) =>
    Mutation$LogoutGuest.fromJson(data);
typedef OnMutationCompleted$Mutation$LogoutGuest = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$LogoutGuest?,
);

class Options$Mutation$LogoutGuest
    extends graphql.MutationOptions<Mutation$LogoutGuest> {
  Options$Mutation$LogoutGuest({
    super.operationName,
    super.fetchPolicy,
    super.errorPolicy,
    super.cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$LogoutGuest? typedOptimisticResult,
    super.context,
    OnMutationCompleted$Mutation$LogoutGuest? onCompleted,
    super.update,
    super.onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$LogoutGuest(data),
                  ),
          document: documentNodeMutationLogoutGuest,
          parserFn: _parserFn$Mutation$LogoutGuest,
        );

  final OnMutationCompleted$Mutation$LogoutGuest? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$LogoutGuest
    extends graphql.WatchQueryOptions<Mutation$LogoutGuest> {
  WatchOptions$Mutation$LogoutGuest({
    super.operationName,
    super.fetchPolicy,
    super.errorPolicy,
    super.cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$LogoutGuest? typedOptimisticResult,
    super.context,
    super.pollInterval,
    super.eagerlyFetchResults,
    super.carryForwardDataOnException,
    super.fetchResults,
  }) : super(
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          document: documentNodeMutationLogoutGuest,
          parserFn: _parserFn$Mutation$LogoutGuest,
        );
}

extension ClientExtension$Mutation$LogoutGuest on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$LogoutGuest>> mutate$LogoutGuest(
          [Options$Mutation$LogoutGuest? options]) async =>
      await mutate(options ?? Options$Mutation$LogoutGuest());
  graphql.ObservableQuery<Mutation$LogoutGuest> watchMutation$LogoutGuest(
          [WatchOptions$Mutation$LogoutGuest? options]) =>
      watchMutation(options ?? WatchOptions$Mutation$LogoutGuest());
}

class Mutation$LogoutGuest$HookResult {
  Mutation$LogoutGuest$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$LogoutGuest runMutation;

  final graphql.QueryResult<Mutation$LogoutGuest> result;
}

Mutation$LogoutGuest$HookResult useMutation$LogoutGuest(
    [WidgetOptions$Mutation$LogoutGuest? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$LogoutGuest());
  return Mutation$LogoutGuest$HookResult(
    ({optimisticResult, typedOptimisticResult}) => result.runMutation(
      const {},
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$LogoutGuest> useWatchMutation$LogoutGuest(
        [WatchOptions$Mutation$LogoutGuest? options]) =>
    graphql_flutter
        .useWatchMutation(options ?? WatchOptions$Mutation$LogoutGuest());

class WidgetOptions$Mutation$LogoutGuest
    extends graphql.MutationOptions<Mutation$LogoutGuest> {
  WidgetOptions$Mutation$LogoutGuest({
    super.operationName,
    super.fetchPolicy,
    super.errorPolicy,
    super.cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$LogoutGuest? typedOptimisticResult,
    super.context,
    OnMutationCompleted$Mutation$LogoutGuest? onCompleted,
    super.update,
    super.onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$LogoutGuest(data),
                  ),
          document: documentNodeMutationLogoutGuest,
          parserFn: _parserFn$Mutation$LogoutGuest,
        );

  final OnMutationCompleted$Mutation$LogoutGuest? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$LogoutGuest
    = graphql.MultiSourceResult<Mutation$LogoutGuest> Function({
  Object? optimisticResult,
  Mutation$LogoutGuest? typedOptimisticResult,
});
typedef Builder$Mutation$LogoutGuest = widgets.Widget Function(
  RunMutation$Mutation$LogoutGuest,
  graphql.QueryResult<Mutation$LogoutGuest>?,
);

class Mutation$LogoutGuest$Widget
    extends graphql_flutter.Mutation<Mutation$LogoutGuest> {
  Mutation$LogoutGuest$Widget({
    super.key,
    WidgetOptions$Mutation$LogoutGuest? options,
    required Builder$Mutation$LogoutGuest builder,
  }) : super(
          options: options ?? WidgetOptions$Mutation$LogoutGuest(),
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
