class Input$NewCategory {
  factory Input$NewCategory({
    required String name,
    required int order,
  }) =>
      Input$NewCategory._({
        r'name': name,
        r'order': order,
      });

  Input$NewCategory._(this._$data);

  factory Input$NewCategory.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    final l$order = data['order'];
    result$data['order'] = (l$order as int);
    return Input$NewCategory._(result$data);
  }

  Map<String, dynamic> _$data;

  String get name => (_$data['name'] as String);

  int get order => (_$data['order'] as int);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$name = name;
    result$data['name'] = l$name;
    final l$order = order;
    result$data['order'] = l$order;
    return result$data;
  }

  CopyWith$Input$NewCategory<Input$NewCategory> get copyWith =>
      CopyWith$Input$NewCategory(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$NewCategory) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$order = order;
    final lOther$order = other.order;
    if (l$order != lOther$order) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$order = order;
    return Object.hashAll([
      l$name,
      l$order,
    ]);
  }
}

abstract class CopyWith$Input$NewCategory<TRes> {
  factory CopyWith$Input$NewCategory(
    Input$NewCategory instance,
    TRes Function(Input$NewCategory) then,
  ) = _CopyWithImpl$Input$NewCategory;

  factory CopyWith$Input$NewCategory.stub(TRes res) =
      _CopyWithStubImpl$Input$NewCategory;

  TRes call({
    String? name,
    int? order,
  });
}

class _CopyWithImpl$Input$NewCategory<TRes>
    implements CopyWith$Input$NewCategory<TRes> {
  _CopyWithImpl$Input$NewCategory(
    this._instance,
    this._then,
  );

  final Input$NewCategory _instance;

  final TRes Function(Input$NewCategory) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? order = _undefined,
  }) =>
      _then(Input$NewCategory._({
        ..._instance._$data,
        if (name != _undefined && name != null) 'name': (name as String),
        if (order != _undefined && order != null) 'order': (order as int),
      }));
}

class _CopyWithStubImpl$Input$NewCategory<TRes>
    implements CopyWith$Input$NewCategory<TRes> {
  _CopyWithStubImpl$Input$NewCategory(this._res);

  TRes _res;

  call({
    String? name,
    int? order,
  }) =>
      _res;
}

class Input$UpdateCategory {
  factory Input$UpdateCategory({
    required int id,
    required String name,
    required int order,
  }) =>
      Input$UpdateCategory._({
        r'id': id,
        r'name': name,
        r'order': order,
      });

  Input$UpdateCategory._(this._$data);

  factory Input$UpdateCategory.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    final l$order = data['order'];
    result$data['order'] = (l$order as int);
    return Input$UpdateCategory._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);

  String get name => (_$data['name'] as String);

  int get order => (_$data['order'] as int);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$name = name;
    result$data['name'] = l$name;
    final l$order = order;
    result$data['order'] = l$order;
    return result$data;
  }

  CopyWith$Input$UpdateCategory<Input$UpdateCategory> get copyWith =>
      CopyWith$Input$UpdateCategory(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$UpdateCategory) || runtimeType != other.runtimeType) {
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
    final l$order = order;
    final lOther$order = other.order;
    if (l$order != lOther$order) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$order = order;
    return Object.hashAll([
      l$id,
      l$name,
      l$order,
    ]);
  }
}

abstract class CopyWith$Input$UpdateCategory<TRes> {
  factory CopyWith$Input$UpdateCategory(
    Input$UpdateCategory instance,
    TRes Function(Input$UpdateCategory) then,
  ) = _CopyWithImpl$Input$UpdateCategory;

  factory CopyWith$Input$UpdateCategory.stub(TRes res) =
      _CopyWithStubImpl$Input$UpdateCategory;

  TRes call({
    int? id,
    String? name,
    int? order,
  });
}

class _CopyWithImpl$Input$UpdateCategory<TRes>
    implements CopyWith$Input$UpdateCategory<TRes> {
  _CopyWithImpl$Input$UpdateCategory(
    this._instance,
    this._then,
  );

  final Input$UpdateCategory _instance;

  final TRes Function(Input$UpdateCategory) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? order = _undefined,
  }) =>
      _then(Input$UpdateCategory._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
        if (name != _undefined && name != null) 'name': (name as String),
        if (order != _undefined && order != null) 'order': (order as int),
      }));
}

class _CopyWithStubImpl$Input$UpdateCategory<TRes>
    implements CopyWith$Input$UpdateCategory<TRes> {
  _CopyWithStubImpl$Input$UpdateCategory(this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    int? order,
  }) =>
      _res;
}

class Input$NewItem {
  factory Input$NewItem({
    required int categoryId,
    required String name,
    required int stock,
    String? expirationDate,
    required int order,
  }) =>
      Input$NewItem._({
        r'categoryId': categoryId,
        r'name': name,
        r'stock': stock,
        if (expirationDate != null) r'expirationDate': expirationDate,
        r'order': order,
      });

  Input$NewItem._(this._$data);

  factory Input$NewItem.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$categoryId = data['categoryId'];
    result$data['categoryId'] = (l$categoryId as int);
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    final l$stock = data['stock'];
    result$data['stock'] = (l$stock as int);
    if (data.containsKey('expirationDate')) {
      final l$expirationDate = data['expirationDate'];
      result$data['expirationDate'] = (l$expirationDate as String?);
    }
    final l$order = data['order'];
    result$data['order'] = (l$order as int);
    return Input$NewItem._(result$data);
  }

  Map<String, dynamic> _$data;

  int get categoryId => (_$data['categoryId'] as int);

  String get name => (_$data['name'] as String);

  int get stock => (_$data['stock'] as int);

  String? get expirationDate => (_$data['expirationDate'] as String?);

  int get order => (_$data['order'] as int);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$categoryId = categoryId;
    result$data['categoryId'] = l$categoryId;
    final l$name = name;
    result$data['name'] = l$name;
    final l$stock = stock;
    result$data['stock'] = l$stock;
    if (_$data.containsKey('expirationDate')) {
      final l$expirationDate = expirationDate;
      result$data['expirationDate'] = l$expirationDate;
    }
    final l$order = order;
    result$data['order'] = l$order;
    return result$data;
  }

  CopyWith$Input$NewItem<Input$NewItem> get copyWith => CopyWith$Input$NewItem(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$NewItem) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$categoryId = categoryId;
    final lOther$categoryId = other.categoryId;
    if (l$categoryId != lOther$categoryId) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$stock = stock;
    final lOther$stock = other.stock;
    if (l$stock != lOther$stock) {
      return false;
    }
    final l$expirationDate = expirationDate;
    final lOther$expirationDate = other.expirationDate;
    if (_$data.containsKey('expirationDate') !=
        other._$data.containsKey('expirationDate')) {
      return false;
    }
    if (l$expirationDate != lOther$expirationDate) {
      return false;
    }
    final l$order = order;
    final lOther$order = other.order;
    if (l$order != lOther$order) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$categoryId = categoryId;
    final l$name = name;
    final l$stock = stock;
    final l$expirationDate = expirationDate;
    final l$order = order;
    return Object.hashAll([
      l$categoryId,
      l$name,
      l$stock,
      _$data.containsKey('expirationDate') ? l$expirationDate : const {},
      l$order,
    ]);
  }
}

abstract class CopyWith$Input$NewItem<TRes> {
  factory CopyWith$Input$NewItem(
    Input$NewItem instance,
    TRes Function(Input$NewItem) then,
  ) = _CopyWithImpl$Input$NewItem;

  factory CopyWith$Input$NewItem.stub(TRes res) =
      _CopyWithStubImpl$Input$NewItem;

  TRes call({
    int? categoryId,
    String? name,
    int? stock,
    String? expirationDate,
    int? order,
  });
}

class _CopyWithImpl$Input$NewItem<TRes>
    implements CopyWith$Input$NewItem<TRes> {
  _CopyWithImpl$Input$NewItem(
    this._instance,
    this._then,
  );

  final Input$NewItem _instance;

  final TRes Function(Input$NewItem) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? categoryId = _undefined,
    Object? name = _undefined,
    Object? stock = _undefined,
    Object? expirationDate = _undefined,
    Object? order = _undefined,
  }) =>
      _then(Input$NewItem._({
        ..._instance._$data,
        if (categoryId != _undefined && categoryId != null)
          'categoryId': (categoryId as int),
        if (name != _undefined && name != null) 'name': (name as String),
        if (stock != _undefined && stock != null) 'stock': (stock as int),
        if (expirationDate != _undefined)
          'expirationDate': (expirationDate as String?),
        if (order != _undefined && order != null) 'order': (order as int),
      }));
}

class _CopyWithStubImpl$Input$NewItem<TRes>
    implements CopyWith$Input$NewItem<TRes> {
  _CopyWithStubImpl$Input$NewItem(this._res);

  TRes _res;

  call({
    int? categoryId,
    String? name,
    int? stock,
    String? expirationDate,
    int? order,
  }) =>
      _res;
}

class Input$UpdateItem {
  factory Input$UpdateItem({
    required int id,
    required int categoryId,
    required String name,
    required int stock,
    String? expirationDate,
    required int order,
  }) =>
      Input$UpdateItem._({
        r'id': id,
        r'categoryId': categoryId,
        r'name': name,
        r'stock': stock,
        if (expirationDate != null) r'expirationDate': expirationDate,
        r'order': order,
      });

  Input$UpdateItem._(this._$data);

  factory Input$UpdateItem.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    final l$categoryId = data['categoryId'];
    result$data['categoryId'] = (l$categoryId as int);
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    final l$stock = data['stock'];
    result$data['stock'] = (l$stock as int);
    if (data.containsKey('expirationDate')) {
      final l$expirationDate = data['expirationDate'];
      result$data['expirationDate'] = (l$expirationDate as String?);
    }
    final l$order = data['order'];
    result$data['order'] = (l$order as int);
    return Input$UpdateItem._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);

  int get categoryId => (_$data['categoryId'] as int);

  String get name => (_$data['name'] as String);

  int get stock => (_$data['stock'] as int);

  String? get expirationDate => (_$data['expirationDate'] as String?);

  int get order => (_$data['order'] as int);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$categoryId = categoryId;
    result$data['categoryId'] = l$categoryId;
    final l$name = name;
    result$data['name'] = l$name;
    final l$stock = stock;
    result$data['stock'] = l$stock;
    if (_$data.containsKey('expirationDate')) {
      final l$expirationDate = expirationDate;
      result$data['expirationDate'] = l$expirationDate;
    }
    final l$order = order;
    result$data['order'] = l$order;
    return result$data;
  }

  CopyWith$Input$UpdateItem<Input$UpdateItem> get copyWith =>
      CopyWith$Input$UpdateItem(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$UpdateItem) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$categoryId = categoryId;
    final lOther$categoryId = other.categoryId;
    if (l$categoryId != lOther$categoryId) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$stock = stock;
    final lOther$stock = other.stock;
    if (l$stock != lOther$stock) {
      return false;
    }
    final l$expirationDate = expirationDate;
    final lOther$expirationDate = other.expirationDate;
    if (_$data.containsKey('expirationDate') !=
        other._$data.containsKey('expirationDate')) {
      return false;
    }
    if (l$expirationDate != lOther$expirationDate) {
      return false;
    }
    final l$order = order;
    final lOther$order = other.order;
    if (l$order != lOther$order) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$categoryId = categoryId;
    final l$name = name;
    final l$stock = stock;
    final l$expirationDate = expirationDate;
    final l$order = order;
    return Object.hashAll([
      l$id,
      l$categoryId,
      l$name,
      l$stock,
      _$data.containsKey('expirationDate') ? l$expirationDate : const {},
      l$order,
    ]);
  }
}

abstract class CopyWith$Input$UpdateItem<TRes> {
  factory CopyWith$Input$UpdateItem(
    Input$UpdateItem instance,
    TRes Function(Input$UpdateItem) then,
  ) = _CopyWithImpl$Input$UpdateItem;

  factory CopyWith$Input$UpdateItem.stub(TRes res) =
      _CopyWithStubImpl$Input$UpdateItem;

  TRes call({
    int? id,
    int? categoryId,
    String? name,
    int? stock,
    String? expirationDate,
    int? order,
  });
}

class _CopyWithImpl$Input$UpdateItem<TRes>
    implements CopyWith$Input$UpdateItem<TRes> {
  _CopyWithImpl$Input$UpdateItem(
    this._instance,
    this._then,
  );

  final Input$UpdateItem _instance;

  final TRes Function(Input$UpdateItem) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? categoryId = _undefined,
    Object? name = _undefined,
    Object? stock = _undefined,
    Object? expirationDate = _undefined,
    Object? order = _undefined,
  }) =>
      _then(Input$UpdateItem._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
        if (categoryId != _undefined && categoryId != null)
          'categoryId': (categoryId as int),
        if (name != _undefined && name != null) 'name': (name as String),
        if (stock != _undefined && stock != null) 'stock': (stock as int),
        if (expirationDate != _undefined)
          'expirationDate': (expirationDate as String?),
        if (order != _undefined && order != null) 'order': (order as int),
      }));
}

class _CopyWithStubImpl$Input$UpdateItem<TRes>
    implements CopyWith$Input$UpdateItem<TRes> {
  _CopyWithStubImpl$Input$UpdateItem(this._res);

  TRes _res;

  call({
    int? id,
    int? categoryId,
    String? name,
    int? stock,
    String? expirationDate,
    int? order,
  }) =>
      _res;
}

enum Enum$__TypeKind {
  SCALAR,
  OBJECT,
  INTERFACE,
  UNION,
  ENUM,
  INPUT_OBJECT,
  LIST,
  NON_NULL,
  $unknown
}

String toJson$Enum$__TypeKind(Enum$__TypeKind e) {
  switch (e) {
    case Enum$__TypeKind.SCALAR:
      return r'SCALAR';
    case Enum$__TypeKind.OBJECT:
      return r'OBJECT';
    case Enum$__TypeKind.INTERFACE:
      return r'INTERFACE';
    case Enum$__TypeKind.UNION:
      return r'UNION';
    case Enum$__TypeKind.ENUM:
      return r'ENUM';
    case Enum$__TypeKind.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__TypeKind.LIST:
      return r'LIST';
    case Enum$__TypeKind.NON_NULL:
      return r'NON_NULL';
    case Enum$__TypeKind.$unknown:
      return r'$unknown';
  }
}

Enum$__TypeKind fromJson$Enum$__TypeKind(String value) {
  switch (value) {
    case r'SCALAR':
      return Enum$__TypeKind.SCALAR;
    case r'OBJECT':
      return Enum$__TypeKind.OBJECT;
    case r'INTERFACE':
      return Enum$__TypeKind.INTERFACE;
    case r'UNION':
      return Enum$__TypeKind.UNION;
    case r'ENUM':
      return Enum$__TypeKind.ENUM;
    case r'INPUT_OBJECT':
      return Enum$__TypeKind.INPUT_OBJECT;
    case r'LIST':
      return Enum$__TypeKind.LIST;
    case r'NON_NULL':
      return Enum$__TypeKind.NON_NULL;
    default:
      return Enum$__TypeKind.$unknown;
  }
}

enum Enum$__DirectiveLocation {
  QUERY,
  MUTATION,
  SUBSCRIPTION,
  FIELD,
  FRAGMENT_DEFINITION,
  FRAGMENT_SPREAD,
  INLINE_FRAGMENT,
  VARIABLE_DEFINITION,
  SCHEMA,
  SCALAR,
  OBJECT,
  FIELD_DEFINITION,
  ARGUMENT_DEFINITION,
  INTERFACE,
  UNION,
  ENUM,
  ENUM_VALUE,
  INPUT_OBJECT,
  INPUT_FIELD_DEFINITION,
  $unknown
}

String toJson$Enum$__DirectiveLocation(Enum$__DirectiveLocation e) {
  switch (e) {
    case Enum$__DirectiveLocation.QUERY:
      return r'QUERY';
    case Enum$__DirectiveLocation.MUTATION:
      return r'MUTATION';
    case Enum$__DirectiveLocation.SUBSCRIPTION:
      return r'SUBSCRIPTION';
    case Enum$__DirectiveLocation.FIELD:
      return r'FIELD';
    case Enum$__DirectiveLocation.FRAGMENT_DEFINITION:
      return r'FRAGMENT_DEFINITION';
    case Enum$__DirectiveLocation.FRAGMENT_SPREAD:
      return r'FRAGMENT_SPREAD';
    case Enum$__DirectiveLocation.INLINE_FRAGMENT:
      return r'INLINE_FRAGMENT';
    case Enum$__DirectiveLocation.VARIABLE_DEFINITION:
      return r'VARIABLE_DEFINITION';
    case Enum$__DirectiveLocation.SCHEMA:
      return r'SCHEMA';
    case Enum$__DirectiveLocation.SCALAR:
      return r'SCALAR';
    case Enum$__DirectiveLocation.OBJECT:
      return r'OBJECT';
    case Enum$__DirectiveLocation.FIELD_DEFINITION:
      return r'FIELD_DEFINITION';
    case Enum$__DirectiveLocation.ARGUMENT_DEFINITION:
      return r'ARGUMENT_DEFINITION';
    case Enum$__DirectiveLocation.INTERFACE:
      return r'INTERFACE';
    case Enum$__DirectiveLocation.UNION:
      return r'UNION';
    case Enum$__DirectiveLocation.ENUM:
      return r'ENUM';
    case Enum$__DirectiveLocation.ENUM_VALUE:
      return r'ENUM_VALUE';
    case Enum$__DirectiveLocation.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION:
      return r'INPUT_FIELD_DEFINITION';
    case Enum$__DirectiveLocation.$unknown:
      return r'$unknown';
  }
}

Enum$__DirectiveLocation fromJson$Enum$__DirectiveLocation(String value) {
  switch (value) {
    case r'QUERY':
      return Enum$__DirectiveLocation.QUERY;
    case r'MUTATION':
      return Enum$__DirectiveLocation.MUTATION;
    case r'SUBSCRIPTION':
      return Enum$__DirectiveLocation.SUBSCRIPTION;
    case r'FIELD':
      return Enum$__DirectiveLocation.FIELD;
    case r'FRAGMENT_DEFINITION':
      return Enum$__DirectiveLocation.FRAGMENT_DEFINITION;
    case r'FRAGMENT_SPREAD':
      return Enum$__DirectiveLocation.FRAGMENT_SPREAD;
    case r'INLINE_FRAGMENT':
      return Enum$__DirectiveLocation.INLINE_FRAGMENT;
    case r'VARIABLE_DEFINITION':
      return Enum$__DirectiveLocation.VARIABLE_DEFINITION;
    case r'SCHEMA':
      return Enum$__DirectiveLocation.SCHEMA;
    case r'SCALAR':
      return Enum$__DirectiveLocation.SCALAR;
    case r'OBJECT':
      return Enum$__DirectiveLocation.OBJECT;
    case r'FIELD_DEFINITION':
      return Enum$__DirectiveLocation.FIELD_DEFINITION;
    case r'ARGUMENT_DEFINITION':
      return Enum$__DirectiveLocation.ARGUMENT_DEFINITION;
    case r'INTERFACE':
      return Enum$__DirectiveLocation.INTERFACE;
    case r'UNION':
      return Enum$__DirectiveLocation.UNION;
    case r'ENUM':
      return Enum$__DirectiveLocation.ENUM;
    case r'ENUM_VALUE':
      return Enum$__DirectiveLocation.ENUM_VALUE;
    case r'INPUT_OBJECT':
      return Enum$__DirectiveLocation.INPUT_OBJECT;
    case r'INPUT_FIELD_DEFINITION':
      return Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION;
    default:
      return Enum$__DirectiveLocation.$unknown;
  }
}

const possibleTypesMap = <String, Set<String>>{};
