// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) addProductError,
    required TResult Function() loading,
    required TResult Function(String message) addProductSuccessful,
    required TResult Function(List<Product> products) onProductList,
    required TResult Function(String message) onProductListError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? addProductError,
    TResult? Function()? loading,
    TResult? Function(String message)? addProductSuccessful,
    TResult? Function(List<Product> products)? onProductList,
    TResult? Function(String message)? onProductListError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? addProductError,
    TResult Function()? loading,
    TResult Function(String message)? addProductSuccessful,
    TResult Function(List<Product> products)? onProductList,
    TResult Function(String message)? onProductListError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_AddProductError value) addProductError,
    required TResult Function(_Loading value) loading,
    required TResult Function(_AddProductSuccessful value) addProductSuccessful,
    required TResult Function(_OnLoaded value) onProductList,
    required TResult Function(_OnProductListError value) onProductListError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_AddProductError value)? addProductError,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AddProductSuccessful value)? addProductSuccessful,
    TResult? Function(_OnLoaded value)? onProductList,
    TResult? Function(_OnProductListError value)? onProductListError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_AddProductError value)? addProductError,
    TResult Function(_Loading value)? loading,
    TResult Function(_AddProductSuccessful value)? addProductSuccessful,
    TResult Function(_OnLoaded value)? onProductList,
    TResult Function(_OnProductListError value)? onProductListError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductStateCopyWith<$Res> {
  factory $ProductStateCopyWith(
          ProductState value, $Res Function(ProductState) then) =
      _$ProductStateCopyWithImpl<$Res, ProductState>;
}

/// @nodoc
class _$ProductStateCopyWithImpl<$Res, $Val extends ProductState>
    implements $ProductStateCopyWith<$Res> {
  _$ProductStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'ProductState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) addProductError,
    required TResult Function() loading,
    required TResult Function(String message) addProductSuccessful,
    required TResult Function(List<Product> products) onProductList,
    required TResult Function(String message) onProductListError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? addProductError,
    TResult? Function()? loading,
    TResult? Function(String message)? addProductSuccessful,
    TResult? Function(List<Product> products)? onProductList,
    TResult? Function(String message)? onProductListError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? addProductError,
    TResult Function()? loading,
    TResult Function(String message)? addProductSuccessful,
    TResult Function(List<Product> products)? onProductList,
    TResult Function(String message)? onProductListError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_AddProductError value) addProductError,
    required TResult Function(_Loading value) loading,
    required TResult Function(_AddProductSuccessful value) addProductSuccessful,
    required TResult Function(_OnLoaded value) onProductList,
    required TResult Function(_OnProductListError value) onProductListError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_AddProductError value)? addProductError,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AddProductSuccessful value)? addProductSuccessful,
    TResult? Function(_OnLoaded value)? onProductList,
    TResult? Function(_OnProductListError value)? onProductListError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_AddProductError value)? addProductError,
    TResult Function(_Loading value)? loading,
    TResult Function(_AddProductSuccessful value)? addProductSuccessful,
    TResult Function(_OnLoaded value)? onProductList,
    TResult Function(_OnProductListError value)? onProductListError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ProductState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_AddProductErrorCopyWith<$Res> {
  factory _$$_AddProductErrorCopyWith(
          _$_AddProductError value, $Res Function(_$_AddProductError) then) =
      __$$_AddProductErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_AddProductErrorCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$_AddProductError>
    implements _$$_AddProductErrorCopyWith<$Res> {
  __$$_AddProductErrorCopyWithImpl(
      _$_AddProductError _value, $Res Function(_$_AddProductError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_AddProductError(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AddProductError implements _AddProductError {
  const _$_AddProductError(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ProductState.addProductError(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddProductError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddProductErrorCopyWith<_$_AddProductError> get copyWith =>
      __$$_AddProductErrorCopyWithImpl<_$_AddProductError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) addProductError,
    required TResult Function() loading,
    required TResult Function(String message) addProductSuccessful,
    required TResult Function(List<Product> products) onProductList,
    required TResult Function(String message) onProductListError,
  }) {
    return addProductError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? addProductError,
    TResult? Function()? loading,
    TResult? Function(String message)? addProductSuccessful,
    TResult? Function(List<Product> products)? onProductList,
    TResult? Function(String message)? onProductListError,
  }) {
    return addProductError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? addProductError,
    TResult Function()? loading,
    TResult Function(String message)? addProductSuccessful,
    TResult Function(List<Product> products)? onProductList,
    TResult Function(String message)? onProductListError,
    required TResult orElse(),
  }) {
    if (addProductError != null) {
      return addProductError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_AddProductError value) addProductError,
    required TResult Function(_Loading value) loading,
    required TResult Function(_AddProductSuccessful value) addProductSuccessful,
    required TResult Function(_OnLoaded value) onProductList,
    required TResult Function(_OnProductListError value) onProductListError,
  }) {
    return addProductError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_AddProductError value)? addProductError,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AddProductSuccessful value)? addProductSuccessful,
    TResult? Function(_OnLoaded value)? onProductList,
    TResult? Function(_OnProductListError value)? onProductListError,
  }) {
    return addProductError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_AddProductError value)? addProductError,
    TResult Function(_Loading value)? loading,
    TResult Function(_AddProductSuccessful value)? addProductSuccessful,
    TResult Function(_OnLoaded value)? onProductList,
    TResult Function(_OnProductListError value)? onProductListError,
    required TResult orElse(),
  }) {
    if (addProductError != null) {
      return addProductError(this);
    }
    return orElse();
  }
}

abstract class _AddProductError implements ProductState {
  const factory _AddProductError(final String message) = _$_AddProductError;

  String get message;
  @JsonKey(ignore: true)
  _$$_AddProductErrorCopyWith<_$_AddProductError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'ProductState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) addProductError,
    required TResult Function() loading,
    required TResult Function(String message) addProductSuccessful,
    required TResult Function(List<Product> products) onProductList,
    required TResult Function(String message) onProductListError,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? addProductError,
    TResult? Function()? loading,
    TResult? Function(String message)? addProductSuccessful,
    TResult? Function(List<Product> products)? onProductList,
    TResult? Function(String message)? onProductListError,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? addProductError,
    TResult Function()? loading,
    TResult Function(String message)? addProductSuccessful,
    TResult Function(List<Product> products)? onProductList,
    TResult Function(String message)? onProductListError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_AddProductError value) addProductError,
    required TResult Function(_Loading value) loading,
    required TResult Function(_AddProductSuccessful value) addProductSuccessful,
    required TResult Function(_OnLoaded value) onProductList,
    required TResult Function(_OnProductListError value) onProductListError,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_AddProductError value)? addProductError,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AddProductSuccessful value)? addProductSuccessful,
    TResult? Function(_OnLoaded value)? onProductList,
    TResult? Function(_OnProductListError value)? onProductListError,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_AddProductError value)? addProductError,
    TResult Function(_Loading value)? loading,
    TResult Function(_AddProductSuccessful value)? addProductSuccessful,
    TResult Function(_OnLoaded value)? onProductList,
    TResult Function(_OnProductListError value)? onProductListError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ProductState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$$_AddProductSuccessfulCopyWith<$Res> {
  factory _$$_AddProductSuccessfulCopyWith(_$_AddProductSuccessful value,
          $Res Function(_$_AddProductSuccessful) then) =
      __$$_AddProductSuccessfulCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_AddProductSuccessfulCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$_AddProductSuccessful>
    implements _$$_AddProductSuccessfulCopyWith<$Res> {
  __$$_AddProductSuccessfulCopyWithImpl(_$_AddProductSuccessful _value,
      $Res Function(_$_AddProductSuccessful) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_AddProductSuccessful(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AddProductSuccessful implements _AddProductSuccessful {
  const _$_AddProductSuccessful(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ProductState.addProductSuccessful(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddProductSuccessful &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddProductSuccessfulCopyWith<_$_AddProductSuccessful> get copyWith =>
      __$$_AddProductSuccessfulCopyWithImpl<_$_AddProductSuccessful>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) addProductError,
    required TResult Function() loading,
    required TResult Function(String message) addProductSuccessful,
    required TResult Function(List<Product> products) onProductList,
    required TResult Function(String message) onProductListError,
  }) {
    return addProductSuccessful(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? addProductError,
    TResult? Function()? loading,
    TResult? Function(String message)? addProductSuccessful,
    TResult? Function(List<Product> products)? onProductList,
    TResult? Function(String message)? onProductListError,
  }) {
    return addProductSuccessful?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? addProductError,
    TResult Function()? loading,
    TResult Function(String message)? addProductSuccessful,
    TResult Function(List<Product> products)? onProductList,
    TResult Function(String message)? onProductListError,
    required TResult orElse(),
  }) {
    if (addProductSuccessful != null) {
      return addProductSuccessful(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_AddProductError value) addProductError,
    required TResult Function(_Loading value) loading,
    required TResult Function(_AddProductSuccessful value) addProductSuccessful,
    required TResult Function(_OnLoaded value) onProductList,
    required TResult Function(_OnProductListError value) onProductListError,
  }) {
    return addProductSuccessful(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_AddProductError value)? addProductError,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AddProductSuccessful value)? addProductSuccessful,
    TResult? Function(_OnLoaded value)? onProductList,
    TResult? Function(_OnProductListError value)? onProductListError,
  }) {
    return addProductSuccessful?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_AddProductError value)? addProductError,
    TResult Function(_Loading value)? loading,
    TResult Function(_AddProductSuccessful value)? addProductSuccessful,
    TResult Function(_OnLoaded value)? onProductList,
    TResult Function(_OnProductListError value)? onProductListError,
    required TResult orElse(),
  }) {
    if (addProductSuccessful != null) {
      return addProductSuccessful(this);
    }
    return orElse();
  }
}

abstract class _AddProductSuccessful implements ProductState {
  const factory _AddProductSuccessful(final String message) =
      _$_AddProductSuccessful;

  String get message;
  @JsonKey(ignore: true)
  _$$_AddProductSuccessfulCopyWith<_$_AddProductSuccessful> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_OnLoadedCopyWith<$Res> {
  factory _$$_OnLoadedCopyWith(
          _$_OnLoaded value, $Res Function(_$_OnLoaded) then) =
      __$$_OnLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Product> products});
}

/// @nodoc
class __$$_OnLoadedCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$_OnLoaded>
    implements _$$_OnLoadedCopyWith<$Res> {
  __$$_OnLoadedCopyWithImpl(
      _$_OnLoaded _value, $Res Function(_$_OnLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
  }) {
    return _then(_$_OnLoaded(
      null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }
}

/// @nodoc

class _$_OnLoaded implements _OnLoaded {
  const _$_OnLoaded(final List<Product> products) : _products = products;

  final List<Product> _products;
  @override
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'ProductState.onProductList(products: $products)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OnLoaded &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_products));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OnLoadedCopyWith<_$_OnLoaded> get copyWith =>
      __$$_OnLoadedCopyWithImpl<_$_OnLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) addProductError,
    required TResult Function() loading,
    required TResult Function(String message) addProductSuccessful,
    required TResult Function(List<Product> products) onProductList,
    required TResult Function(String message) onProductListError,
  }) {
    return onProductList(products);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? addProductError,
    TResult? Function()? loading,
    TResult? Function(String message)? addProductSuccessful,
    TResult? Function(List<Product> products)? onProductList,
    TResult? Function(String message)? onProductListError,
  }) {
    return onProductList?.call(products);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? addProductError,
    TResult Function()? loading,
    TResult Function(String message)? addProductSuccessful,
    TResult Function(List<Product> products)? onProductList,
    TResult Function(String message)? onProductListError,
    required TResult orElse(),
  }) {
    if (onProductList != null) {
      return onProductList(products);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_AddProductError value) addProductError,
    required TResult Function(_Loading value) loading,
    required TResult Function(_AddProductSuccessful value) addProductSuccessful,
    required TResult Function(_OnLoaded value) onProductList,
    required TResult Function(_OnProductListError value) onProductListError,
  }) {
    return onProductList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_AddProductError value)? addProductError,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AddProductSuccessful value)? addProductSuccessful,
    TResult? Function(_OnLoaded value)? onProductList,
    TResult? Function(_OnProductListError value)? onProductListError,
  }) {
    return onProductList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_AddProductError value)? addProductError,
    TResult Function(_Loading value)? loading,
    TResult Function(_AddProductSuccessful value)? addProductSuccessful,
    TResult Function(_OnLoaded value)? onProductList,
    TResult Function(_OnProductListError value)? onProductListError,
    required TResult orElse(),
  }) {
    if (onProductList != null) {
      return onProductList(this);
    }
    return orElse();
  }
}

abstract class _OnLoaded implements ProductState {
  const factory _OnLoaded(final List<Product> products) = _$_OnLoaded;

  List<Product> get products;
  @JsonKey(ignore: true)
  _$$_OnLoadedCopyWith<_$_OnLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_OnProductListErrorCopyWith<$Res> {
  factory _$$_OnProductListErrorCopyWith(_$_OnProductListError value,
          $Res Function(_$_OnProductListError) then) =
      __$$_OnProductListErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_OnProductListErrorCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$_OnProductListError>
    implements _$$_OnProductListErrorCopyWith<$Res> {
  __$$_OnProductListErrorCopyWithImpl(
      _$_OnProductListError _value, $Res Function(_$_OnProductListError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_OnProductListError(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_OnProductListError implements _OnProductListError {
  const _$_OnProductListError(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ProductState.onProductListError(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OnProductListError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OnProductListErrorCopyWith<_$_OnProductListError> get copyWith =>
      __$$_OnProductListErrorCopyWithImpl<_$_OnProductListError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) addProductError,
    required TResult Function() loading,
    required TResult Function(String message) addProductSuccessful,
    required TResult Function(List<Product> products) onProductList,
    required TResult Function(String message) onProductListError,
  }) {
    return onProductListError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? addProductError,
    TResult? Function()? loading,
    TResult? Function(String message)? addProductSuccessful,
    TResult? Function(List<Product> products)? onProductList,
    TResult? Function(String message)? onProductListError,
  }) {
    return onProductListError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? addProductError,
    TResult Function()? loading,
    TResult Function(String message)? addProductSuccessful,
    TResult Function(List<Product> products)? onProductList,
    TResult Function(String message)? onProductListError,
    required TResult orElse(),
  }) {
    if (onProductListError != null) {
      return onProductListError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_AddProductError value) addProductError,
    required TResult Function(_Loading value) loading,
    required TResult Function(_AddProductSuccessful value) addProductSuccessful,
    required TResult Function(_OnLoaded value) onProductList,
    required TResult Function(_OnProductListError value) onProductListError,
  }) {
    return onProductListError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_AddProductError value)? addProductError,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AddProductSuccessful value)? addProductSuccessful,
    TResult? Function(_OnLoaded value)? onProductList,
    TResult? Function(_OnProductListError value)? onProductListError,
  }) {
    return onProductListError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_AddProductError value)? addProductError,
    TResult Function(_Loading value)? loading,
    TResult Function(_AddProductSuccessful value)? addProductSuccessful,
    TResult Function(_OnLoaded value)? onProductList,
    TResult Function(_OnProductListError value)? onProductListError,
    required TResult orElse(),
  }) {
    if (onProductListError != null) {
      return onProductListError(this);
    }
    return orElse();
  }
}

abstract class _OnProductListError implements ProductState {
  const factory _OnProductListError(final String message) =
      _$_OnProductListError;

  String get message;
  @JsonKey(ignore: true)
  _$$_OnProductListErrorCopyWith<_$_OnProductListError> get copyWith =>
      throw _privateConstructorUsedError;
}
