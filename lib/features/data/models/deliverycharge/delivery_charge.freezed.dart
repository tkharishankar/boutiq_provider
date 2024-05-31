// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_charge.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Country _$CountryFromJson(Map<String, dynamic> json) {
  return _Country.fromJson(json);
}

/// @nodoc
mixin _$Country {
  String get name => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountryCopyWith<Country> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryCopyWith<$Res> {
  factory $CountryCopyWith(Country value, $Res Function(Country) then) =
      _$CountryCopyWithImpl<$Res, Country>;
  @useResult
  $Res call({String name, String code});
}

/// @nodoc
class _$CountryCopyWithImpl<$Res, $Val extends Country>
    implements $CountryCopyWith<$Res> {
  _$CountryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CountryImplCopyWith<$Res> implements $CountryCopyWith<$Res> {
  factory _$$CountryImplCopyWith(
          _$CountryImpl value, $Res Function(_$CountryImpl) then) =
      __$$CountryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String code});
}

/// @nodoc
class __$$CountryImplCopyWithImpl<$Res>
    extends _$CountryCopyWithImpl<$Res, _$CountryImpl>
    implements _$$CountryImplCopyWith<$Res> {
  __$$CountryImplCopyWithImpl(
      _$CountryImpl _value, $Res Function(_$CountryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
  }) {
    return _then(_$CountryImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CountryImpl implements _Country {
  const _$CountryImpl({required this.name, required this.code});

  factory _$CountryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CountryImplFromJson(json);

  @override
  final String name;
  @override
  final String code;

  @override
  String toString() {
    return 'Country(name: $name, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountryImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CountryImplCopyWith<_$CountryImpl> get copyWith =>
      __$$CountryImplCopyWithImpl<_$CountryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CountryImplToJson(
      this,
    );
  }
}

abstract class _Country implements Country {
  const factory _Country(
      {required final String name, required final String code}) = _$CountryImpl;

  factory _Country.fromJson(Map<String, dynamic> json) = _$CountryImpl.fromJson;

  @override
  String get name;
  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$CountryImplCopyWith<_$CountryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Region _$RegionFromJson(Map<String, dynamic> json) {
  return _Region.fromJson(json);
}

/// @nodoc
mixin _$Region {
  String get name => throw _privateConstructorUsedError;
  List<Country> get countries => throw _privateConstructorUsedError;
  int get baseCharge => throw _privateConstructorUsedError;
  int get additionalCharge => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegionCopyWith<Region> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegionCopyWith<$Res> {
  factory $RegionCopyWith(Region value, $Res Function(Region) then) =
      _$RegionCopyWithImpl<$Res, Region>;
  @useResult
  $Res call(
      {String name,
      List<Country> countries,
      int baseCharge,
      int additionalCharge});
}

/// @nodoc
class _$RegionCopyWithImpl<$Res, $Val extends Region>
    implements $RegionCopyWith<$Res> {
  _$RegionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? countries = null,
    Object? baseCharge = null,
    Object? additionalCharge = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      countries: null == countries
          ? _value.countries
          : countries // ignore: cast_nullable_to_non_nullable
              as List<Country>,
      baseCharge: null == baseCharge
          ? _value.baseCharge
          : baseCharge // ignore: cast_nullable_to_non_nullable
              as int,
      additionalCharge: null == additionalCharge
          ? _value.additionalCharge
          : additionalCharge // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegionImplCopyWith<$Res> implements $RegionCopyWith<$Res> {
  factory _$$RegionImplCopyWith(
          _$RegionImpl value, $Res Function(_$RegionImpl) then) =
      __$$RegionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      List<Country> countries,
      int baseCharge,
      int additionalCharge});
}

/// @nodoc
class __$$RegionImplCopyWithImpl<$Res>
    extends _$RegionCopyWithImpl<$Res, _$RegionImpl>
    implements _$$RegionImplCopyWith<$Res> {
  __$$RegionImplCopyWithImpl(
      _$RegionImpl _value, $Res Function(_$RegionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? countries = null,
    Object? baseCharge = null,
    Object? additionalCharge = null,
  }) {
    return _then(_$RegionImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      countries: null == countries
          ? _value._countries
          : countries // ignore: cast_nullable_to_non_nullable
              as List<Country>,
      baseCharge: null == baseCharge
          ? _value.baseCharge
          : baseCharge // ignore: cast_nullable_to_non_nullable
              as int,
      additionalCharge: null == additionalCharge
          ? _value.additionalCharge
          : additionalCharge // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegionImpl implements _Region {
  const _$RegionImpl(
      {required this.name,
      required final List<Country> countries,
      this.baseCharge = 0,
      this.additionalCharge = 0})
      : _countries = countries;

  factory _$RegionImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegionImplFromJson(json);

  @override
  final String name;
  final List<Country> _countries;
  @override
  List<Country> get countries {
    if (_countries is EqualUnmodifiableListView) return _countries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_countries);
  }

  @override
  @JsonKey()
  final int baseCharge;
  @override
  @JsonKey()
  final int additionalCharge;

  @override
  String toString() {
    return 'Region(name: $name, countries: $countries, baseCharge: $baseCharge, additionalCharge: $additionalCharge)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegionImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._countries, _countries) &&
            (identical(other.baseCharge, baseCharge) ||
                other.baseCharge == baseCharge) &&
            (identical(other.additionalCharge, additionalCharge) ||
                other.additionalCharge == additionalCharge));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      const DeepCollectionEquality().hash(_countries),
      baseCharge,
      additionalCharge);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegionImplCopyWith<_$RegionImpl> get copyWith =>
      __$$RegionImplCopyWithImpl<_$RegionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegionImplToJson(
      this,
    );
  }
}

abstract class _Region implements Region {
  const factory _Region(
      {required final String name,
      required final List<Country> countries,
      final int baseCharge,
      final int additionalCharge}) = _$RegionImpl;

  factory _Region.fromJson(Map<String, dynamic> json) = _$RegionImpl.fromJson;

  @override
  String get name;
  @override
  List<Country> get countries;
  @override
  int get baseCharge;
  @override
  int get additionalCharge;
  @override
  @JsonKey(ignore: true)
  _$$RegionImplCopyWith<_$RegionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeliveryChargeReq _$DeliveryChargeReqFromJson(Map<String, dynamic> json) {
  return _DeliveryChargeReq.fromJson(json);
}

/// @nodoc
mixin _$DeliveryChargeReq {
  String get regionId => throw _privateConstructorUsedError;
  int get base => throw _privateConstructorUsedError;
  int get additional => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeliveryChargeReqCopyWith<DeliveryChargeReq> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryChargeReqCopyWith<$Res> {
  factory $DeliveryChargeReqCopyWith(
          DeliveryChargeReq value, $Res Function(DeliveryChargeReq) then) =
      _$DeliveryChargeReqCopyWithImpl<$Res, DeliveryChargeReq>;
  @useResult
  $Res call({String regionId, int base, int additional});
}

/// @nodoc
class _$DeliveryChargeReqCopyWithImpl<$Res, $Val extends DeliveryChargeReq>
    implements $DeliveryChargeReqCopyWith<$Res> {
  _$DeliveryChargeReqCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? regionId = null,
    Object? base = null,
    Object? additional = null,
  }) {
    return _then(_value.copyWith(
      regionId: null == regionId
          ? _value.regionId
          : regionId // ignore: cast_nullable_to_non_nullable
              as String,
      base: null == base
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as int,
      additional: null == additional
          ? _value.additional
          : additional // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeliveryChargeReqImplCopyWith<$Res>
    implements $DeliveryChargeReqCopyWith<$Res> {
  factory _$$DeliveryChargeReqImplCopyWith(_$DeliveryChargeReqImpl value,
          $Res Function(_$DeliveryChargeReqImpl) then) =
      __$$DeliveryChargeReqImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String regionId, int base, int additional});
}

/// @nodoc
class __$$DeliveryChargeReqImplCopyWithImpl<$Res>
    extends _$DeliveryChargeReqCopyWithImpl<$Res, _$DeliveryChargeReqImpl>
    implements _$$DeliveryChargeReqImplCopyWith<$Res> {
  __$$DeliveryChargeReqImplCopyWithImpl(_$DeliveryChargeReqImpl _value,
      $Res Function(_$DeliveryChargeReqImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? regionId = null,
    Object? base = null,
    Object? additional = null,
  }) {
    return _then(_$DeliveryChargeReqImpl(
      regionId: null == regionId
          ? _value.regionId
          : regionId // ignore: cast_nullable_to_non_nullable
              as String,
      base: null == base
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as int,
      additional: null == additional
          ? _value.additional
          : additional // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeliveryChargeReqImpl implements _DeliveryChargeReq {
  const _$DeliveryChargeReqImpl(
      {required this.regionId, this.base = 0, this.additional = 0});

  factory _$DeliveryChargeReqImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeliveryChargeReqImplFromJson(json);

  @override
  final String regionId;
  @override
  @JsonKey()
  final int base;
  @override
  @JsonKey()
  final int additional;

  @override
  String toString() {
    return 'DeliveryChargeReq(regionId: $regionId, base: $base, additional: $additional)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryChargeReqImpl &&
            (identical(other.regionId, regionId) ||
                other.regionId == regionId) &&
            (identical(other.base, base) || other.base == base) &&
            (identical(other.additional, additional) ||
                other.additional == additional));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, regionId, base, additional);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryChargeReqImplCopyWith<_$DeliveryChargeReqImpl> get copyWith =>
      __$$DeliveryChargeReqImplCopyWithImpl<_$DeliveryChargeReqImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeliveryChargeReqImplToJson(
      this,
    );
  }
}

abstract class _DeliveryChargeReq implements DeliveryChargeReq {
  const factory _DeliveryChargeReq(
      {required final String regionId,
      final int base,
      final int additional}) = _$DeliveryChargeReqImpl;

  factory _DeliveryChargeReq.fromJson(Map<String, dynamic> json) =
      _$DeliveryChargeReqImpl.fromJson;

  @override
  String get regionId;
  @override
  int get base;
  @override
  int get additional;
  @override
  @JsonKey(ignore: true)
  _$$DeliveryChargeReqImplCopyWith<_$DeliveryChargeReqImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
