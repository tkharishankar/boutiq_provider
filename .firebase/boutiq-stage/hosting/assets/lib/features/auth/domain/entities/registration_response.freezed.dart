// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registration_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) {
  return _RegisterResponse.fromJson(json);
}

/// @nodoc
mixin _$RegisterResponse {
  dynamic get message => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegisterResponseCopyWith<RegisterResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterResponseCopyWith<$Res> {
  factory $RegisterResponseCopyWith(
          RegisterResponse value, $Res Function(RegisterResponse) then) =
      _$RegisterResponseCopyWithImpl<$Res, RegisterResponse>;
  @useResult
  $Res call({dynamic message, int status});
}

/// @nodoc
class _$RegisterResponseCopyWithImpl<$Res, $Val extends RegisterResponse>
    implements $RegisterResponseCopyWith<$Res> {
  _$RegisterResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as dynamic,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RegisterResponseCopyWith<$Res>
    implements $RegisterResponseCopyWith<$Res> {
  factory _$$_RegisterResponseCopyWith(
          _$_RegisterResponse value, $Res Function(_$_RegisterResponse) then) =
      __$$_RegisterResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic message, int status});
}

/// @nodoc
class __$$_RegisterResponseCopyWithImpl<$Res>
    extends _$RegisterResponseCopyWithImpl<$Res, _$_RegisterResponse>
    implements _$$_RegisterResponseCopyWith<$Res> {
  __$$_RegisterResponseCopyWithImpl(
      _$_RegisterResponse _value, $Res Function(_$_RegisterResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? status = null,
  }) {
    return _then(_$_RegisterResponse(
      message: freezed == message ? _value.message! : message,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RegisterResponse implements _RegisterResponse {
  const _$_RegisterResponse({this.message = '', required this.status});

  factory _$_RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$$_RegisterResponseFromJson(json);

  @override
  @JsonKey()
  final dynamic message;
  @override
  final int status;

  @override
  String toString() {
    return 'RegisterResponse(message: $message, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisterResponse &&
            const DeepCollectionEquality().equals(other.message, message) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(message), status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegisterResponseCopyWith<_$_RegisterResponse> get copyWith =>
      __$$_RegisterResponseCopyWithImpl<_$_RegisterResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RegisterResponseToJson(
      this,
    );
  }
}

abstract class _RegisterResponse implements RegisterResponse {
  const factory _RegisterResponse(
      {final dynamic message, required final int status}) = _$_RegisterResponse;

  factory _RegisterResponse.fromJson(Map<String, dynamic> json) =
      _$_RegisterResponse.fromJson;

  @override
  dynamic get message;
  @override
  int get status;
  @override
  @JsonKey(ignore: true)
  _$$_RegisterResponseCopyWith<_$_RegisterResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
