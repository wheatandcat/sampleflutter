import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'schema.graphql.dart';

class Variables$Mutation$UpdateCategory {
  factory Variables$Mutation$UpdateCategory(
          {required Input$UpdateCategory input}) =>
      Variables$Mutation$UpdateCategory._({
        r'input': input,
      });

  Variables$Mutation$UpdateCategory._(this._$data);

  factory Variables$Mutation$UpdateCategory.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] =
        Input$UpdateCategory.fromJson((l$input as Map<String, dynamic>));
    return Variables$Mutation$UpdateCategory._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$UpdateCategory get input => (_$data['input'] as Input$UpdateCategory);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$UpdateCategory<Variables$Mutation$UpdateCategory>
      get copyWith => CopyWith$Variables$Mutation$UpdateCategory(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$UpdateCategory ||
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

abstract class CopyWith$Variables$Mutation$UpdateCategory<TRes> {
  factory CopyWith$Variables$Mutation$UpdateCategory(
    Variables$Mutation$UpdateCategory instance,
    TRes Function(Variables$Mutation$UpdateCategory) then,
  ) = _CopyWithImpl$Variables$Mutation$UpdateCategory;

  factory CopyWith$Variables$Mutation$UpdateCategory.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UpdateCategory;

  TRes call({Input$UpdateCategory? input});
}

class _CopyWithImpl$Variables$Mutation$UpdateCategory<TRes>
    implements CopyWith$Variables$Mutation$UpdateCategory<TRes> {
  _CopyWithImpl$Variables$Mutation$UpdateCategory(
    this._instance,
    this._then,
  );

  final Variables$Mutation$UpdateCategory _instance;

  final TRes Function(Variables$Mutation$UpdateCategory) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) =>
      _then(Variables$Mutation$UpdateCategory._({
        ..._instance._$data,
        if (input != _undefined && input != null)
          'input': (input as Input$UpdateCategory),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$UpdateCategory<TRes>
    implements CopyWith$Variables$Mutation$UpdateCategory<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UpdateCategory(this._res);

  TRes _res;

  call({Input$UpdateCategory? input}) => _res;
}

class Mutation$UpdateCategory {
  Mutation$UpdateCategory({
    required this.updateCategory,
    this.$__typename = 'Mutation',
  });

  factory Mutation$UpdateCategory.fromJson(Map<String, dynamic> json) {
    final l$updateCategory = json['updateCategory'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateCategory(
      updateCategory: Mutation$UpdateCategory$updateCategory.fromJson(
          (l$updateCategory as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdateCategory$updateCategory updateCategory;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateCategory = updateCategory;
    _resultData['updateCategory'] = l$updateCategory.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateCategory = updateCategory;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$updateCategory,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateCategory || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateCategory = updateCategory;
    final lOther$updateCategory = other.updateCategory;
    if (l$updateCategory != lOther$updateCategory) {
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

extension UtilityExtension$Mutation$UpdateCategory on Mutation$UpdateCategory {
  CopyWith$Mutation$UpdateCategory<Mutation$UpdateCategory> get copyWith =>
      CopyWith$Mutation$UpdateCategory(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$UpdateCategory<TRes> {
  factory CopyWith$Mutation$UpdateCategory(
    Mutation$UpdateCategory instance,
    TRes Function(Mutation$UpdateCategory) then,
  ) = _CopyWithImpl$Mutation$UpdateCategory;

  factory CopyWith$Mutation$UpdateCategory.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateCategory;

  TRes call({
    Mutation$UpdateCategory$updateCategory? updateCategory,
    String? $__typename,
  });
  CopyWith$Mutation$UpdateCategory$updateCategory<TRes> get updateCategory;
}

class _CopyWithImpl$Mutation$UpdateCategory<TRes>
    implements CopyWith$Mutation$UpdateCategory<TRes> {
  _CopyWithImpl$Mutation$UpdateCategory(
    this._instance,
    this._then,
  );

  final Mutation$UpdateCategory _instance;

  final TRes Function(Mutation$UpdateCategory) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updateCategory = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdateCategory(
        updateCategory: updateCategory == _undefined || updateCategory == null
            ? _instance.updateCategory
            : (updateCategory as Mutation$UpdateCategory$updateCategory),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$UpdateCategory$updateCategory<TRes> get updateCategory {
    final local$updateCategory = _instance.updateCategory;
    return CopyWith$Mutation$UpdateCategory$updateCategory(
        local$updateCategory, (e) => call(updateCategory: e));
  }
}

class _CopyWithStubImpl$Mutation$UpdateCategory<TRes>
    implements CopyWith$Mutation$UpdateCategory<TRes> {
  _CopyWithStubImpl$Mutation$UpdateCategory(this._res);

  TRes _res;

  call({
    Mutation$UpdateCategory$updateCategory? updateCategory,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$UpdateCategory$updateCategory<TRes> get updateCategory =>
      CopyWith$Mutation$UpdateCategory$updateCategory.stub(_res);
}

const documentNodeMutationUpdateCategory = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'UpdateCategory'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'UpdateCategory'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'updateCategory'),
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
Mutation$UpdateCategory _parserFn$Mutation$UpdateCategory(
        Map<String, dynamic> data) =>
    Mutation$UpdateCategory.fromJson(data);
typedef OnMutationCompleted$Mutation$UpdateCategory = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$UpdateCategory?,
);

class Options$Mutation$UpdateCategory
    extends graphql.MutationOptions<Mutation$UpdateCategory> {
  Options$Mutation$UpdateCategory({
    String? operationName,
    required Variables$Mutation$UpdateCategory variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateCategory? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateCategory? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateCategory>? update,
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
                    data == null
                        ? null
                        : _parserFn$Mutation$UpdateCategory(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdateCategory,
          parserFn: _parserFn$Mutation$UpdateCategory,
        );

  final OnMutationCompleted$Mutation$UpdateCategory? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$UpdateCategory
    extends graphql.WatchQueryOptions<Mutation$UpdateCategory> {
  WatchOptions$Mutation$UpdateCategory({
    String? operationName,
    required Variables$Mutation$UpdateCategory variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateCategory? typedOptimisticResult,
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
          document: documentNodeMutationUpdateCategory,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$UpdateCategory,
        );
}

extension ClientExtension$Mutation$UpdateCategory on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UpdateCategory>> mutate$UpdateCategory(
          Options$Mutation$UpdateCategory options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$UpdateCategory> watchMutation$UpdateCategory(
          WatchOptions$Mutation$UpdateCategory options) =>
      this.watchMutation(options);
}

class Mutation$UpdateCategory$HookResult {
  Mutation$UpdateCategory$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$UpdateCategory runMutation;

  final graphql.QueryResult<Mutation$UpdateCategory> result;
}

Mutation$UpdateCategory$HookResult useMutation$UpdateCategory(
    [WidgetOptions$Mutation$UpdateCategory? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$UpdateCategory());
  return Mutation$UpdateCategory$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$UpdateCategory>
    useWatchMutation$UpdateCategory(
            WatchOptions$Mutation$UpdateCategory options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$UpdateCategory
    extends graphql.MutationOptions<Mutation$UpdateCategory> {
  WidgetOptions$Mutation$UpdateCategory({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateCategory? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateCategory? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateCategory>? update,
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
                        : _parserFn$Mutation$UpdateCategory(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdateCategory,
          parserFn: _parserFn$Mutation$UpdateCategory,
        );

  final OnMutationCompleted$Mutation$UpdateCategory? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$UpdateCategory
    = graphql.MultiSourceResult<Mutation$UpdateCategory> Function(
  Variables$Mutation$UpdateCategory, {
  Object? optimisticResult,
  Mutation$UpdateCategory? typedOptimisticResult,
});
typedef Builder$Mutation$UpdateCategory = widgets.Widget Function(
  RunMutation$Mutation$UpdateCategory,
  graphql.QueryResult<Mutation$UpdateCategory>?,
);

class Mutation$UpdateCategory$Widget
    extends graphql_flutter.Mutation<Mutation$UpdateCategory> {
  Mutation$UpdateCategory$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$UpdateCategory? options,
    required Builder$Mutation$UpdateCategory builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$UpdateCategory(),
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

class Mutation$UpdateCategory$updateCategory {
  Mutation$UpdateCategory$updateCategory({
    required this.id,
    required this.name,
    this.$__typename = 'Category',
  });

  factory Mutation$UpdateCategory$updateCategory.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateCategory$updateCategory(
      id: (l$id as String),
      name: (l$name as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateCategory$updateCategory ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$UpdateCategory$updateCategory
    on Mutation$UpdateCategory$updateCategory {
  CopyWith$Mutation$UpdateCategory$updateCategory<
          Mutation$UpdateCategory$updateCategory>
      get copyWith => CopyWith$Mutation$UpdateCategory$updateCategory(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UpdateCategory$updateCategory<TRes> {
  factory CopyWith$Mutation$UpdateCategory$updateCategory(
    Mutation$UpdateCategory$updateCategory instance,
    TRes Function(Mutation$UpdateCategory$updateCategory) then,
  ) = _CopyWithImpl$Mutation$UpdateCategory$updateCategory;

  factory CopyWith$Mutation$UpdateCategory$updateCategory.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateCategory$updateCategory;

  TRes call({
    String? id,
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$UpdateCategory$updateCategory<TRes>
    implements CopyWith$Mutation$UpdateCategory$updateCategory<TRes> {
  _CopyWithImpl$Mutation$UpdateCategory$updateCategory(
    this._instance,
    this._then,
  );

  final Mutation$UpdateCategory$updateCategory _instance;

  final TRes Function(Mutation$UpdateCategory$updateCategory) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdateCategory$updateCategory(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$UpdateCategory$updateCategory<TRes>
    implements CopyWith$Mutation$UpdateCategory$updateCategory<TRes> {
  _CopyWithStubImpl$Mutation$UpdateCategory$updateCategory(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? $__typename,
  }) =>
      _res;
}
