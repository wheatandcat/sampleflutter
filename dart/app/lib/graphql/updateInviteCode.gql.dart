import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Mutation$UpdateInviteCode {
  Mutation$UpdateInviteCode({
    required this.updateInviteCode,
    this.$__typename = 'Mutation',
  });

  factory Mutation$UpdateInviteCode.fromJson(Map<String, dynamic> json) {
    final l$updateInviteCode = json['updateInviteCode'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateInviteCode(
      updateInviteCode: Mutation$UpdateInviteCode$updateInviteCode.fromJson(
          (l$updateInviteCode as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdateInviteCode$updateInviteCode updateInviteCode;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$updateInviteCode = updateInviteCode;
    resultData['updateInviteCode'] = l$updateInviteCode.toJson();
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$updateInviteCode = updateInviteCode;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$updateInviteCode,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateInviteCode ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateInviteCode = updateInviteCode;
    final lOther$updateInviteCode = other.updateInviteCode;
    if (l$updateInviteCode != lOther$updateInviteCode) {
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

extension UtilityExtension$Mutation$UpdateInviteCode
    on Mutation$UpdateInviteCode {
  CopyWith$Mutation$UpdateInviteCode<Mutation$UpdateInviteCode> get copyWith =>
      CopyWith$Mutation$UpdateInviteCode(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$UpdateInviteCode<TRes> {
  factory CopyWith$Mutation$UpdateInviteCode(
    Mutation$UpdateInviteCode instance,
    TRes Function(Mutation$UpdateInviteCode) then,
  ) = _CopyWithImpl$Mutation$UpdateInviteCode;

  factory CopyWith$Mutation$UpdateInviteCode.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateInviteCode;

  TRes call({
    Mutation$UpdateInviteCode$updateInviteCode? updateInviteCode,
    String? $__typename,
  });
  CopyWith$Mutation$UpdateInviteCode$updateInviteCode<TRes>
      get updateInviteCode;
}

class _CopyWithImpl$Mutation$UpdateInviteCode<TRes>
    implements CopyWith$Mutation$UpdateInviteCode<TRes> {
  _CopyWithImpl$Mutation$UpdateInviteCode(
    this._instance,
    this._then,
  );

  final Mutation$UpdateInviteCode _instance;

  final TRes Function(Mutation$UpdateInviteCode) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? updateInviteCode = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdateInviteCode(
        updateInviteCode: updateInviteCode == _undefined ||
                updateInviteCode == null
            ? _instance.updateInviteCode
            : (updateInviteCode as Mutation$UpdateInviteCode$updateInviteCode),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  @override
  CopyWith$Mutation$UpdateInviteCode$updateInviteCode<TRes>
      get updateInviteCode {
    final local$updateInviteCode = _instance.updateInviteCode;
    return CopyWith$Mutation$UpdateInviteCode$updateInviteCode(
        local$updateInviteCode, (e) => call(updateInviteCode: e));
  }
}

class _CopyWithStubImpl$Mutation$UpdateInviteCode<TRes>
    implements CopyWith$Mutation$UpdateInviteCode<TRes> {
  _CopyWithStubImpl$Mutation$UpdateInviteCode(this._res);

  final TRes _res;

  @override
  call({
    Mutation$UpdateInviteCode$updateInviteCode? updateInviteCode,
    String? $__typename,
  }) =>
      _res;

  @override
  CopyWith$Mutation$UpdateInviteCode$updateInviteCode<TRes>
      get updateInviteCode =>
          CopyWith$Mutation$UpdateInviteCode$updateInviteCode.stub(_res);
}

const documentNodeMutationUpdateInviteCode = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'UpdateInviteCode'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'updateInviteCode'),
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
Mutation$UpdateInviteCode _parserFn$Mutation$UpdateInviteCode(
        Map<String, dynamic> data) =>
    Mutation$UpdateInviteCode.fromJson(data);
typedef OnMutationCompleted$Mutation$UpdateInviteCode = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$UpdateInviteCode?,
);

class Options$Mutation$UpdateInviteCode
    extends graphql.MutationOptions<Mutation$UpdateInviteCode> {
  Options$Mutation$UpdateInviteCode({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateInviteCode? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateInviteCode? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateInviteCode>? update,
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
                    data == null
                        ? null
                        : _parserFn$Mutation$UpdateInviteCode(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdateInviteCode,
          parserFn: _parserFn$Mutation$UpdateInviteCode,
        );

  final OnMutationCompleted$Mutation$UpdateInviteCode? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$UpdateInviteCode
    extends graphql.WatchQueryOptions<Mutation$UpdateInviteCode> {
  WatchOptions$Mutation$UpdateInviteCode({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateInviteCode? typedOptimisticResult,
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
          document: documentNodeMutationUpdateInviteCode,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$UpdateInviteCode,
        );
}

extension ClientExtension$Mutation$UpdateInviteCode on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UpdateInviteCode>>
      mutate$UpdateInviteCode(
              [Options$Mutation$UpdateInviteCode? options]) async =>
          await mutate(options ?? Options$Mutation$UpdateInviteCode());
  graphql.ObservableQuery<
      Mutation$UpdateInviteCode> watchMutation$UpdateInviteCode(
          [WatchOptions$Mutation$UpdateInviteCode? options]) =>
      watchMutation(options ?? WatchOptions$Mutation$UpdateInviteCode());
}

class Mutation$UpdateInviteCode$HookResult {
  Mutation$UpdateInviteCode$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$UpdateInviteCode runMutation;

  final graphql.QueryResult<Mutation$UpdateInviteCode> result;
}

Mutation$UpdateInviteCode$HookResult useMutation$UpdateInviteCode(
    [WidgetOptions$Mutation$UpdateInviteCode? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$UpdateInviteCode());
  return Mutation$UpdateInviteCode$HookResult(
    ({optimisticResult, typedOptimisticResult}) => result.runMutation(
      const {},
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$UpdateInviteCode>
    useWatchMutation$UpdateInviteCode(
            [WatchOptions$Mutation$UpdateInviteCode? options]) =>
        graphql_flutter.useWatchMutation(
            options ?? WatchOptions$Mutation$UpdateInviteCode());

class WidgetOptions$Mutation$UpdateInviteCode
    extends graphql.MutationOptions<Mutation$UpdateInviteCode> {
  WidgetOptions$Mutation$UpdateInviteCode({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateInviteCode? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateInviteCode? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateInviteCode>? update,
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
                    data == null
                        ? null
                        : _parserFn$Mutation$UpdateInviteCode(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdateInviteCode,
          parserFn: _parserFn$Mutation$UpdateInviteCode,
        );

  final OnMutationCompleted$Mutation$UpdateInviteCode? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$UpdateInviteCode
    = graphql.MultiSourceResult<Mutation$UpdateInviteCode> Function({
  Object? optimisticResult,
  Mutation$UpdateInviteCode? typedOptimisticResult,
});
typedef Builder$Mutation$UpdateInviteCode = widgets.Widget Function(
  RunMutation$Mutation$UpdateInviteCode,
  graphql.QueryResult<Mutation$UpdateInviteCode>?,
);

class Mutation$UpdateInviteCode$Widget
    extends graphql_flutter.Mutation<Mutation$UpdateInviteCode> {
  Mutation$UpdateInviteCode$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$UpdateInviteCode? options,
    required Builder$Mutation$UpdateInviteCode builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$UpdateInviteCode(),
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

class Mutation$UpdateInviteCode$updateInviteCode {
  Mutation$UpdateInviteCode$updateInviteCode({
    required this.userId,
    required this.code,
    this.$__typename = 'Invite',
  });

  factory Mutation$UpdateInviteCode$updateInviteCode.fromJson(
      Map<String, dynamic> json) {
    final l$userId = json['userId'];
    final l$code = json['code'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateInviteCode$updateInviteCode(
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
    if (other is! Mutation$UpdateInviteCode$updateInviteCode ||
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

extension UtilityExtension$Mutation$UpdateInviteCode$updateInviteCode
    on Mutation$UpdateInviteCode$updateInviteCode {
  CopyWith$Mutation$UpdateInviteCode$updateInviteCode<
          Mutation$UpdateInviteCode$updateInviteCode>
      get copyWith => CopyWith$Mutation$UpdateInviteCode$updateInviteCode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UpdateInviteCode$updateInviteCode<TRes> {
  factory CopyWith$Mutation$UpdateInviteCode$updateInviteCode(
    Mutation$UpdateInviteCode$updateInviteCode instance,
    TRes Function(Mutation$UpdateInviteCode$updateInviteCode) then,
  ) = _CopyWithImpl$Mutation$UpdateInviteCode$updateInviteCode;

  factory CopyWith$Mutation$UpdateInviteCode$updateInviteCode.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateInviteCode$updateInviteCode;

  TRes call({
    String? userId,
    String? code,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$UpdateInviteCode$updateInviteCode<TRes>
    implements CopyWith$Mutation$UpdateInviteCode$updateInviteCode<TRes> {
  _CopyWithImpl$Mutation$UpdateInviteCode$updateInviteCode(
    this._instance,
    this._then,
  );

  final Mutation$UpdateInviteCode$updateInviteCode _instance;

  final TRes Function(Mutation$UpdateInviteCode$updateInviteCode) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? userId = _undefined,
    Object? code = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdateInviteCode$updateInviteCode(
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

class _CopyWithStubImpl$Mutation$UpdateInviteCode$updateInviteCode<TRes>
    implements CopyWith$Mutation$UpdateInviteCode$updateInviteCode<TRes> {
  _CopyWithStubImpl$Mutation$UpdateInviteCode$updateInviteCode(this._res);

  final TRes _res;

  @override
  call({
    String? userId,
    String? code,
    String? $__typename,
  }) =>
      _res;
}
