// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_charge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CountryImpl _$$CountryImplFromJson(Map<String, dynamic> json) =>
    _$CountryImpl(
      name: json['name'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$$CountryImplToJson(_$CountryImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
    };

_$RegionImpl _$$RegionImplFromJson(Map<String, dynamic> json) => _$RegionImpl(
      name: json['name'] as String,
      countries: (json['countries'] as List<dynamic>)
          .map((e) => Country.fromJson(e as Map<String, dynamic>))
          .toList(),
      baseCharge: (json['baseCharge'] as num?)?.toInt() ?? 0,
      additionalCharge: (json['additionalCharge'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$RegionImplToJson(_$RegionImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'countries': instance.countries,
      'baseCharge': instance.baseCharge,
      'additionalCharge': instance.additionalCharge,
    };

_$DeliveryChargeReqImpl _$$DeliveryChargeReqImplFromJson(
        Map<String, dynamic> json) =>
    _$DeliveryChargeReqImpl(
      regionId: json['regionId'] as String,
      base: (json['base'] as num?)?.toInt() ?? 0,
      additional: (json['additional'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$DeliveryChargeReqImplToJson(
        _$DeliveryChargeReqImpl instance) =>
    <String, dynamic>{
      'regionId': instance.regionId,
      'base': instance.base,
      'additional': instance.additional,
    };
