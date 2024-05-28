// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return _LoginResponse.fromJson(json);
}

/// @nodoc
mixin _$LoginResponse {
  String? get accessToken => throw _privateConstructorUsedError;
  Provider? get provider => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginResponseCopyWith<LoginResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginResponseCopyWith<$Res> {
  factory $LoginResponseCopyWith(
          LoginResponse value, $Res Function(LoginResponse) then) =
      _$LoginResponseCopyWithImpl<$Res, LoginResponse>;
  @useResult
  $Res call({String? accessToken, Provider? provider});

  $ProviderCopyWith<$Res>? get provider;
}

/// @nodoc
class _$LoginResponseCopyWithImpl<$Res, $Val extends LoginResponse>
    implements $LoginResponseCopyWith<$Res> {
  _$LoginResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = freezed,
    Object? provider = freezed,
  }) {
    return _then(_value.copyWith(
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as Provider?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProviderCopyWith<$Res>? get provider {
    if (_value.provider == null) {
      return null;
    }

    return $ProviderCopyWith<$Res>(_value.provider!, (value) {
      return _then(_value.copyWith(provider: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoginResponseImplCopyWith<$Res>
    implements $LoginResponseCopyWith<$Res> {
  factory _$$LoginResponseImplCopyWith(
          _$LoginResponseImpl value, $Res Function(_$LoginResponseImpl) then) =
      __$$LoginResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? accessToken, Provider? provider});

  @override
  $ProviderCopyWith<$Res>? get provider;
}

/// @nodoc
class __$$LoginResponseImplCopyWithImpl<$Res>
    extends _$LoginResponseCopyWithImpl<$Res, _$LoginResponseImpl>
    implements _$$LoginResponseImplCopyWith<$Res> {
  __$$LoginResponseImplCopyWithImpl(
      _$LoginResponseImpl _value, $Res Function(_$LoginResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = freezed,
    Object? provider = freezed,
  }) {
    return _then(_$LoginResponseImpl(
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as Provider?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginResponseImpl implements _LoginResponse {
  const _$LoginResponseImpl({this.accessToken, this.provider});

  factory _$LoginResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginResponseImplFromJson(json);

  @override
  final String? accessToken;
  @override
  final Provider? provider;

  @override
  String toString() {
    return 'LoginResponse(accessToken: $accessToken, provider: $provider)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginResponseImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.provider, provider) ||
                other.provider == provider));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, provider);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginResponseImplCopyWith<_$LoginResponseImpl> get copyWith =>
      __$$LoginResponseImplCopyWithImpl<_$LoginResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginResponseImplToJson(
      this,
    );
  }
}

abstract class _LoginResponse implements LoginResponse {
  const factory _LoginResponse(
      {final String? accessToken,
      final Provider? provider}) = _$LoginResponseImpl;

  factory _LoginResponse.fromJson(Map<String, dynamic> json) =
      _$LoginResponseImpl.fromJson;

  @override
  String? get accessToken;
  @override
  Provider? get provider;
  @override
  @JsonKey(ignore: true)
  _$$LoginResponseImplCopyWith<_$LoginResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Provider _$ProviderFromJson(Map<String, dynamic> json) {
  return _Provider.fromJson(json);
}

/// @nodoc
mixin _$Provider {
  String? get providerId => throw _privateConstructorUsedError;
  String? get companyName => throw _privateConstructorUsedError;
  ContactPersonDetail get contactPerson => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get place => throw _privateConstructorUsedError;
  int? get updatedAt => throw _privateConstructorUsedError;
  int? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(fromJson: providerStatusFromJson, toJson: providerStatusToJson)
  ProviderStatus get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProviderCopyWith<Provider> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProviderCopyWith<$Res> {
  factory $ProviderCopyWith(Provider value, $Res Function(Provider) then) =
      _$ProviderCopyWithImpl<$Res, Provider>;
  @useResult
  $Res call(
      {String? providerId,
      String? companyName,
      ContactPersonDetail contactPerson,
      String? email,
      String? phone,
      String? place,
      int? updatedAt,
      int? createdAt,
      @JsonKey(fromJson: providerStatusFromJson, toJson: providerStatusToJson)
      ProviderStatus status});

  $ContactPersonDetailCopyWith<$Res> get contactPerson;
}

/// @nodoc
class _$ProviderCopyWithImpl<$Res, $Val extends Provider>
    implements $ProviderCopyWith<$Res> {
  _$ProviderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? providerId = freezed,
    Object? companyName = freezed,
    Object? contactPerson = null,
    Object? email = freezed,
    Object? phone = freezed,
    Object? place = freezed,
    Object? updatedAt = freezed,
    Object? createdAt = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      providerId: freezed == providerId
          ? _value.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String?,
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      contactPerson: null == contactPerson
          ? _value.contactPerson
          : contactPerson // ignore: cast_nullable_to_non_nullable
              as ContactPersonDetail,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      place: freezed == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProviderStatus,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ContactPersonDetailCopyWith<$Res> get contactPerson {
    return $ContactPersonDetailCopyWith<$Res>(_value.contactPerson, (value) {
      return _then(_value.copyWith(contactPerson: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProviderImplCopyWith<$Res>
    implements $ProviderCopyWith<$Res> {
  factory _$$ProviderImplCopyWith(
          _$ProviderImpl value, $Res Function(_$ProviderImpl) then) =
      __$$ProviderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? providerId,
      String? companyName,
      ContactPersonDetail contactPerson,
      String? email,
      String? phone,
      String? place,
      int? updatedAt,
      int? createdAt,
      @JsonKey(fromJson: providerStatusFromJson, toJson: providerStatusToJson)
      ProviderStatus status});

  @override
  $ContactPersonDetailCopyWith<$Res> get contactPerson;
}

/// @nodoc
class __$$ProviderImplCopyWithImpl<$Res>
    extends _$ProviderCopyWithImpl<$Res, _$ProviderImpl>
    implements _$$ProviderImplCopyWith<$Res> {
  __$$ProviderImplCopyWithImpl(
      _$ProviderImpl _value, $Res Function(_$ProviderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? providerId = freezed,
    Object? companyName = freezed,
    Object? contactPerson = null,
    Object? email = freezed,
    Object? phone = freezed,
    Object? place = freezed,
    Object? updatedAt = freezed,
    Object? createdAt = freezed,
    Object? status = null,
  }) {
    return _then(_$ProviderImpl(
      providerId: freezed == providerId
          ? _value.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String?,
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      contactPerson: null == contactPerson
          ? _value.contactPerson
          : contactPerson // ignore: cast_nullable_to_non_nullable
              as ContactPersonDetail,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      place: freezed == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProviderStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProviderImpl implements _Provider {
  const _$ProviderImpl(
      {this.providerId,
      this.companyName,
      this.contactPerson = const ContactPersonDetail(),
      this.email,
      this.phone,
      this.place,
      this.updatedAt,
      this.createdAt,
      @JsonKey(fromJson: providerStatusFromJson, toJson: providerStatusToJson)
      this.status = ProviderStatus.REQUESTED});

  factory _$ProviderImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProviderImplFromJson(json);

  @override
  final String? providerId;
  @override
  final String? companyName;
  @override
  @JsonKey()
  final ContactPersonDetail contactPerson;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  final String? place;
  @override
  final int? updatedAt;
  @override
  final int? createdAt;
  @override
  @JsonKey(fromJson: providerStatusFromJson, toJson: providerStatusToJson)
  final ProviderStatus status;

  @override
  String toString() {
    return 'Provider(providerId: $providerId, companyName: $companyName, contactPerson: $contactPerson, email: $email, phone: $phone, place: $place, updatedAt: $updatedAt, createdAt: $createdAt, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProviderImpl &&
            (identical(other.providerId, providerId) ||
                other.providerId == providerId) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.contactPerson, contactPerson) ||
                other.contactPerson == contactPerson) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.place, place) || other.place == place) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, providerId, companyName,
      contactPerson, email, phone, place, updatedAt, createdAt, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProviderImplCopyWith<_$ProviderImpl> get copyWith =>
      __$$ProviderImplCopyWithImpl<_$ProviderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProviderImplToJson(
      this,
    );
  }
}

abstract class _Provider implements Provider {
  const factory _Provider(
      {final String? providerId,
      final String? companyName,
      final ContactPersonDetail contactPerson,
      final String? email,
      final String? phone,
      final String? place,
      final int? updatedAt,
      final int? createdAt,
      @JsonKey(fromJson: providerStatusFromJson, toJson: providerStatusToJson)
      final ProviderStatus status}) = _$ProviderImpl;

  factory _Provider.fromJson(Map<String, dynamic> json) =
      _$ProviderImpl.fromJson;

  @override
  String? get providerId;
  @override
  String? get companyName;
  @override
  ContactPersonDetail get contactPerson;
  @override
  String? get email;
  @override
  String? get phone;
  @override
  String? get place;
  @override
  int? get updatedAt;
  @override
  int? get createdAt;
  @override
  @JsonKey(fromJson: providerStatusFromJson, toJson: providerStatusToJson)
  ProviderStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$ProviderImplCopyWith<_$ProviderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ContactPersonDetail _$ContactPersonDetailFromJson(Map<String, dynamic> json) {
  return _ContactPersonDetail.fromJson(json);
}

/// @nodoc
mixin _$ContactPersonDetail {
  String get name => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContactPersonDetailCopyWith<ContactPersonDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactPersonDetailCopyWith<$Res> {
  factory $ContactPersonDetailCopyWith(
          ContactPersonDetail value, $Res Function(ContactPersonDetail) then) =
      _$ContactPersonDetailCopyWithImpl<$Res, ContactPersonDetail>;
  @useResult
  $Res call({String name, String phoneNumber});
}

/// @nodoc
class _$ContactPersonDetailCopyWithImpl<$Res, $Val extends ContactPersonDetail>
    implements $ContactPersonDetailCopyWith<$Res> {
  _$ContactPersonDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phoneNumber = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContactPersonDetailImplCopyWith<$Res>
    implements $ContactPersonDetailCopyWith<$Res> {
  factory _$$ContactPersonDetailImplCopyWith(_$ContactPersonDetailImpl value,
          $Res Function(_$ContactPersonDetailImpl) then) =
      __$$ContactPersonDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String phoneNumber});
}

/// @nodoc
class __$$ContactPersonDetailImplCopyWithImpl<$Res>
    extends _$ContactPersonDetailCopyWithImpl<$Res, _$ContactPersonDetailImpl>
    implements _$$ContactPersonDetailImplCopyWith<$Res> {
  __$$ContactPersonDetailImplCopyWithImpl(_$ContactPersonDetailImpl _value,
      $Res Function(_$ContactPersonDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phoneNumber = null,
  }) {
    return _then(_$ContactPersonDetailImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContactPersonDetailImpl implements _ContactPersonDetail {
  const _$ContactPersonDetailImpl({this.name = '', this.phoneNumber = ''});

  factory _$ContactPersonDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactPersonDetailImplFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String phoneNumber;

  @override
  String toString() {
    return 'ContactPersonDetail(name: $name, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactPersonDetailImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactPersonDetailImplCopyWith<_$ContactPersonDetailImpl> get copyWith =>
      __$$ContactPersonDetailImplCopyWithImpl<_$ContactPersonDetailImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContactPersonDetailImplToJson(
      this,
    );
  }
}

abstract class _ContactPersonDetail implements ContactPersonDetail {
  const factory _ContactPersonDetail(
      {final String name,
      final String phoneNumber}) = _$ContactPersonDetailImpl;

  factory _ContactPersonDetail.fromJson(Map<String, dynamic> json) =
      _$ContactPersonDetailImpl.fromJson;

  @override
  String get name;
  @override
  String get phoneNumber;
  @override
  @JsonKey(ignore: true)
  _$$ContactPersonDetailImplCopyWith<_$ContactPersonDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
