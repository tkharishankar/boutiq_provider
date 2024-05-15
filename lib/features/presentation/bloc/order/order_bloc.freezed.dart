// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrderState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<OrderSummary> products) onOrderList,
    required TResult Function(String message) onOrderListError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<OrderSummary> products)? onOrderList,
    TResult? Function(String message)? onOrderListError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<OrderSummary> products)? onOrderList,
    TResult Function(String message)? onOrderListError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_OnLoaded value) onOrderList,
    required TResult Function(_OnOrderListError value) onOrderListError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_OnLoaded value)? onOrderList,
    TResult? Function(_OnOrderListError value)? onOrderListError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_OnLoaded value)? onOrderList,
    TResult Function(_OnOrderListError value)? onOrderListError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderStateCopyWith<$Res> {
  factory $OrderStateCopyWith(
          OrderState value, $Res Function(OrderState) then) =
      _$OrderStateCopyWithImpl<$Res, OrderState>;
}

/// @nodoc
class _$OrderStateCopyWithImpl<$Res, $Val extends OrderState>
    implements $OrderStateCopyWith<$Res> {
  _$OrderStateCopyWithImpl(this._value, this._then);

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
    extends _$OrderStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'OrderState.initial()';
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
    required TResult Function() loading,
    required TResult Function(List<OrderSummary> products) onOrderList,
    required TResult Function(String message) onOrderListError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<OrderSummary> products)? onOrderList,
    TResult? Function(String message)? onOrderListError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<OrderSummary> products)? onOrderList,
    TResult Function(String message)? onOrderListError,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_OnLoaded value) onOrderList,
    required TResult Function(_OnOrderListError value) onOrderListError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_OnLoaded value)? onOrderList,
    TResult? Function(_OnOrderListError value)? onOrderListError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_OnLoaded value)? onOrderList,
    TResult Function(_OnOrderListError value)? onOrderListError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements OrderState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'OrderState.loading()';
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
    required TResult Function() loading,
    required TResult Function(List<OrderSummary> products) onOrderList,
    required TResult Function(String message) onOrderListError,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<OrderSummary> products)? onOrderList,
    TResult? Function(String message)? onOrderListError,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<OrderSummary> products)? onOrderList,
    TResult Function(String message)? onOrderListError,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_OnLoaded value) onOrderList,
    required TResult Function(_OnOrderListError value) onOrderListError,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_OnLoaded value)? onOrderList,
    TResult? Function(_OnOrderListError value)? onOrderListError,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_OnLoaded value)? onOrderList,
    TResult Function(_OnOrderListError value)? onOrderListError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements OrderState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$OnLoadedImplCopyWith<$Res> {
  factory _$$OnLoadedImplCopyWith(
          _$OnLoadedImpl value, $Res Function(_$OnLoadedImpl) then) =
      __$$OnLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<OrderSummary> products});
}

/// @nodoc
class __$$OnLoadedImplCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$OnLoadedImpl>
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
              as List<OrderSummary>,
    ));
  }
}

/// @nodoc

class _$OnLoadedImpl implements _OnLoaded {
  const _$OnLoadedImpl(final List<OrderSummary> products)
      : _products = products;

  final List<OrderSummary> _products;
  @override
  List<OrderSummary> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'OrderState.onOrderList(products: $products)';
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
    required TResult Function() loading,
    required TResult Function(List<OrderSummary> products) onOrderList,
    required TResult Function(String message) onOrderListError,
  }) {
    return onOrderList(products);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<OrderSummary> products)? onOrderList,
    TResult? Function(String message)? onOrderListError,
  }) {
    return onOrderList?.call(products);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<OrderSummary> products)? onOrderList,
    TResult Function(String message)? onOrderListError,
    required TResult orElse(),
  }) {
    if (onOrderList != null) {
      return onOrderList(products);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_OnLoaded value) onOrderList,
    required TResult Function(_OnOrderListError value) onOrderListError,
  }) {
    return onOrderList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_OnLoaded value)? onOrderList,
    TResult? Function(_OnOrderListError value)? onOrderListError,
  }) {
    return onOrderList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_OnLoaded value)? onOrderList,
    TResult Function(_OnOrderListError value)? onOrderListError,
    required TResult orElse(),
  }) {
    if (onOrderList != null) {
      return onOrderList(this);
    }
    return orElse();
  }
}

abstract class _OnLoaded implements OrderState {
  const factory _OnLoaded(final List<OrderSummary> products) = _$OnLoadedImpl;

  List<OrderSummary> get products;
  @JsonKey(ignore: true)
  _$$OnLoadedImplCopyWith<_$OnLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnOrderListErrorImplCopyWith<$Res> {
  factory _$$OnOrderListErrorImplCopyWith(_$OnOrderListErrorImpl value,
          $Res Function(_$OnOrderListErrorImpl) then) =
      __$$OnOrderListErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$OnOrderListErrorImplCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$OnOrderListErrorImpl>
    implements _$$OnOrderListErrorImplCopyWith<$Res> {
  __$$OnOrderListErrorImplCopyWithImpl(_$OnOrderListErrorImpl _value,
      $Res Function(_$OnOrderListErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$OnOrderListErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnOrderListErrorImpl implements _OnOrderListError {
  const _$OnOrderListErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'OrderState.onOrderListError(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnOrderListErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnOrderListErrorImplCopyWith<_$OnOrderListErrorImpl> get copyWith =>
      __$$OnOrderListErrorImplCopyWithImpl<_$OnOrderListErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<OrderSummary> products) onOrderList,
    required TResult Function(String message) onOrderListError,
  }) {
    return onOrderListError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<OrderSummary> products)? onOrderList,
    TResult? Function(String message)? onOrderListError,
  }) {
    return onOrderListError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<OrderSummary> products)? onOrderList,
    TResult Function(String message)? onOrderListError,
    required TResult orElse(),
  }) {
    if (onOrderListError != null) {
      return onOrderListError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_OnLoaded value) onOrderList,
    required TResult Function(_OnOrderListError value) onOrderListError,
  }) {
    return onOrderListError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_OnLoaded value)? onOrderList,
    TResult? Function(_OnOrderListError value)? onOrderListError,
  }) {
    return onOrderListError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_OnLoaded value)? onOrderList,
    TResult Function(_OnOrderListError value)? onOrderListError,
    required TResult orElse(),
  }) {
    if (onOrderListError != null) {
      return onOrderListError(this);
    }
    return orElse();
  }
}

abstract class _OnOrderListError implements OrderState {
  const factory _OnOrderListError(final String message) =
      _$OnOrderListErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$OnOrderListErrorImplCopyWith<_$OnOrderListErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
