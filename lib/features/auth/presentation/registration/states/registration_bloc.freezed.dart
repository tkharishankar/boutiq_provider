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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$RegistrationStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'RegistrationState.initial()';
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
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_RegistrationErrorCopyWith<$Res> {
  factory _$$_RegistrationErrorCopyWith(_$_RegistrationError value,
          $Res Function(_$_RegistrationError) then) =
      __$$_RegistrationErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_RegistrationErrorCopyWithImpl<$Res>
    extends _$RegistrationStateCopyWithImpl<$Res, _$_RegistrationError>
    implements _$$_RegistrationErrorCopyWith<$Res> {
  __$$_RegistrationErrorCopyWithImpl(
      _$_RegistrationError _value, $Res Function(_$_RegistrationError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_RegistrationError(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RegistrationError implements _RegistrationError {
  const _$_RegistrationError(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'RegistrationState.registrationError(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegistrationError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegistrationErrorCopyWith<_$_RegistrationError> get copyWith =>
      __$$_RegistrationErrorCopyWithImpl<_$_RegistrationError>(
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
  const factory _RegistrationError(final String message) = _$_RegistrationError;

  String get message;
  @JsonKey(ignore: true)
  _$$_RegistrationErrorCopyWith<_$_RegistrationError> get copyWith =>
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
    extends _$RegistrationStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'RegistrationState.loading()';
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
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$$_RegistrationSuccessfulCopyWith<$Res> {
  factory _$$_RegistrationSuccessfulCopyWith(_$_RegistrationSuccessful value,
          $Res Function(_$_RegistrationSuccessful) then) =
      __$$_RegistrationSuccessfulCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_RegistrationSuccessfulCopyWithImpl<$Res>
    extends _$RegistrationStateCopyWithImpl<$Res, _$_RegistrationSuccessful>
    implements _$$_RegistrationSuccessfulCopyWith<$Res> {
  __$$_RegistrationSuccessfulCopyWithImpl(_$_RegistrationSuccessful _value,
      $Res Function(_$_RegistrationSuccessful) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_RegistrationSuccessful(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RegistrationSuccessful implements _RegistrationSuccessful {
  const _$_RegistrationSuccessful(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'RegistrationState.registrationSuccessful(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegistrationSuccessful &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegistrationSuccessfulCopyWith<_$_RegistrationSuccessful> get copyWith =>
      __$$_RegistrationSuccessfulCopyWithImpl<_$_RegistrationSuccessful>(
          this, _$identity);

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
      _$_RegistrationSuccessful;

  String get message;
  @JsonKey(ignore: true)
  _$$_RegistrationSuccessfulCopyWith<_$_RegistrationSuccessful> get copyWith =>
      throw _privateConstructorUsedError;
}
