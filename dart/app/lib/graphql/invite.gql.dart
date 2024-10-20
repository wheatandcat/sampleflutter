import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Query$Invite {
  Query$Invite({
    this.invite,
    this.$__typename = 'Query',
  });

  factory Query$Invite.fromJson(Map<String, dynamic> json) {
    final l$invite = json['invite'];
    final l$$__typename = json['__typename'];
    return Query$Invite(
      invite: l$invite == null
          ? null
          : Query$Invite$invite.fromJson((l$invite as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$Invite$invite? invite;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$invite = invite;
    resultData['invite'] = l$invite?.toJson();
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$invite = invite;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$invite,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Invite || runtimeType != other.runtimeType) {
      return false;
    }
    final l$invite = invite;
    final lOther$invite = other.invite;
    if (l$invite != lOther$invite) {
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

extension UtilityExtension$Query$Invite on Query$Invite {
  CopyWith$Query$Invite<Query$Invite> get copyWith => CopyWith$Query$Invite(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Invite<TRes> {
  factory CopyWith$Query$Invite(
    Query$Invite instance,
    TRes Function(Query$Invite) then,
  ) = _CopyWithImpl$Query$Invite;

  factory CopyWith$Query$Invite.stub(TRes res) = _CopyWithStubImpl$Query$Invite;

  TRes call({
    Query$Invite$invite? invite,
    String? $__typename,
  });
  CopyWith$Query$Invite$invite<TRes> get invite;
}

class _CopyWithImpl$Query$Invite<TRes> implements CopyWith$Query$Invite<TRes> {
  _CopyWithImpl$Query$Invite(
    this._instance,
    this._then,
  );

  final Query$Invite _instance;

  final TRes Function(Query$Invite) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? invite = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Invite(
        invite: invite == _undefined
            ? _instance.invite
            : (invite as Query$Invite$invite?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  @override
  CopyWith$Query$Invite$invite<TRes> get invite {
    final local$invite = _instance.invite;
    return local$invite == null
        ? CopyWith$Query$Invite$invite.stub(_then(_instance))
        : CopyWith$Query$Invite$invite(local$invite, (e) => call(invite: e));
  }
}

class _CopyWithStubImpl$Query$Invite<TRes>
    implements CopyWith$Query$Invite<TRes> {
  _CopyWithStubImpl$Query$Invite(this._res);

  final TRes _res;

  @override
  call({
    Query$Invite$invite? invite,
    String? $__typename,
  }) =>
      _res;

  @override
  CopyWith$Query$Invite$invite<TRes> get invite =>
      CopyWith$Query$Invite$invite.stub(_res);
}

const documentNodeQueryInvite = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'Invite'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'invite'),
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
Query$Invite _parserFn$Query$Invite(Map<String, dynamic> data) =>
    Query$Invite.fromJson(data);
typedef OnQueryComplete$Query$Invite = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$Invite?,
);

class Options$Query$Invite extends graphql.QueryOptions<Query$Invite> {
  Options$Query$Invite({
    super.operationName,
    super.fetchPolicy,
    super.errorPolicy,
    super.cacheRereadPolicy,
    Object? optimisticResult,
    Query$Invite? typedOptimisticResult,
    super.pollInterval,
    super.context,
    OnQueryComplete$Query$Invite? onComplete,
    super.onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$Invite(data),
                  ),
          document: documentNodeQueryInvite,
          parserFn: _parserFn$Query$Invite,
        );

  final OnQueryComplete$Query$Invite? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$Invite
    extends graphql.WatchQueryOptions<Query$Invite> {
  WatchOptions$Query$Invite({
    super.operationName,
    super.fetchPolicy,
    super.errorPolicy,
    super.cacheRereadPolicy,
    Object? optimisticResult,
    Query$Invite? typedOptimisticResult,
    super.context,
    super.pollInterval,
    super.eagerlyFetchResults,
    super.carryForwardDataOnException,
    super.fetchResults,
  }) : super(
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          document: documentNodeQueryInvite,
          parserFn: _parserFn$Query$Invite,
        );
}

class FetchMoreOptions$Query$Invite extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$Invite({required super.updateQuery})
      : super(
          document: documentNodeQueryInvite,
        );
}

extension ClientExtension$Query$Invite on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$Invite>> query$Invite(
          [Options$Query$Invite? options]) async =>
      await query(options ?? Options$Query$Invite());
  graphql.ObservableQuery<Query$Invite> watchQuery$Invite(
          [WatchOptions$Query$Invite? options]) =>
      watchQuery(options ?? WatchOptions$Query$Invite());
  void writeQuery$Invite({
    required Query$Invite data,
    bool broadcast = true,
  }) =>
      writeQuery(
        const graphql.Request(
            operation: graphql.Operation(document: documentNodeQueryInvite)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$Invite? readQuery$Invite({bool optimistic = true}) {
    final result = readQuery(
      const graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryInvite)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$Invite.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$Invite> useQuery$Invite(
        [Options$Query$Invite? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$Invite());
graphql.ObservableQuery<Query$Invite> useWatchQuery$Invite(
        [WatchOptions$Query$Invite? options]) =>
    graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$Invite());

class Query$Invite$Widget extends graphql_flutter.Query<Query$Invite> {
  Query$Invite$Widget({
    super.key,
    Options$Query$Invite? options,
    required super.builder,
  }) : super(
          options: options ?? Options$Query$Invite(),
        );
}

class Query$Invite$invite {
  Query$Invite$invite({
    required this.userId,
    required this.code,
    this.$__typename = 'Invite',
  });

  factory Query$Invite$invite.fromJson(Map<String, dynamic> json) {
    final l$userId = json['userId'];
    final l$code = json['code'];
    final l$$__typename = json['__typename'];
    return Query$Invite$invite(
      userId: (l$userId as String),
      code: (l$code as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String userId;

  final String code;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$userId = userId;
    resultData['userId'] = l$userId;
    final l$code = code;
    resultData['code'] = l$code;
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
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
    if (other is! Query$Invite$invite || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$Invite$invite on Query$Invite$invite {
  CopyWith$Query$Invite$invite<Query$Invite$invite> get copyWith =>
      CopyWith$Query$Invite$invite(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Invite$invite<TRes> {
  factory CopyWith$Query$Invite$invite(
    Query$Invite$invite instance,
    TRes Function(Query$Invite$invite) then,
  ) = _CopyWithImpl$Query$Invite$invite;

  factory CopyWith$Query$Invite$invite.stub(TRes res) =
      _CopyWithStubImpl$Query$Invite$invite;

  TRes call({
    String? userId,
    String? code,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Invite$invite<TRes>
    implements CopyWith$Query$Invite$invite<TRes> {
  _CopyWithImpl$Query$Invite$invite(
    this._instance,
    this._then,
  );

  final Query$Invite$invite _instance;

  final TRes Function(Query$Invite$invite) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? userId = _undefined,
    Object? code = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Invite$invite(
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

class _CopyWithStubImpl$Query$Invite$invite<TRes>
    implements CopyWith$Query$Invite$invite<TRes> {
  _CopyWithStubImpl$Query$Invite$invite(this._res);

  final TRes _res;

  @override
  call({
    String? userId,
    String? code,
    String? $__typename,
  }) =>
      _res;
}
