// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'region_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Region> regions) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Region> regions)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Region> regions)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegionStateInitial value) initial,
    required TResult Function(RegionStateLoading value) loading,
    required TResult Function(RegionStateLoaded value) loaded,
    required TResult Function(RegionStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegionStateInitial value)? initial,
    TResult? Function(RegionStateLoading value)? loading,
    TResult? Function(RegionStateLoaded value)? loaded,
    TResult? Function(RegionStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegionStateInitial value)? initial,
    TResult Function(RegionStateLoading value)? loading,
    TResult Function(RegionStateLoaded value)? loaded,
    TResult Function(RegionStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegionStateCopyWith<$Res> {
  factory $RegionStateCopyWith(
          RegionState value, $Res Function(RegionState) then) =
      _$RegionStateCopyWithImpl<$Res, RegionState>;
}

/// @nodoc
class _$RegionStateCopyWithImpl<$Res, $Val extends RegionState>
    implements $RegionStateCopyWith<$Res> {
  _$RegionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RegionStateInitialImplCopyWith<$Res> {
  factory _$$RegionStateInitialImplCopyWith(_$RegionStateInitialImpl value,
          $Res Function(_$RegionStateInitialImpl) then) =
      __$$RegionStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RegionStateInitialImplCopyWithImpl<$Res>
    extends _$RegionStateCopyWithImpl<$Res, _$RegionStateInitialImpl>
    implements _$$RegionStateInitialImplCopyWith<$Res> {
  __$$RegionStateInitialImplCopyWithImpl(_$RegionStateInitialImpl _value,
      $Res Function(_$RegionStateInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RegionStateInitialImpl implements RegionStateInitial {
  const _$RegionStateInitialImpl();

  @override
  String toString() {
    return 'RegionState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RegionStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Region> regions) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Region> regions)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Region> regions)? loaded,
    TResult Function(String message)? error,
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
    required TResult Function(RegionStateInitial value) initial,
    required TResult Function(RegionStateLoading value) loading,
    required TResult Function(RegionStateLoaded value) loaded,
    required TResult Function(RegionStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegionStateInitial value)? initial,
    TResult? Function(RegionStateLoading value)? loading,
    TResult? Function(RegionStateLoaded value)? loaded,
    TResult? Function(RegionStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegionStateInitial value)? initial,
    TResult Function(RegionStateLoading value)? loading,
    TResult Function(RegionStateLoaded value)? loaded,
    TResult Function(RegionStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class RegionStateInitial implements RegionState {
  const factory RegionStateInitial() = _$RegionStateInitialImpl;
}

/// @nodoc
abstract class _$$RegionStateLoadingImplCopyWith<$Res> {
  factory _$$RegionStateLoadingImplCopyWith(_$RegionStateLoadingImpl value,
          $Res Function(_$RegionStateLoadingImpl) then) =
      __$$RegionStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RegionStateLoadingImplCopyWithImpl<$Res>
    extends _$RegionStateCopyWithImpl<$Res, _$RegionStateLoadingImpl>
    implements _$$RegionStateLoadingImplCopyWith<$Res> {
  __$$RegionStateLoadingImplCopyWithImpl(_$RegionStateLoadingImpl _value,
      $Res Function(_$RegionStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RegionStateLoadingImpl implements RegionStateLoading {
  const _$RegionStateLoadingImpl();

  @override
  String toString() {
    return 'RegionState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RegionStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Region> regions) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Region> regions)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Region> regions)? loaded,
    TResult Function(String message)? error,
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
    required TResult Function(RegionStateInitial value) initial,
    required TResult Function(RegionStateLoading value) loading,
    required TResult Function(RegionStateLoaded value) loaded,
    required TResult Function(RegionStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegionStateInitial value)? initial,
    TResult? Function(RegionStateLoading value)? loading,
    TResult? Function(RegionStateLoaded value)? loaded,
    TResult? Function(RegionStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegionStateInitial value)? initial,
    TResult Function(RegionStateLoading value)? loading,
    TResult Function(RegionStateLoaded value)? loaded,
    TResult Function(RegionStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class RegionStateLoading implements RegionState {
  const factory RegionStateLoading() = _$RegionStateLoadingImpl;
}

/// @nodoc
abstract class _$$RegionStateLoadedImplCopyWith<$Res> {
  factory _$$RegionStateLoadedImplCopyWith(_$RegionStateLoadedImpl value,
          $Res Function(_$RegionStateLoadedImpl) then) =
      __$$RegionStateLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Region> regions});
}

/// @nodoc
class __$$RegionStateLoadedImplCopyWithImpl<$Res>
    extends _$RegionStateCopyWithImpl<$Res, _$RegionStateLoadedImpl>
    implements _$$RegionStateLoadedImplCopyWith<$Res> {
  __$$RegionStateLoadedImplCopyWithImpl(_$RegionStateLoadedImpl _value,
      $Res Function(_$RegionStateLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? regions = null,
  }) {
    return _then(_$RegionStateLoadedImpl(
      null == regions
          ? _value._regions
          : regions // ignore: cast_nullable_to_non_nullable
              as List<Region>,
    ));
  }
}

/// @nodoc

class _$RegionStateLoadedImpl implements RegionStateLoaded {
  const _$RegionStateLoadedImpl(final List<Region> regions)
      : _regions = regions;

  final List<Region> _regions;
  @override
  List<Region> get regions {
    if (_regions is EqualUnmodifiableListView) return _regions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_regions);
  }

  @override
  String toString() {
    return 'RegionState.loaded(regions: $regions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegionStateLoadedImpl &&
            const DeepCollectionEquality().equals(other._regions, _regions));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_regions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegionStateLoadedImplCopyWith<_$RegionStateLoadedImpl> get copyWith =>
      __$$RegionStateLoadedImplCopyWithImpl<_$RegionStateLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Region> regions) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(regions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Region> regions)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(regions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Region> regions)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(regions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegionStateInitial value) initial,
    required TResult Function(RegionStateLoading value) loading,
    required TResult Function(RegionStateLoaded value) loaded,
    required TResult Function(RegionStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegionStateInitial value)? initial,
    TResult? Function(RegionStateLoading value)? loading,
    TResult? Function(RegionStateLoaded value)? loaded,
    TResult? Function(RegionStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegionStateInitial value)? initial,
    TResult Function(RegionStateLoading value)? loading,
    TResult Function(RegionStateLoaded value)? loaded,
    TResult Function(RegionStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class RegionStateLoaded implements RegionState {
  const factory RegionStateLoaded(final List<Region> regions) =
      _$RegionStateLoadedImpl;

  List<Region> get regions;
  @JsonKey(ignore: true)
  _$$RegionStateLoadedImplCopyWith<_$RegionStateLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegionStateErrorImplCopyWith<$Res> {
  factory _$$RegionStateErrorImplCopyWith(_$RegionStateErrorImpl value,
          $Res Function(_$RegionStateErrorImpl) then) =
      __$$RegionStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$RegionStateErrorImplCopyWithImpl<$Res>
    extends _$RegionStateCopyWithImpl<$Res, _$RegionStateErrorImpl>
    implements _$$RegionStateErrorImplCopyWith<$Res> {
  __$$RegionStateErrorImplCopyWithImpl(_$RegionStateErrorImpl _value,
      $Res Function(_$RegionStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$RegionStateErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RegionStateErrorImpl implements RegionStateError {
  const _$RegionStateErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'RegionState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegionStateErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegionStateErrorImplCopyWith<_$RegionStateErrorImpl> get copyWith =>
      __$$RegionStateErrorImplCopyWithImpl<_$RegionStateErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Region> regions) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Region> regions)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Region> regions)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegionStateInitial value) initial,
    required TResult Function(RegionStateLoading value) loading,
    required TResult Function(RegionStateLoaded value) loaded,
    required TResult Function(RegionStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegionStateInitial value)? initial,
    TResult? Function(RegionStateLoading value)? loading,
    TResult? Function(RegionStateLoaded value)? loaded,
    TResult? Function(RegionStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegionStateInitial value)? initial,
    TResult Function(RegionStateLoading value)? loading,
    TResult Function(RegionStateLoaded value)? loaded,
    TResult Function(RegionStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class RegionStateError implements RegionState {
  const factory RegionStateError(final String message) = _$RegionStateErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$RegionStateErrorImplCopyWith<_$RegionStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
