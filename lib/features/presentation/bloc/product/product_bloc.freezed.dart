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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ProductState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
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
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$AddProductErrorImplCopyWith<$Res> {
  factory _$$AddProductErrorImplCopyWith(_$AddProductErrorImpl value,
          $Res Function(_$AddProductErrorImpl) then) =
      __$$AddProductErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$AddProductErrorImplCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$AddProductErrorImpl>
    implements _$$AddProductErrorImplCopyWith<$Res> {
  __$$AddProductErrorImplCopyWithImpl(
      _$AddProductErrorImpl _value, $Res Function(_$AddProductErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$AddProductErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddProductErrorImpl implements _AddProductError {
  const _$AddProductErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ProductState.addProductError(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddProductErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddProductErrorImplCopyWith<_$AddProductErrorImpl> get copyWith =>
      __$$AddProductErrorImplCopyWithImpl<_$AddProductErrorImpl>(
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
  const factory _AddProductError(final String message) = _$AddProductErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$AddProductErrorImplCopyWith<_$AddProductErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'ProductState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
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
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$AddProductSuccessfulImplCopyWith<$Res> {
  factory _$$AddProductSuccessfulImplCopyWith(_$AddProductSuccessfulImpl value,
          $Res Function(_$AddProductSuccessfulImpl) then) =
      __$$AddProductSuccessfulImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$AddProductSuccessfulImplCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$AddProductSuccessfulImpl>
    implements _$$AddProductSuccessfulImplCopyWith<$Res> {
  __$$AddProductSuccessfulImplCopyWithImpl(_$AddProductSuccessfulImpl _value,
      $Res Function(_$AddProductSuccessfulImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$AddProductSuccessfulImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddProductSuccessfulImpl implements _AddProductSuccessful {
  const _$AddProductSuccessfulImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ProductState.addProductSuccessful(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddProductSuccessfulImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddProductSuccessfulImplCopyWith<_$AddProductSuccessfulImpl>
      get copyWith =>
          __$$AddProductSuccessfulImplCopyWithImpl<_$AddProductSuccessfulImpl>(
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
      _$AddProductSuccessfulImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$AddProductSuccessfulImplCopyWith<_$AddProductSuccessfulImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnLoadedImplCopyWith<$Res> {
  factory _$$OnLoadedImplCopyWith(
          _$OnLoadedImpl value, $Res Function(_$OnLoadedImpl) then) =
      __$$OnLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Product> products});
}

/// @nodoc
class __$$OnLoadedImplCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$OnLoadedImpl>
    implements _$$OnLoadedImplCopyWith<$Res> {
  __$$OnLoadedImplCopyWithImpl(
      _$OnLoadedImpl _value, $Res Function(_$OnLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
  }) {
    return _then(_$OnLoadedImpl(
      null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }
}

/// @nodoc

class _$OnLoadedImpl implements _OnLoaded {
  const _$OnLoadedImpl(final List<Product> products) : _products = products;

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnLoadedImpl &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_products));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnLoadedImplCopyWith<_$OnLoadedImpl> get copyWith =>
      __$$OnLoadedImplCopyWithImpl<_$OnLoadedImpl>(this, _$identity);

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
  const factory _OnLoaded(final List<Product> products) = _$OnLoadedImpl;

  List<Product> get products;
  @JsonKey(ignore: true)
  _$$OnLoadedImplCopyWith<_$OnLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnProductListErrorImplCopyWith<$Res> {
  factory _$$OnProductListErrorImplCopyWith(_$OnProductListErrorImpl value,
          $Res Function(_$OnProductListErrorImpl) then) =
      __$$OnProductListErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$OnProductListErrorImplCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$OnProductListErrorImpl>
    implements _$$OnProductListErrorImplCopyWith<$Res> {
  __$$OnProductListErrorImplCopyWithImpl(_$OnProductListErrorImpl _value,
      $Res Function(_$OnProductListErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$OnProductListErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnProductListErrorImpl implements _OnProductListError {
  const _$OnProductListErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ProductState.onProductListError(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnProductListErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnProductListErrorImplCopyWith<_$OnProductListErrorImpl> get copyWith =>
      __$$OnProductListErrorImplCopyWithImpl<_$OnProductListErrorImpl>(
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
      _$OnProductListErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$OnProductListErrorImplCopyWith<_$OnProductListErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
