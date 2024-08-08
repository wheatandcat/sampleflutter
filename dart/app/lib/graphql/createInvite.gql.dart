import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Mutation$CreateInvite {
  Mutation$CreateInvite({
    required this.createInvite,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CreateInvite.fromJson(Map<String, dynamic> json) {
    final l$createInvite = json['createInvite'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateInvite(
      createInvite: Mutation$CreateInvite$createInvite.fromJson(
          (l$createInvite as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateInvite$createInvite createInvite;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createInvite = createInvite;
    _resultData['createInvite'] = l$createInvite.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createInvite = createInvite;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$createInvite,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$CreateInvite) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$createInvite = createInvite;
    final lOther$createInvite = other.createInvite;
    if (l$createInvite != lOther$createInvite) {
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

extension UtilityExtension$Mutation$CreateInvite on Mutation$CreateInvite {
  CopyWith$Mutation$CreateInvite<Mutation$CreateInvite> get copyWith =>
      CopyWith$Mutation$CreateInvite(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$CreateInvite<TRes> {
  factory CopyWith$Mutation$CreateInvite(
    Mutation$CreateInvite instance,
    TRes Function(Mutation$CreateInvite) then,
  ) = _CopyWithImpl$Mutation$CreateInvite;

  factory CopyWith$Mutation$CreateInvite.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateInvite;

  TRes call({
    Mutation$CreateInvite$createInvite? createInvite,
    String? $__typename,
  });
  CopyWith$Mutation$CreateInvite$createInvite<TRes> get createInvite;
}

class _CopyWithImpl$Mutation$CreateInvite<TRes>
    implements CopyWith$Mutation$CreateInvite<TRes> {
  _CopyWithImpl$Mutation$CreateInvite(
    this._instance,
    this._then,
  );

  final Mutation$CreateInvite _instance;

  final TRes Function(Mutation$CreateInvite) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createInvite = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateInvite(
        createInvite: createInvite == _undefined || createInvite == null
            ? _instance.createInvite
            : (createInvite as Mutation$CreateInvite$createInvite),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$CreateInvite$createInvite<TRes> get createInvite {
    final local$createInvite = _instance.createInvite;
    return CopyWith$Mutation$CreateInvite$createInvite(
        local$createInvite, (e) => call(createInvite: e));
  }
}

class _CopyWithStubImpl$Mutation$CreateInvite<TRes>
    implements CopyWith$Mutation$CreateInvite<TRes> {
  _CopyWithStubImpl$Mutation$CreateInvite(this._res);

  TRes _res;

  call({
    Mutation$CreateInvite$createInvite? createInvite,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$CreateInvite$createInvite<TRes> get createInvite =>
      CopyWith$Mutation$CreateInvite$createInvite.stub(_res);
}

const documentNodeMutationCreateInvite = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'CreateInvite'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'createInvite'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'userId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'code'),
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
Mutation$CreateInvite _parserFn$Mutation$CreateInvite(
        Map<String, dynamic> data) =>
    Mutation$CreateInvite.fromJson(data);
typedef OnMutationCompleted$Mutation$CreateInvite = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$CreateInvite?,
);

class Options$Mutation$CreateInvite
    extends graphql.MutationOptions<Mutation$CreateInvite> {
  Options$Mutation$CreateInvite({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateInvite? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateInvite? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateInvite>? update,
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
                    data == null ? null : _parserFn$Mutation$CreateInvite(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCreateInvite,
          parserFn: _parserFn$Mutation$CreateInvite,
        );

  final OnMutationCompleted$Mutation$CreateInvite? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$CreateInvite
    extends graphql.WatchQueryOptions<Mutation$CreateInvite> {
  WatchOptions$Mutation$CreateInvite({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateInvite? typedOptimisticResult,
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
          document: documentNodeMutationCreateInvite,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$CreateInvite,
        );
}

extension ClientExtension$Mutation$CreateInvite on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CreateInvite>> mutate$CreateInvite(
          [Options$Mutation$CreateInvite? options]) async =>
      await this.mutate(options ?? Options$Mutation$CreateInvite());
  graphql.ObservableQuery<Mutation$CreateInvite> watchMutation$CreateInvite(
          [WatchOptions$Mutation$CreateInvite? options]) =>
      this.watchMutation(options ?? WatchOptions$Mutation$CreateInvite());
}

class Mutation$CreateInvite$HookResult {
  Mutation$CreateInvite$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$CreateInvite runMutation;

  final graphql.QueryResult<Mutation$CreateInvite> result;
}

Mutation$CreateInvite$HookResult useMutation$CreateInvite(
    [WidgetOptions$Mutation$CreateInvite? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$CreateInvite());
  return Mutation$CreateInvite$HookResult(
    ({optimisticResult, typedOptimisticResult}) => result.runMutation(
      const {},
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$CreateInvite> useWatchMutation$CreateInvite(
        [WatchOptions$Mutation$CreateInvite? options]) =>
    graphql_flutter
        .useWatchMutation(options ?? WatchOptions$Mutation$CreateInvite());

class WidgetOptions$Mutation$CreateInvite
    extends graphql.MutationOptions<Mutation$CreateInvite> {
  WidgetOptions$Mutation$CreateInvite({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateInvite? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateInvite? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateInvite>? update,
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
                    data == null ? null : _parserFn$Mutation$CreateInvite(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCreateInvite,
          parserFn: _parserFn$Mutation$CreateInvite,
        );

  final OnMutationCompleted$Mutation$CreateInvite? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$CreateInvite
    = graphql.MultiSourceResult<Mutation$CreateInvite> Function({
  Object? optimisticResult,
  Mutation$CreateInvite? typedOptimisticResult,
});
typedef Builder$Mutation$CreateInvite = widgets.Widget Function(
  RunMutation$Mutation$CreateInvite,
  graphql.QueryResult<Mutation$CreateInvite>?,
);

class Mutation$CreateInvite$Widget
    extends graphql_flutter.Mutation<Mutation$CreateInvite> {
  Mutation$CreateInvite$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$CreateInvite? options,
    required Builder$Mutation$CreateInvite builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$CreateInvite(),
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

class Mutation$CreateInvite$createInvite {
  Mutation$CreateInvite$createInvite({
    required this.userId,
    required this.code,
    this.$__typename = 'Invite',
  });

  factory Mutation$CreateInvite$createInvite.fromJson(
      Map<String, dynamic> json) {
    final l$userId = json['userId'];
    final l$code = json['code'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateInvite$createInvite(
      userId: (l$userId as String),
      code: (l$code as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String userId;

  final String code;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$userId = userId;
    _resultData['userId'] = l$userId;
    final l$code = code;
    _resultData['code'] = l$code;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$userId = userId;
    final l$code = code;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$userId,
      l$code,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$CreateInvite$createInvite) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (l$userId != lOther$userId) {
      return false;
    }
    final l$code = code;
    final lOther$code = other.code;
    if (l$code != lOther$code) {
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

extension UtilityExtension$Mutation$CreateInvite$createInvite
    on Mutation$CreateInvite$createInvite {
  CopyWith$Mutation$CreateInvite$createInvite<
          Mutation$CreateInvite$createInvite>
      get copyWith => CopyWith$Mutation$CreateInvite$createInvite(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$CreateInvite$createInvite<TRes> {
  factory CopyWith$Mutation$CreateInvite$createInvite(
    Mutation$CreateInvite$createInvite instance,
    TRes Function(Mutation$CreateInvite$createInvite) then,
  ) = _CopyWithImpl$Mutation$CreateInvite$createInvite;

  factory CopyWith$Mutation$CreateInvite$createInvite.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateInvite$createInvite;

  TRes call({
    String? userId,
    String? code,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$CreateInvite$createInvite<TRes>
    implements CopyWith$Mutation$CreateInvite$createInvite<TRes> {
  _CopyWithImpl$Mutation$CreateInvite$createInvite(
    this._instance,
    this._then,
  );

  final Mutation$CreateInvite$createInvite _instance;

  final TRes Function(Mutation$CreateInvite$createInvite) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? userId = _undefined,
    Object? code = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateInvite$createInvite(
        userId: userId == _undefined || userId == null
            ? _instance.userId
            : (userId as String),
        code: code == _undefined || code == null
            ? _instance.code
            : (code as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$CreateInvite$createInvite<TRes>
    implements CopyWith$Mutation$CreateInvite$createInvite<TRes> {
  _CopyWithStubImpl$Mutation$CreateInvite$createInvite(this._res);

  TRes _res;

  call({
    String? userId,
    String? code,
    String? $__typename,
  }) =>
      _res;
}
