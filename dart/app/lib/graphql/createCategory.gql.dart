import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'schema.graphql.dart';

class Variables$Mutation$CreateCategory {
  factory Variables$Mutation$CreateCategory(
          {required Input$NewCategory input}) =>
      Variables$Mutation$CreateCategory._({
        r'input': input,
      });

  Variables$Mutation$CreateCategory._(this._$data);

  factory Variables$Mutation$CreateCategory.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] =
        Input$NewCategory.fromJson((l$input as Map<String, dynamic>));
    return Variables$Mutation$CreateCategory._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$NewCategory get input => (_$data['input'] as Input$NewCategory);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$CreateCategory<Variables$Mutation$CreateCategory>
      get copyWith => CopyWith$Variables$Mutation$CreateCategory(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$CreateCategory ||
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

abstract class CopyWith$Variables$Mutation$CreateCategory<TRes> {
  factory CopyWith$Variables$Mutation$CreateCategory(
    Variables$Mutation$CreateCategory instance,
    TRes Function(Variables$Mutation$CreateCategory) then,
  ) = _CopyWithImpl$Variables$Mutation$CreateCategory;

  factory CopyWith$Variables$Mutation$CreateCategory.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CreateCategory;

  TRes call({Input$NewCategory? input});
}

class _CopyWithImpl$Variables$Mutation$CreateCategory<TRes>
    implements CopyWith$Variables$Mutation$CreateCategory<TRes> {
  _CopyWithImpl$Variables$Mutation$CreateCategory(
    this._instance,
    this._then,
  );

  final Variables$Mutation$CreateCategory _instance;

  final TRes Function(Variables$Mutation$CreateCategory) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({Object? input = _undefined}) =>
      _then(Variables$Mutation$CreateCategory._({
        ..._instance._$data,
        if (input != _undefined && input != null)
          'input': (input as Input$NewCategory),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$CreateCategory<TRes>
    implements CopyWith$Variables$Mutation$CreateCategory<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CreateCategory(this._res);

  final TRes _res;

  @override
  call({Input$NewCategory? input}) => _res;
}

class Mutation$CreateCategory {
  Mutation$CreateCategory({
    required this.createCategory,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CreateCategory.fromJson(Map<String, dynamic> json) {
    final l$createCategory = json['createCategory'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateCategory(
      createCategory: Mutation$CreateCategory$createCategory.fromJson(
          (l$createCategory as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateCategory$createCategory createCategory;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$createCategory = createCategory;
    resultData['createCategory'] = l$createCategory.toJson();
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$createCategory = createCategory;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$createCategory,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateCategory ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$createCategory = createCategory;
    final lOther$createCategory = other.createCategory;
    if (l$createCategory != lOther$createCategory) {
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

extension UtilityExtension$Mutation$CreateCategory on Mutation$CreateCategory {
  CopyWith$Mutation$CreateCategory<Mutation$CreateCategory> get copyWith =>
      CopyWith$Mutation$CreateCategory(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$CreateCategory<TRes> {
  factory CopyWith$Mutation$CreateCategory(
    Mutation$CreateCategory instance,
    TRes Function(Mutation$CreateCategory) then,
  ) = _CopyWithImpl$Mutation$CreateCategory;

  factory CopyWith$Mutation$CreateCategory.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateCategory;

  TRes call({
    Mutation$CreateCategory$createCategory? createCategory,
    String? $__typename,
  });
  CopyWith$Mutation$CreateCategory$createCategory<TRes> get createCategory;
}

class _CopyWithImpl$Mutation$CreateCategory<TRes>
    implements CopyWith$Mutation$CreateCategory<TRes> {
  _CopyWithImpl$Mutation$CreateCategory(
    this._instance,
    this._then,
  );

  final Mutation$CreateCategory _instance;

  final TRes Function(Mutation$CreateCategory) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? createCategory = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateCategory(
        createCategory: createCategory == _undefined || createCategory == null
            ? _instance.createCategory
            : (createCategory as Mutation$CreateCategory$createCategory),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  @override
  CopyWith$Mutation$CreateCategory$createCategory<TRes> get createCategory {
    final local$createCategory = _instance.createCategory;
    return CopyWith$Mutation$CreateCategory$createCategory(
        local$createCategory, (e) => call(createCategory: e));
  }
}

class _CopyWithStubImpl$Mutation$CreateCategory<TRes>
    implements CopyWith$Mutation$CreateCategory<TRes> {
  _CopyWithStubImpl$Mutation$CreateCategory(this._res);

  final TRes _res;

  @override
  call({
    Mutation$CreateCategory$createCategory? createCategory,
    String? $__typename,
  }) =>
      _res;

  @override
  CopyWith$Mutation$CreateCategory$createCategory<TRes> get createCategory =>
      CopyWith$Mutation$CreateCategory$createCategory.stub(_res);
}

const documentNodeMutationCreateCategory = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'CreateCategory'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'NewCategory'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'createCategory'),
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
            name: NameNode(value: 'imageURL'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'order'),
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
Mutation$CreateCategory _parserFn$Mutation$CreateCategory(
        Map<String, dynamic> data) =>
    Mutation$CreateCategory.fromJson(data);
typedef OnMutationCompleted$Mutation$CreateCategory = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$CreateCategory?,
);

class Options$Mutation$CreateCategory
    extends graphql.MutationOptions<Mutation$CreateCategory> {
  Options$Mutation$CreateCategory({
    String? operationName,
    required Variables$Mutation$CreateCategory variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateCategory? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateCategory? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateCategory>? update,
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
                        : _parserFn$Mutation$CreateCategory(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCreateCategory,
          parserFn: _parserFn$Mutation$CreateCategory,
        );

  final OnMutationCompleted$Mutation$CreateCategory? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$CreateCategory
    extends graphql.WatchQueryOptions<Mutation$CreateCategory> {
  WatchOptions$Mutation$CreateCategory({
    String? operationName,
    required Variables$Mutation$CreateCategory variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateCategory? typedOptimisticResult,
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
          document: documentNodeMutationCreateCategory,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$CreateCategory,
        );
}

extension ClientExtension$Mutation$CreateCategory on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CreateCategory>> mutate$CreateCategory(
          Options$Mutation$CreateCategory options) async =>
      await mutate(options);
  graphql.ObservableQuery<Mutation$CreateCategory> watchMutation$CreateCategory(
          WatchOptions$Mutation$CreateCategory options) =>
      watchMutation(options);
}

class Mutation$CreateCategory$HookResult {
  Mutation$CreateCategory$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$CreateCategory runMutation;

  final graphql.QueryResult<Mutation$CreateCategory> result;
}

Mutation$CreateCategory$HookResult useMutation$CreateCategory(
    [WidgetOptions$Mutation$CreateCategory? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$CreateCategory());
  return Mutation$CreateCategory$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$CreateCategory>
    useWatchMutation$CreateCategory(
            WatchOptions$Mutation$CreateCategory options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$CreateCategory
    extends graphql.MutationOptions<Mutation$CreateCategory> {
  WidgetOptions$Mutation$CreateCategory({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateCategory? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateCategory? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateCategory>? update,
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
                        : _parserFn$Mutation$CreateCategory(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCreateCategory,
          parserFn: _parserFn$Mutation$CreateCategory,
        );

  final OnMutationCompleted$Mutation$CreateCategory? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$CreateCategory
    = graphql.MultiSourceResult<Mutation$CreateCategory> Function(
  Variables$Mutation$CreateCategory, {
  Object? optimisticResult,
  Mutation$CreateCategory? typedOptimisticResult,
});
typedef Builder$Mutation$CreateCategory = widgets.Widget Function(
  RunMutation$Mutation$CreateCategory,
  graphql.QueryResult<Mutation$CreateCategory>?,
);

class Mutation$CreateCategory$Widget
    extends graphql_flutter.Mutation<Mutation$CreateCategory> {
  Mutation$CreateCategory$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$CreateCategory? options,
    required Builder$Mutation$CreateCategory builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$CreateCategory(),
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

class Mutation$CreateCategory$createCategory {
  Mutation$CreateCategory$createCategory({
    required this.id,
    required this.name,
    this.imageURL,
    required this.order,
    this.$__typename = 'Category',
  });

  factory Mutation$CreateCategory$createCategory.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$imageURL = json['imageURL'];
    final l$order = json['order'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateCategory$createCategory(
      id: (l$id as String),
      name: (l$name as String),
      imageURL: (l$imageURL as String?),
      order: (l$order as int),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String? imageURL;

  final int order;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$id = id;
    resultData['id'] = l$id;
    final l$name = name;
    resultData['name'] = l$name;
    final l$imageURL = imageURL;
    resultData['imageURL'] = l$imageURL;
    final l$order = order;
    resultData['order'] = l$order;
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$imageURL = imageURL;
    final l$order = order;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$imageURL,
      l$order,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateCategory$createCategory ||
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
    final l$imageURL = imageURL;
    final lOther$imageURL = other.imageURL;
    if (l$imageURL != lOther$imageURL) {
      return false;
    }
    final l$order = order;
    final lOther$order = other.order;
    if (l$order != lOther$order) {
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

extension UtilityExtension$Mutation$CreateCategory$createCategory
    on Mutation$CreateCategory$createCategory {
  CopyWith$Mutation$CreateCategory$createCategory<
          Mutation$CreateCategory$createCategory>
      get copyWith => CopyWith$Mutation$CreateCategory$createCategory(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$CreateCategory$createCategory<TRes> {
  factory CopyWith$Mutation$CreateCategory$createCategory(
    Mutation$CreateCategory$createCategory instance,
    TRes Function(Mutation$CreateCategory$createCategory) then,
  ) = _CopyWithImpl$Mutation$CreateCategory$createCategory;

  factory CopyWith$Mutation$CreateCategory$createCategory.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateCategory$createCategory;

  TRes call({
    String? id,
    String? name,
    String? imageURL,
    int? order,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$CreateCategory$createCategory<TRes>
    implements CopyWith$Mutation$CreateCategory$createCategory<TRes> {
  _CopyWithImpl$Mutation$CreateCategory$createCategory(
    this._instance,
    this._then,
  );

  final Mutation$CreateCategory$createCategory _instance;

  final TRes Function(Mutation$CreateCategory$createCategory) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? imageURL = _undefined,
    Object? order = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateCategory$createCategory(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        imageURL:
            imageURL == _undefined ? _instance.imageURL : (imageURL as String?),
        order: order == _undefined || order == null
            ? _instance.order
            : (order as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$CreateCategory$createCategory<TRes>
    implements CopyWith$Mutation$CreateCategory$createCategory<TRes> {
  _CopyWithStubImpl$Mutation$CreateCategory$createCategory(this._res);

  final TRes _res;

  @override
  call({
    String? id,
    String? name,
    String? imageURL,
    int? order,
    String? $__typename,
  }) =>
      _res;
}
