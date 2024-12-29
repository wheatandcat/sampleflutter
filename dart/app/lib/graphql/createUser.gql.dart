import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Mutation$CreateUser {
  Mutation$CreateUser({
    required this.createUser,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CreateUser.fromJson(Map<String, dynamic> json) {
    final l$createUser = json['createUser'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateUser(
      createUser: Mutation$CreateUser$createUser.fromJson(
          (l$createUser as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateUser$createUser createUser;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createUser = createUser;
    _resultData['createUser'] = l$createUser.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createUser = createUser;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$createUser,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateUser || runtimeType != other.runtimeType) {
      return false;
    }
    final l$createUser = createUser;
    final lOther$createUser = other.createUser;
    if (l$createUser != lOther$createUser) {
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

extension UtilityExtension$Mutation$CreateUser on Mutation$CreateUser {
  CopyWith$Mutation$CreateUser<Mutation$CreateUser> get copyWith =>
      CopyWith$Mutation$CreateUser(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$CreateUser<TRes> {
  factory CopyWith$Mutation$CreateUser(
    Mutation$CreateUser instance,
    TRes Function(Mutation$CreateUser) then,
  ) = _CopyWithImpl$Mutation$CreateUser;

  factory CopyWith$Mutation$CreateUser.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateUser;

  TRes call({
    Mutation$CreateUser$createUser? createUser,
    String? $__typename,
  });
  CopyWith$Mutation$CreateUser$createUser<TRes> get createUser;
}

class _CopyWithImpl$Mutation$CreateUser<TRes>
    implements CopyWith$Mutation$CreateUser<TRes> {
  _CopyWithImpl$Mutation$CreateUser(
    this._instance,
    this._then,
  );

  final Mutation$CreateUser _instance;

  final TRes Function(Mutation$CreateUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createUser = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateUser(
        createUser: createUser == _undefined || createUser == null
            ? _instance.createUser
            : (createUser as Mutation$CreateUser$createUser),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$CreateUser$createUser<TRes> get createUser {
    final local$createUser = _instance.createUser;
    return CopyWith$Mutation$CreateUser$createUser(
        local$createUser, (e) => call(createUser: e));
  }
}

class _CopyWithStubImpl$Mutation$CreateUser<TRes>
    implements CopyWith$Mutation$CreateUser<TRes> {
  _CopyWithStubImpl$Mutation$CreateUser(this._res);

  TRes _res;

  call({
    Mutation$CreateUser$createUser? createUser,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$CreateUser$createUser<TRes> get createUser =>
      CopyWith$Mutation$CreateUser$createUser.stub(_res);
}

const documentNodeMutationCreateUser = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'CreateUser'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'createUser'),
        alias: null,
        arguments: [],
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
            name: NameNode(value: 'uid'),
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
Mutation$CreateUser _parserFn$Mutation$CreateUser(Map<String, dynamic> data) =>
    Mutation$CreateUser.fromJson(data);
typedef OnMutationCompleted$Mutation$CreateUser = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$CreateUser?,
);

class Options$Mutation$CreateUser
    extends graphql.MutationOptions<Mutation$CreateUser> {
  Options$Mutation$CreateUser({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateUser? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateUser? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateUser>? update,
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
                    data == null ? null : _parserFn$Mutation$CreateUser(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCreateUser,
          parserFn: _parserFn$Mutation$CreateUser,
        );

  final OnMutationCompleted$Mutation$CreateUser? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$CreateUser
    extends graphql.WatchQueryOptions<Mutation$CreateUser> {
  WatchOptions$Mutation$CreateUser({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateUser? typedOptimisticResult,
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
          document: documentNodeMutationCreateUser,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$CreateUser,
        );
}

extension ClientExtension$Mutation$CreateUser on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CreateUser>> mutate$CreateUser(
          [Options$Mutation$CreateUser? options]) async =>
      await this.mutate(options ?? Options$Mutation$CreateUser());
  graphql.ObservableQuery<Mutation$CreateUser> watchMutation$CreateUser(
          [WatchOptions$Mutation$CreateUser? options]) =>
      this.watchMutation(options ?? WatchOptions$Mutation$CreateUser());
}

class Mutation$CreateUser$HookResult {
  Mutation$CreateUser$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$CreateUser runMutation;

  final graphql.QueryResult<Mutation$CreateUser> result;
}

Mutation$CreateUser$HookResult useMutation$CreateUser(
    [WidgetOptions$Mutation$CreateUser? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$CreateUser());
  return Mutation$CreateUser$HookResult(
    ({optimisticResult, typedOptimisticResult}) => result.runMutation(
      const {},
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$CreateUser> useWatchMutation$CreateUser(
        [WatchOptions$Mutation$CreateUser? options]) =>
    graphql_flutter
        .useWatchMutation(options ?? WatchOptions$Mutation$CreateUser());

class WidgetOptions$Mutation$CreateUser
    extends graphql.MutationOptions<Mutation$CreateUser> {
  WidgetOptions$Mutation$CreateUser({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateUser? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateUser? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateUser>? update,
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
                    data == null ? null : _parserFn$Mutation$CreateUser(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCreateUser,
          parserFn: _parserFn$Mutation$CreateUser,
        );

  final OnMutationCompleted$Mutation$CreateUser? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$CreateUser
    = graphql.MultiSourceResult<Mutation$CreateUser> Function({
  Object? optimisticResult,
  Mutation$CreateUser? typedOptimisticResult,
});
typedef Builder$Mutation$CreateUser = widgets.Widget Function(
  RunMutation$Mutation$CreateUser,
  graphql.QueryResult<Mutation$CreateUser>?,
);

class Mutation$CreateUser$Widget
    extends graphql_flutter.Mutation<Mutation$CreateUser> {
  Mutation$CreateUser$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$CreateUser? options,
    required Builder$Mutation$CreateUser builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$CreateUser(),
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

class Mutation$CreateUser$createUser {
  Mutation$CreateUser$createUser({
    required this.id,
    required this.uid,
    this.$__typename = 'User',
  });

  factory Mutation$CreateUser$createUser.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$uid = json['uid'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateUser$createUser(
      id: (l$id as String),
      uid: (l$uid as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String uid;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$uid = uid;
    _resultData['uid'] = l$uid;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$uid = uid;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$uid,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateUser$createUser ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$uid = uid;
    final lOther$uid = other.uid;
    if (l$uid != lOther$uid) {
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

extension UtilityExtension$Mutation$CreateUser$createUser
    on Mutation$CreateUser$createUser {
  CopyWith$Mutation$CreateUser$createUser<Mutation$CreateUser$createUser>
      get copyWith => CopyWith$Mutation$CreateUser$createUser(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$CreateUser$createUser<TRes> {
  factory CopyWith$Mutation$CreateUser$createUser(
    Mutation$CreateUser$createUser instance,
    TRes Function(Mutation$CreateUser$createUser) then,
  ) = _CopyWithImpl$Mutation$CreateUser$createUser;

  factory CopyWith$Mutation$CreateUser$createUser.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateUser$createUser;

  TRes call({
    String? id,
    String? uid,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$CreateUser$createUser<TRes>
    implements CopyWith$Mutation$CreateUser$createUser<TRes> {
  _CopyWithImpl$Mutation$CreateUser$createUser(
    this._instance,
    this._then,
  );

  final Mutation$CreateUser$createUser _instance;

  final TRes Function(Mutation$CreateUser$createUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? uid = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateUser$createUser(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        uid: uid == _undefined || uid == null ? _instance.uid : (uid as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$CreateUser$createUser<TRes>
    implements CopyWith$Mutation$CreateUser$createUser<TRes> {
  _CopyWithStubImpl$Mutation$CreateUser$createUser(this._res);

  TRes _res;

  call({
    String? id,
    String? uid,
    String? $__typename,
  }) =>
      _res;
}
