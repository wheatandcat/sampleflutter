import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Query$ItemFromQR {
  factory Variables$Query$ItemFromQR({required String janCode}) =>
      Variables$Query$ItemFromQR._({
        r'janCode': janCode,
      });

  Variables$Query$ItemFromQR._(this._$data);

  factory Variables$Query$ItemFromQR.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$janCode = data['janCode'];
    result$data['janCode'] = (l$janCode as String);
    return Variables$Query$ItemFromQR._(result$data);
  }

  Map<String, dynamic> _$data;

  String get janCode => (_$data['janCode'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$janCode = janCode;
    result$data['janCode'] = l$janCode;
    return result$data;
  }

  CopyWith$Variables$Query$ItemFromQR<Variables$Query$ItemFromQR>
      get copyWith => CopyWith$Variables$Query$ItemFromQR(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$ItemFromQR ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$janCode = janCode;
    final lOther$janCode = other.janCode;
    if (l$janCode != lOther$janCode) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$janCode = janCode;
    return Object.hashAll([l$janCode]);
  }
}

abstract class CopyWith$Variables$Query$ItemFromQR<TRes> {
  factory CopyWith$Variables$Query$ItemFromQR(
    Variables$Query$ItemFromQR instance,
    TRes Function(Variables$Query$ItemFromQR) then,
  ) = _CopyWithImpl$Variables$Query$ItemFromQR;

  factory CopyWith$Variables$Query$ItemFromQR.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$ItemFromQR;

  TRes call({String? janCode});
}

class _CopyWithImpl$Variables$Query$ItemFromQR<TRes>
    implements CopyWith$Variables$Query$ItemFromQR<TRes> {
  _CopyWithImpl$Variables$Query$ItemFromQR(
    this._instance,
    this._then,
  );

  final Variables$Query$ItemFromQR _instance;

  final TRes Function(Variables$Query$ItemFromQR) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({Object? janCode = _undefined}) =>
      _then(Variables$Query$ItemFromQR._({
        ..._instance._$data,
        if (janCode != _undefined && janCode != null)
          'janCode': (janCode as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$ItemFromQR<TRes>
    implements CopyWith$Variables$Query$ItemFromQR<TRes> {
  _CopyWithStubImpl$Variables$Query$ItemFromQR(this._res);

  final TRes _res;

  @override
  call({String? janCode}) => _res;
}

class Query$ItemFromQR {
  Query$ItemFromQR({
    this.itemFromQR,
    this.$__typename = 'Query',
  });

  factory Query$ItemFromQR.fromJson(Map<String, dynamic> json) {
    final l$itemFromQR = json['itemFromQR'];
    final l$$__typename = json['__typename'];
    return Query$ItemFromQR(
      itemFromQR: l$itemFromQR == null
          ? null
          : Query$ItemFromQR$itemFromQR.fromJson(
              (l$itemFromQR as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$ItemFromQR$itemFromQR? itemFromQR;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$itemFromQR = itemFromQR;
    resultData['itemFromQR'] = l$itemFromQR?.toJson();
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$itemFromQR = itemFromQR;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$itemFromQR,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$ItemFromQR || runtimeType != other.runtimeType) {
      return false;
    }
    final l$itemFromQR = itemFromQR;
    final lOther$itemFromQR = other.itemFromQR;
    if (l$itemFromQR != lOther$itemFromQR) {
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

extension UtilityExtension$Query$ItemFromQR on Query$ItemFromQR {
  CopyWith$Query$ItemFromQR<Query$ItemFromQR> get copyWith =>
      CopyWith$Query$ItemFromQR(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$ItemFromQR<TRes> {
  factory CopyWith$Query$ItemFromQR(
    Query$ItemFromQR instance,
    TRes Function(Query$ItemFromQR) then,
  ) = _CopyWithImpl$Query$ItemFromQR;

  factory CopyWith$Query$ItemFromQR.stub(TRes res) =
      _CopyWithStubImpl$Query$ItemFromQR;

  TRes call({
    Query$ItemFromQR$itemFromQR? itemFromQR,
    String? $__typename,
  });
  CopyWith$Query$ItemFromQR$itemFromQR<TRes> get itemFromQR;
}

class _CopyWithImpl$Query$ItemFromQR<TRes>
    implements CopyWith$Query$ItemFromQR<TRes> {
  _CopyWithImpl$Query$ItemFromQR(
    this._instance,
    this._then,
  );

  final Query$ItemFromQR _instance;

  final TRes Function(Query$ItemFromQR) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? itemFromQR = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$ItemFromQR(
        itemFromQR: itemFromQR == _undefined
            ? _instance.itemFromQR
            : (itemFromQR as Query$ItemFromQR$itemFromQR?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  @override
  CopyWith$Query$ItemFromQR$itemFromQR<TRes> get itemFromQR {
    final local$itemFromQR = _instance.itemFromQR;
    return local$itemFromQR == null
        ? CopyWith$Query$ItemFromQR$itemFromQR.stub(_then(_instance))
        : CopyWith$Query$ItemFromQR$itemFromQR(
            local$itemFromQR, (e) => call(itemFromQR: e));
  }
}

class _CopyWithStubImpl$Query$ItemFromQR<TRes>
    implements CopyWith$Query$ItemFromQR<TRes> {
  _CopyWithStubImpl$Query$ItemFromQR(this._res);

  final TRes _res;

  @override
  call({
    Query$ItemFromQR$itemFromQR? itemFromQR,
    String? $__typename,
  }) =>
      _res;

  @override
  CopyWith$Query$ItemFromQR$itemFromQR<TRes> get itemFromQR =>
      CopyWith$Query$ItemFromQR$itemFromQR.stub(_res);
}

const documentNodeQueryItemFromQR = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'ItemFromQR'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'janCode')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'itemFromQR'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'janCode'),
            value: VariableNode(name: NameNode(value: 'janCode')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
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
            name: NameNode(value: 'images'),
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
Query$ItemFromQR _parserFn$Query$ItemFromQR(Map<String, dynamic> data) =>
    Query$ItemFromQR.fromJson(data);
typedef OnQueryComplete$Query$ItemFromQR = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$ItemFromQR?,
);

class Options$Query$ItemFromQR extends graphql.QueryOptions<Query$ItemFromQR> {
  Options$Query$ItemFromQR({
    String? operationName,
    required Variables$Query$ItemFromQR variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$ItemFromQR? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$ItemFromQR? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$ItemFromQR(data),
                  ),
          onError: onError,
          document: documentNodeQueryItemFromQR,
          parserFn: _parserFn$Query$ItemFromQR,
        );

  final OnQueryComplete$Query$ItemFromQR? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$ItemFromQR
    extends graphql.WatchQueryOptions<Query$ItemFromQR> {
  WatchOptions$Query$ItemFromQR({
    String? operationName,
    required Variables$Query$ItemFromQR variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$ItemFromQR? typedOptimisticResult,
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
          document: documentNodeQueryItemFromQR,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$ItemFromQR,
        );
}

class FetchMoreOptions$Query$ItemFromQR extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$ItemFromQR({
    required super.updateQuery,
    required Variables$Query$ItemFromQR variables,
  }) : super(
          variables: variables.toJson(),
          document: documentNodeQueryItemFromQR,
        );
}

extension ClientExtension$Query$ItemFromQR on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$ItemFromQR>> query$ItemFromQR(
          Options$Query$ItemFromQR options) async =>
      await query(options);
  graphql.ObservableQuery<Query$ItemFromQR> watchQuery$ItemFromQR(
          WatchOptions$Query$ItemFromQR options) =>
      watchQuery(options);
  void writeQuery$ItemFromQR({
    required Query$ItemFromQR data,
    required Variables$Query$ItemFromQR variables,
    bool broadcast = true,
  }) =>
      writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryItemFromQR),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$ItemFromQR? readQuery$ItemFromQR({
    required Variables$Query$ItemFromQR variables,
    bool optimistic = true,
  }) {
    final result = readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryItemFromQR),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$ItemFromQR.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$ItemFromQR> useQuery$ItemFromQR(
        Options$Query$ItemFromQR options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$ItemFromQR> useWatchQuery$ItemFromQR(
        WatchOptions$Query$ItemFromQR options) =>
    graphql_flutter.useWatchQuery(options);

class Query$ItemFromQR$Widget extends graphql_flutter.Query<Query$ItemFromQR> {
  const Query$ItemFromQR$Widget({
    widgets.Key? key,
    required Options$Query$ItemFromQR options,
    required graphql_flutter.QueryBuilder<Query$ItemFromQR> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$ItemFromQR$itemFromQR {
  Query$ItemFromQR$itemFromQR({
    required this.name,
    this.imageURL,
    this.images,
    this.$__typename = 'ItemFromQR',
  });

  factory Query$ItemFromQR$itemFromQR.fromJson(Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$imageURL = json['imageURL'];
    final l$images = json['images'];
    final l$$__typename = json['__typename'];
    return Query$ItemFromQR$itemFromQR(
      name: (l$name as String),
      imageURL: (l$imageURL as String?),
      images: (l$images as List<dynamic>?)?.map((e) => (e as String?)).toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String name;

  final String? imageURL;

  final List<String?>? images;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$name = name;
    resultData['name'] = l$name;
    final l$imageURL = imageURL;
    resultData['imageURL'] = l$imageURL;
    final l$images = images;
    resultData['images'] = l$images?.map((e) => e).toList();
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$imageURL = imageURL;
    final l$images = images;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$imageURL,
      l$images == null ? null : Object.hashAll(l$images.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$ItemFromQR$itemFromQR ||
        runtimeType != other.runtimeType) {
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
    final l$images = images;
    final lOther$images = other.images;
    if (l$images != null && lOther$images != null) {
      if (l$images.length != lOther$images.length) {
        return false;
      }
      for (int i = 0; i < l$images.length; i++) {
        final l$images$entry = l$images[i];
        final lOther$images$entry = lOther$images[i];
        if (l$images$entry != lOther$images$entry) {
          return false;
        }
      }
    } else if (l$images != lOther$images) {
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

extension UtilityExtension$Query$ItemFromQR$itemFromQR
    on Query$ItemFromQR$itemFromQR {
  CopyWith$Query$ItemFromQR$itemFromQR<Query$ItemFromQR$itemFromQR>
      get copyWith => CopyWith$Query$ItemFromQR$itemFromQR(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$ItemFromQR$itemFromQR<TRes> {
  factory CopyWith$Query$ItemFromQR$itemFromQR(
    Query$ItemFromQR$itemFromQR instance,
    TRes Function(Query$ItemFromQR$itemFromQR) then,
  ) = _CopyWithImpl$Query$ItemFromQR$itemFromQR;

  factory CopyWith$Query$ItemFromQR$itemFromQR.stub(TRes res) =
      _CopyWithStubImpl$Query$ItemFromQR$itemFromQR;

  TRes call({
    String? name,
    String? imageURL,
    List<String?>? images,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$ItemFromQR$itemFromQR<TRes>
    implements CopyWith$Query$ItemFromQR$itemFromQR<TRes> {
  _CopyWithImpl$Query$ItemFromQR$itemFromQR(
    this._instance,
    this._then,
  );

  final Query$ItemFromQR$itemFromQR _instance;

  final TRes Function(Query$ItemFromQR$itemFromQR) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? name = _undefined,
    Object? imageURL = _undefined,
    Object? images = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$ItemFromQR$itemFromQR(
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        imageURL:
            imageURL == _undefined ? _instance.imageURL : (imageURL as String?),
        images: images == _undefined
            ? _instance.images
            : (images as List<String?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$ItemFromQR$itemFromQR<TRes>
    implements CopyWith$Query$ItemFromQR$itemFromQR<TRes> {
  _CopyWithStubImpl$Query$ItemFromQR$itemFromQR(this._res);

  final TRes _res;

  @override
  call({
    String? name,
    String? imageURL,
    List<String?>? images,
    String? $__typename,
  }) =>
      _res;
}
