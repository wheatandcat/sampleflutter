import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'schema.graphql.dart';

class Variables$Mutation$CreateGuest {
  factory Variables$Mutation$CreateGuest({required Input$NewGuest input}) =>
      Variables$Mutation$CreateGuest._({
        r'input': input,
      });

  Variables$Mutation$CreateGuest._(this._$data);

  factory Variables$Mutation$CreateGuest.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] =
        Input$NewGuest.fromJson((l$input as Map<String, dynamic>));
    return Variables$Mutation$CreateGuest._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$NewGuest get input => (_$data['input'] as Input$NewGuest);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$CreateGuest<Variables$Mutation$CreateGuest>
      get copyWith => CopyWith$Variables$Mutation$CreateGuest(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$CreateGuest ||
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

abstract class CopyWith$Variables$Mutation$CreateGuest<TRes> {
  factory CopyWith$Variables$Mutation$CreateGuest(
    Variables$Mutation$CreateGuest instance,
    TRes Function(Variables$Mutation$CreateGuest) then,
  ) = _CopyWithImpl$Variables$Mutation$CreateGuest;

  factory CopyWith$Variables$Mutation$CreateGuest.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CreateGuest;

  TRes call({Input$NewGuest? input});
}

class _CopyWithImpl$Variables$Mutation$CreateGuest<TRes>
    implements CopyWith$Variables$Mutation$CreateGuest<TRes> {
  _CopyWithImpl$Variables$Mutation$CreateGuest(
    this._instance,
    this._then,
  );

  final Variables$Mutation$CreateGuest _instance;

  final TRes Function(Variables$Mutation$CreateGuest) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({Object? input = _undefined}) =>
      _then(Variables$Mutation$CreateGuest._({
        ..._instance._$data,
        if (input != _undefined && input != null)
          'input': (input as Input$NewGuest),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$CreateGuest<TRes>
    implements CopyWith$Variables$Mutation$CreateGuest<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CreateGuest(this._res);

  final TRes _res;

  @override
  call({Input$NewGuest? input}) => _res;
}

class Mutation$CreateGuest {
  Mutation$CreateGuest({
    required this.createGuest,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CreateGuest.fromJson(Map<String, dynamic> json) {
    final l$createGuest = json['createGuest'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateGuest(
      createGuest: Mutation$CreateGuest$createGuest.fromJson(
          (l$createGuest as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateGuest$createGuest createGuest;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$createGuest = createGuest;
    resultData['createGuest'] = l$createGuest.toJson();
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$createGuest = createGuest;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$createGuest,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateGuest || runtimeType != other.runtimeType) {
      return false;
    }
    final l$createGuest = createGuest;
    final lOther$createGuest = other.createGuest;
    if (l$createGuest != lOther$createGuest) {
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

extension UtilityExtension$Mutation$CreateGuest on Mutation$CreateGuest {
  CopyWith$Mutation$CreateGuest<Mutation$CreateGuest> get copyWith =>
      CopyWith$Mutation$CreateGuest(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$CreateGuest<TRes> {
  factory CopyWith$Mutation$CreateGuest(
    Mutation$CreateGuest instance,
    TRes Function(Mutation$CreateGuest) then,
  ) = _CopyWithImpl$Mutation$CreateGuest;

  factory CopyWith$Mutation$CreateGuest.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateGuest;

  TRes call({
    Mutation$CreateGuest$createGuest? createGuest,
    String? $__typename,
  });
  CopyWith$Mutation$CreateGuest$createGuest<TRes> get createGuest;
}

class _CopyWithImpl$Mutation$CreateGuest<TRes>
    implements CopyWith$Mutation$CreateGuest<TRes> {
  _CopyWithImpl$Mutation$CreateGuest(
    this._instance,
    this._then,
  );

  final Mutation$CreateGuest _instance;

  final TRes Function(Mutation$CreateGuest) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? createGuest = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateGuest(
        createGuest: createGuest == _undefined || createGuest == null
            ? _instance.createGuest
            : (createGuest as Mutation$CreateGuest$createGuest),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  @override
  CopyWith$Mutation$CreateGuest$createGuest<TRes> get createGuest {
    final local$createGuest = _instance.createGuest;
    return CopyWith$Mutation$CreateGuest$createGuest(
        local$createGuest, (e) => call(createGuest: e));
  }
}

class _CopyWithStubImpl$Mutation$CreateGuest<TRes>
    implements CopyWith$Mutation$CreateGuest<TRes> {
  _CopyWithStubImpl$Mutation$CreateGuest(this._res);

  final TRes _res;

  @override
  call({
    Mutation$CreateGuest$createGuest? createGuest,
    String? $__typename,
  }) =>
      _res;

  @override
  CopyWith$Mutation$CreateGuest$createGuest<TRes> get createGuest =>
      CopyWith$Mutation$CreateGuest$createGuest.stub(_res);
}

const documentNodeMutationCreateGuest = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'CreateGuest'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'NewGuest'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'createGuest'),
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
            name: NameNode(value: 'uid'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'userId'),
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
Mutation$CreateGuest _parserFn$Mutation$CreateGuest(
        Map<String, dynamic> data) =>
    Mutation$CreateGuest.fromJson(data);
typedef OnMutationCompleted$Mutation$CreateGuest = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$CreateGuest?,
);

class Options$Mutation$CreateGuest
    extends graphql.MutationOptions<Mutation$CreateGuest> {
  Options$Mutation$CreateGuest({
    super.operationName,
    required Variables$Mutation$CreateGuest variables,
    super.fetchPolicy,
    super.errorPolicy,
    super.cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateGuest? typedOptimisticResult,
    super.context,
    OnMutationCompleted$Mutation$CreateGuest? onCompleted,
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
                    data == null ? null : _parserFn$Mutation$CreateGuest(data),
                  ),
          document: documentNodeMutationCreateGuest,
          parserFn: _parserFn$Mutation$CreateGuest,
        );

  final OnMutationCompleted$Mutation$CreateGuest? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$CreateGuest
    extends graphql.WatchQueryOptions<Mutation$CreateGuest> {
  WatchOptions$Mutation$CreateGuest({
    super.operationName,
    required Variables$Mutation$CreateGuest variables,
    super.fetchPolicy,
    super.errorPolicy,
    super.cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateGuest? typedOptimisticResult,
    super.context,
    super.pollInterval,
    super.eagerlyFetchResults,
    super.carryForwardDataOnException,
    super.fetchResults,
  }) : super(
          variables: variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          document: documentNodeMutationCreateGuest,
          parserFn: _parserFn$Mutation$CreateGuest,
        );
}

extension ClientExtension$Mutation$CreateGuest on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CreateGuest>> mutate$CreateGuest(
          Options$Mutation$CreateGuest options) async =>
      await mutate(options);
  graphql.ObservableQuery<Mutation$CreateGuest> watchMutation$CreateGuest(
          WatchOptions$Mutation$CreateGuest options) =>
      watchMutation(options);
}

class Mutation$CreateGuest$HookResult {
  Mutation$CreateGuest$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$CreateGuest runMutation;

  final graphql.QueryResult<Mutation$CreateGuest> result;
}

Mutation$CreateGuest$HookResult useMutation$CreateGuest(
    [WidgetOptions$Mutation$CreateGuest? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$CreateGuest());
  return Mutation$CreateGuest$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$CreateGuest> useWatchMutation$CreateGuest(
        WatchOptions$Mutation$CreateGuest options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$CreateGuest
    extends graphql.MutationOptions<Mutation$CreateGuest> {
  WidgetOptions$Mutation$CreateGuest({
    super.operationName,
    super.fetchPolicy,
    super.errorPolicy,
    super.cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateGuest? typedOptimisticResult,
    super.context,
    OnMutationCompleted$Mutation$CreateGuest? onCompleted,
    super.update,
    super.onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$CreateGuest(data),
                  ),
          document: documentNodeMutationCreateGuest,
          parserFn: _parserFn$Mutation$CreateGuest,
        );

  final OnMutationCompleted$Mutation$CreateGuest? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$CreateGuest
    = graphql.MultiSourceResult<Mutation$CreateGuest> Function(
  Variables$Mutation$CreateGuest, {
  Object? optimisticResult,
  Mutation$CreateGuest? typedOptimisticResult,
});
typedef Builder$Mutation$CreateGuest = widgets.Widget Function(
  RunMutation$Mutation$CreateGuest,
  graphql.QueryResult<Mutation$CreateGuest>?,
);

class Mutation$CreateGuest$Widget
    extends graphql_flutter.Mutation<Mutation$CreateGuest> {
  Mutation$CreateGuest$Widget({
    super.key,
    WidgetOptions$Mutation$CreateGuest? options,
    required Builder$Mutation$CreateGuest builder,
  }) : super(
          options: options ?? WidgetOptions$Mutation$CreateGuest(),
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

class Mutation$CreateGuest$createGuest {
  Mutation$CreateGuest$createGuest({
    required this.uid,
    required this.userId,
    this.$__typename = 'Guest',
  });

  factory Mutation$CreateGuest$createGuest.fromJson(Map<String, dynamic> json) {
    final l$uid = json['uid'];
    final l$userId = json['userId'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateGuest$createGuest(
      uid: (l$uid as String),
      userId: (l$userId as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String uid;

  final String userId;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$uid = uid;
    resultData['uid'] = l$uid;
    final l$userId = userId;
    resultData['userId'] = l$userId;
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$uid = uid;
    final l$userId = userId;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$uid,
      l$userId,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateGuest$createGuest ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$uid = uid;
    final lOther$uid = other.uid;
    if (l$uid != lOther$uid) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (l$userId != lOther$userId) {
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

extension UtilityExtension$Mutation$CreateGuest$createGuest
    on Mutation$CreateGuest$createGuest {
  CopyWith$Mutation$CreateGuest$createGuest<Mutation$CreateGuest$createGuest>
      get copyWith => CopyWith$Mutation$CreateGuest$createGuest(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$CreateGuest$createGuest<TRes> {
  factory CopyWith$Mutation$CreateGuest$createGuest(
    Mutation$CreateGuest$createGuest instance,
    TRes Function(Mutation$CreateGuest$createGuest) then,
  ) = _CopyWithImpl$Mutation$CreateGuest$createGuest;

  factory CopyWith$Mutation$CreateGuest$createGuest.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateGuest$createGuest;

  TRes call({
    String? uid,
    String? userId,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$CreateGuest$createGuest<TRes>
    implements CopyWith$Mutation$CreateGuest$createGuest<TRes> {
  _CopyWithImpl$Mutation$CreateGuest$createGuest(
    this._instance,
    this._then,
  );

  final Mutation$CreateGuest$createGuest _instance;

  final TRes Function(Mutation$CreateGuest$createGuest) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? uid = _undefined,
    Object? userId = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateGuest$createGuest(
        uid: uid == _undefined || uid == null ? _instance.uid : (uid as String),
        userId: userId == _undefined || userId == null
            ? _instance.userId
            : (userId as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$CreateGuest$createGuest<TRes>
    implements CopyWith$Mutation$CreateGuest$createGuest<TRes> {
  _CopyWithStubImpl$Mutation$CreateGuest$createGuest(this._res);

  final TRes _res;

  @override
  call({
    String? uid,
    String? userId,
    String? $__typename,
  }) =>
      _res;
}
