import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$DeleteCategory {
  factory Variables$Mutation$DeleteCategory({required int id}) =>
      Variables$Mutation$DeleteCategory._({
        r'id': id,
      });

  Variables$Mutation$DeleteCategory._(this._$data);

  factory Variables$Mutation$DeleteCategory.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    return Variables$Mutation$DeleteCategory._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Mutation$DeleteCategory<Variables$Mutation$DeleteCategory>
      get copyWith => CopyWith$Variables$Mutation$DeleteCategory(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$DeleteCategory ||
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

abstract class CopyWith$Variables$Mutation$DeleteCategory<TRes> {
  factory CopyWith$Variables$Mutation$DeleteCategory(
    Variables$Mutation$DeleteCategory instance,
    TRes Function(Variables$Mutation$DeleteCategory) then,
  ) = _CopyWithImpl$Variables$Mutation$DeleteCategory;

  factory CopyWith$Variables$Mutation$DeleteCategory.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$DeleteCategory;

  TRes call({int? id});
}

class _CopyWithImpl$Variables$Mutation$DeleteCategory<TRes>
    implements CopyWith$Variables$Mutation$DeleteCategory<TRes> {
  _CopyWithImpl$Variables$Mutation$DeleteCategory(
    this._instance,
    this._then,
  );

  final Variables$Mutation$DeleteCategory _instance;

  final TRes Function(Variables$Mutation$DeleteCategory) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({Object? id = _undefined}) =>
      _then(Variables$Mutation$DeleteCategory._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$DeleteCategory<TRes>
    implements CopyWith$Variables$Mutation$DeleteCategory<TRes> {
  _CopyWithStubImpl$Variables$Mutation$DeleteCategory(this._res);

  final TRes _res;

  @override
  call({int? id}) => _res;
}

class Mutation$DeleteCategory {
  Mutation$DeleteCategory({
    required this.deleteCategory,
    this.$__typename = 'Mutation',
  });

  factory Mutation$DeleteCategory.fromJson(Map<String, dynamic> json) {
    final l$deleteCategory = json['deleteCategory'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteCategory(
      deleteCategory: Mutation$DeleteCategory$deleteCategory.fromJson(
          (l$deleteCategory as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$DeleteCategory$deleteCategory deleteCategory;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$deleteCategory = deleteCategory;
    resultData['deleteCategory'] = l$deleteCategory.toJson();
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$deleteCategory = deleteCategory;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$deleteCategory,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DeleteCategory || runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteCategory = deleteCategory;
    final lOther$deleteCategory = other.deleteCategory;
    if (l$deleteCategory != lOther$deleteCategory) {
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

extension UtilityExtension$Mutation$DeleteCategory on Mutation$DeleteCategory {
  CopyWith$Mutation$DeleteCategory<Mutation$DeleteCategory> get copyWith =>
      CopyWith$Mutation$DeleteCategory(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$DeleteCategory<TRes> {
  factory CopyWith$Mutation$DeleteCategory(
    Mutation$DeleteCategory instance,
    TRes Function(Mutation$DeleteCategory) then,
  ) = _CopyWithImpl$Mutation$DeleteCategory;

  factory CopyWith$Mutation$DeleteCategory.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteCategory;

  TRes call({
    Mutation$DeleteCategory$deleteCategory? deleteCategory,
    String? $__typename,
  });
  CopyWith$Mutation$DeleteCategory$deleteCategory<TRes> get deleteCategory;
}

class _CopyWithImpl$Mutation$DeleteCategory<TRes>
    implements CopyWith$Mutation$DeleteCategory<TRes> {
  _CopyWithImpl$Mutation$DeleteCategory(
    this._instance,
    this._then,
  );

  final Mutation$DeleteCategory _instance;

  final TRes Function(Mutation$DeleteCategory) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? deleteCategory = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$DeleteCategory(
        deleteCategory: deleteCategory == _undefined || deleteCategory == null
            ? _instance.deleteCategory
            : (deleteCategory as Mutation$DeleteCategory$deleteCategory),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  @override
  CopyWith$Mutation$DeleteCategory$deleteCategory<TRes> get deleteCategory {
    final local$deleteCategory = _instance.deleteCategory;
    return CopyWith$Mutation$DeleteCategory$deleteCategory(
        local$deleteCategory, (e) => call(deleteCategory: e));
  }
}

class _CopyWithStubImpl$Mutation$DeleteCategory<TRes>
    implements CopyWith$Mutation$DeleteCategory<TRes> {
  _CopyWithStubImpl$Mutation$DeleteCategory(this._res);

  final TRes _res;

  @override
  call({
    Mutation$DeleteCategory$deleteCategory? deleteCategory,
    String? $__typename,
  }) =>
      _res;

  @override
  CopyWith$Mutation$DeleteCategory$deleteCategory<TRes> get deleteCategory =>
      CopyWith$Mutation$DeleteCategory$deleteCategory.stub(_res);
}

const documentNodeMutationDeleteCategory = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'DeleteCategory'),
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
        name: NameNode(value: 'deleteCategory'),
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
Mutation$DeleteCategory _parserFn$Mutation$DeleteCategory(
        Map<String, dynamic> data) =>
    Mutation$DeleteCategory.fromJson(data);
typedef OnMutationCompleted$Mutation$DeleteCategory = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$DeleteCategory?,
);

class Options$Mutation$DeleteCategory
    extends graphql.MutationOptions<Mutation$DeleteCategory> {
  Options$Mutation$DeleteCategory({
    super.operationName,
    required Variables$Mutation$DeleteCategory variables,
    super.fetchPolicy,
    super.errorPolicy,
    super.cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteCategory? typedOptimisticResult,
    super.context,
    OnMutationCompleted$Mutation$DeleteCategory? onCompleted,
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
                    data == null
                        ? null
                        : _parserFn$Mutation$DeleteCategory(data),
                  ),
          document: documentNodeMutationDeleteCategory,
          parserFn: _parserFn$Mutation$DeleteCategory,
        );

  final OnMutationCompleted$Mutation$DeleteCategory? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$DeleteCategory
    extends graphql.WatchQueryOptions<Mutation$DeleteCategory> {
  WatchOptions$Mutation$DeleteCategory({
    super.operationName,
    required Variables$Mutation$DeleteCategory variables,
    super.fetchPolicy,
    super.errorPolicy,
    super.cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteCategory? typedOptimisticResult,
    super.context,
    super.pollInterval,
    super.eagerlyFetchResults,
    super.carryForwardDataOnException,
    super.fetchResults,
  }) : super(
          variables: variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          document: documentNodeMutationDeleteCategory,
          parserFn: _parserFn$Mutation$DeleteCategory,
        );
}

extension ClientExtension$Mutation$DeleteCategory on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$DeleteCategory>> mutate$DeleteCategory(
          Options$Mutation$DeleteCategory options) async =>
      await mutate(options);
  graphql.ObservableQuery<Mutation$DeleteCategory> watchMutation$DeleteCategory(
          WatchOptions$Mutation$DeleteCategory options) =>
      watchMutation(options);
}

class Mutation$DeleteCategory$HookResult {
  Mutation$DeleteCategory$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$DeleteCategory runMutation;

  final graphql.QueryResult<Mutation$DeleteCategory> result;
}

Mutation$DeleteCategory$HookResult useMutation$DeleteCategory(
    [WidgetOptions$Mutation$DeleteCategory? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$DeleteCategory());
  return Mutation$DeleteCategory$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$DeleteCategory>
    useWatchMutation$DeleteCategory(
            WatchOptions$Mutation$DeleteCategory options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$DeleteCategory
    extends graphql.MutationOptions<Mutation$DeleteCategory> {
  WidgetOptions$Mutation$DeleteCategory({
    super.operationName,
    super.fetchPolicy,
    super.errorPolicy,
    super.cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteCategory? typedOptimisticResult,
    super.context,
    OnMutationCompleted$Mutation$DeleteCategory? onCompleted,
    super.update,
    super.onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$DeleteCategory(data),
                  ),
          document: documentNodeMutationDeleteCategory,
          parserFn: _parserFn$Mutation$DeleteCategory,
        );

  final OnMutationCompleted$Mutation$DeleteCategory? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$DeleteCategory
    = graphql.MultiSourceResult<Mutation$DeleteCategory> Function(
  Variables$Mutation$DeleteCategory, {
  Object? optimisticResult,
  Mutation$DeleteCategory? typedOptimisticResult,
});
typedef Builder$Mutation$DeleteCategory = widgets.Widget Function(
  RunMutation$Mutation$DeleteCategory,
  graphql.QueryResult<Mutation$DeleteCategory>?,
);

class Mutation$DeleteCategory$Widget
    extends graphql_flutter.Mutation<Mutation$DeleteCategory> {
  Mutation$DeleteCategory$Widget({
    super.key,
    WidgetOptions$Mutation$DeleteCategory? options,
    required Builder$Mutation$DeleteCategory builder,
  }) : super(
          options: options ?? WidgetOptions$Mutation$DeleteCategory(),
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

class Mutation$DeleteCategory$deleteCategory {
  Mutation$DeleteCategory$deleteCategory({
    required this.id,
    this.$__typename = 'Category',
  });

  factory Mutation$DeleteCategory$deleteCategory.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteCategory$deleteCategory(
      id: (l$id as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$id = id;
    resultData['id'] = l$id;
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
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
    if (other is! Mutation$DeleteCategory$deleteCategory ||
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

extension UtilityExtension$Mutation$DeleteCategory$deleteCategory
    on Mutation$DeleteCategory$deleteCategory {
  CopyWith$Mutation$DeleteCategory$deleteCategory<
          Mutation$DeleteCategory$deleteCategory>
      get copyWith => CopyWith$Mutation$DeleteCategory$deleteCategory(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$DeleteCategory$deleteCategory<TRes> {
  factory CopyWith$Mutation$DeleteCategory$deleteCategory(
    Mutation$DeleteCategory$deleteCategory instance,
    TRes Function(Mutation$DeleteCategory$deleteCategory) then,
  ) = _CopyWithImpl$Mutation$DeleteCategory$deleteCategory;

  factory CopyWith$Mutation$DeleteCategory$deleteCategory.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteCategory$deleteCategory;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$DeleteCategory$deleteCategory<TRes>
    implements CopyWith$Mutation$DeleteCategory$deleteCategory<TRes> {
  _CopyWithImpl$Mutation$DeleteCategory$deleteCategory(
    this._instance,
    this._then,
  );

  final Mutation$DeleteCategory$deleteCategory _instance;

  final TRes Function(Mutation$DeleteCategory$deleteCategory) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$DeleteCategory$deleteCategory(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$DeleteCategory$deleteCategory<TRes>
    implements CopyWith$Mutation$DeleteCategory$deleteCategory<TRes> {
  _CopyWithStubImpl$Mutation$DeleteCategory$deleteCategory(this._res);

  final TRes _res;

  @override
  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}
