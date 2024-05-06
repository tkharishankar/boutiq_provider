// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registration_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegistrationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) registrationError,
    required TResult Function() loading,
    required TResult Function(String message) registrationSuccessful,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? registrationError,
    TResult? Function()? loading,
    TResult? Function(String message)? registrationSuccessful,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? registrationError,
    TResult Function()? loading,
    TResult Function(String message)? registrationSuccessful,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_RegistrationError value) registrationError,
    required TResult Function(_Loading value) loading,
    required TResult Function(_RegistrationSuccessful value)
        registrationSuccessful,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_RegistrationError value)? registrationError,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_RegistrationSuccessful value)? registrationSuccessful,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_RegistrationError value)? registrationError,
    TResult Function(_Loading value)? loading,
    TResult Function(_RegistrationSuccessful value)? registrationSuccessful,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrationStateCopyWith<$Res> {
  factory $RegistrationStateCopyWith(
          RegistrationState value, $Res Function(RegistrationState) then) =
      _$RegistrationStateCopyWithImpl<$Res, RegistrationState>;
}

/// @nodoc
class _$RegistrationStateCopyWithImpl<$Res, $Val extends RegistrationState>
    implements $RegistrationStateCopyWith<$Res> {
  _$RegistrationStateCopyWithImpl(this._value, this._then);

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
    extends _$RegistrationStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'RegistrationState.initial()';
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
    required TResult Function(String message) registrationError,
    required TResult Function() loading,
    required TResult Function(String message) registrationSuccessful,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? registrationError,
    TResult? Function()? loading,
    TResult? Function(String message)? registrationSuccessful,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? registrationError,
    TResult Function()? loading,
    TResult Function(String message)? registrationSuccessful,
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
    required TResult Function(_RegistrationError value) registrationError,
    required TResult Function(_Loading value) loading,
    required TResult Function(_RegistrationSuccessful value)
        registrationSuccessful,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_RegistrationError value)? registrationError,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_RegistrationSuccessful value)? registrationSuccessful,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_RegistrationError value)? registrationError,
    TResult Function(_Loading value)? loading,
    TResult Function(_RegistrationSuccessful value)? registrationSuccessful,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements RegistrationState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$RegistrationErrorImplCopyWith<$Res> {
  factory _$$RegistrationErrorImplCopyWith(_$RegistrationErrorImpl value,
          $Res Function(_$RegistrationErrorImpl) then) =
      __$$RegistrationErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$RegistrationErrorImplCopyWithImpl<$Res>
    extends _$RegistrationStateCopyWithImpl<$Res, _$RegistrationErrorImpl>
    implements _$$RegistrationErrorImplCopyWith<$Res> {
  __$$RegistrationErrorImplCopyWithImpl(_$RegistrationErrorImpl _value,
      $Res Function(_$RegistrationErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$RegistrationErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RegistrationErrorImpl implements _RegistrationError {
  const _$RegistrationErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'RegistrationState.registrationError(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegistrationErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegistrationErrorImplCopyWith<_$RegistrationErrorImpl> get copyWith =>
      __$$RegistrationErrorImplCopyWithImpl<_$RegistrationErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) registrationError,
    required TResult Function() loading,
    required TResult Function(String message) registrationSuccessful,
  }) {
    return registrationError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? registrationError,
    TResult? Function()? loading,
    TResult? Function(String message)? registrationSuccessful,
  }) {
    return registrationError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? registrationError,
    TResult Function()? loading,
    TResult Function(String message)? registrationSuccessful,
    required TResult orElse(),
  }) {
    if (registrationError != null) {
      return registrationError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_RegistrationError value) registrationError,
    required TResult Function(_Loading value) loading,
    required TResult Function(_RegistrationSuccessful value)
        registrationSuccessful,
  }) {
    return registrationError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_RegistrationError value)? registrationError,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_RegistrationSuccessful value)? registrationSuccessful,
  }) {
    return registrationError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_RegistrationError value)? registrationError,
    TResult Function(_Loading value)? loading,
    TResult Function(_RegistrationSuccessful value)? registrationSuccessful,
    required TResult orElse(),
  }) {
    if (registrationError != null) {
      return registrationError(this);
    }
    return orElse();
  }
}

abstract class _RegistrationError implements RegistrationState {
  const factory _RegistrationError(final String message) =
      _$RegistrationErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$RegistrationErrorImplCopyWith<_$RegistrationErrorImpl> get copyWith =>
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
    extends _$RegistrationStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'RegistrationState.loading()';
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
    required TResult Function(String message) registrationError,
    required TResult Function() loading,
    required TResult Function(String message) registrationSuccessful,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? registrationError,
    TResult? Function()? loading,
    TResult? Function(String message)? registrationSuccessful,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? registrationError,
    TResult Function()? loading,
    TResult Function(String message)? registrationSuccessful,
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
    required TResult Function(_RegistrationError value) registrationError,
    required TResult Function(_Loading value) loading,
    required TResult Function(_RegistrationSuccessful value)
        registrationSuccessful,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_RegistrationError value)? registrationError,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_RegistrationSuccessful value)? registrationSuccessful,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_RegistrationError value)? registrationError,
    TResult Function(_Loading value)? loading,
    TResult Function(_RegistrationSuccessful value)? registrationSuccessful,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements RegistrationState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$RegistrationSuccessfulImplCopyWith<$Res> {
  factory _$$RegistrationSuccessfulImplCopyWith(
          _$RegistrationSuccessfulImpl value,
          $Res Function(_$RegistrationSuccessfulImpl) then) =
      __$$RegistrationSuccessfulImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$RegistrationSuccessfulImplCopyWithImpl<$Res>
    extends _$RegistrationStateCopyWithImpl<$Res, _$RegistrationSuccessfulImpl>
    implements _$$RegistrationSuccessfulImplCopyWith<$Res> {
  __$$RegistrationSuccessfulImplCopyWithImpl(
      _$RegistrationSuccessfulImpl _value,
      $Res Function(_$RegistrationSuccessfulImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$RegistrationSuccessfulImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RegistrationSuccessfulImpl implements _RegistrationSuccessful {
  const _$RegistrationSuccessfulImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'RegistrationState.registrationSuccessful(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegistrationSuccessfulImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegistrationSuccessfulImplCopyWith<_$RegistrationSuccessfulImpl>
      get copyWith => __$$RegistrationSuccessfulImplCopyWithImpl<
          _$RegistrationSuccessfulImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) registrationError,
    required TResult Function() loading,
    required TResult Function(String message) registrationSuccessful,
  }) {
    return registrationSuccessful(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? registrationError,
    TResult? Function()? loading,
    TResult? Function(String message)? registrationSuccessful,
  }) {
    return registrationSuccessful?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? registrationError,
    TResult Function()? loading,
    TResult Function(String message)? registrationSuccessful,
    required TResult orElse(),
  }) {
    if (registrationSuccessful != null) {
      return registrationSuccessful(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_RegistrationError value) registrationError,
    required TResult Function(_Loading value) loading,
    required TResult Function(_RegistrationSuccessful value)
        registrationSuccessful,
  }) {
    return registrationSuccessful(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_RegistrationError value)? registrationError,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_RegistrationSuccessful value)? registrationSuccessful,
  }) {
    return registrationSuccessful?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_RegistrationError value)? registrationError,
    TResult Function(_Loading value)? loading,
    TResult Function(_RegistrationSuccessful value)? registrationSuccessful,
    required TResult orElse(),
  }) {
    if (registrationSuccessful != null) {
      return registrationSuccessful(this);
    }
    return orElse();
  }
}

abstract class _RegistrationSuccessful implements RegistrationState {
  const factory _RegistrationSuccessful(final String message) =
      _$RegistrationSuccessfulImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$RegistrationSuccessfulImplCopyWith<_$RegistrationSuccessfulImpl>
      get copyWith => throw _privateConstructorUsedError;
}
