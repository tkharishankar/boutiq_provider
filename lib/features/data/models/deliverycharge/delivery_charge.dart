import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery_charge.freezed.dart';
part 'delivery_charge.g.dart';

@freezed
class Country with _$Country {
  const factory Country({
    required String name,
    required String code,
  }) = _Country;

  factory Country.fromJson(Map<String, dynamic> json) => _$CountryFromJson(json);
}

@freezed
class Region with _$Region {
  const factory Region({
    required String name,
    required List<Country> countries,
    @Default(0) int baseCharge,
    @Default(0) int additionalCharge
  }) = _Region;

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);
}


@freezed
class DeliveryChargeReq with _$DeliveryChargeReq {
  const factory DeliveryChargeReq({
    required String regionId,
    @Default(0) int base,
    @Default(0) int additional
  }) = _DeliveryChargeReq;

  factory DeliveryChargeReq.fromJson(Map<String, dynamic> json) => _$DeliveryChargeReqFromJson(json);
}