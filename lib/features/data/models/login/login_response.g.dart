// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      accessToken: json['accessToken'] as String?,
      provider: json['provider'] == null
          ? null
          : Provider.fromJson(json['provider'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'provider': instance.provider,
    };

Provider _$ProviderFromJson(Map<String, dynamic> json) => Provider(
      providerId: json['providerId'] as String?,
      companyName: json['companyName'] as String?,
      contactPerson: ContactPersonDetail.fromJson(
          json['contactPerson'] as Map<String, dynamic>),
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      place: json['place'] as String?,
      password: json['password'] as String?,
      createdAt: (json['createdAt'] as num?)?.toInt(),
      updatedAt: (json['updatedAt'] as num?)?.toInt(),
      status: $enumDecodeNullable(_$ProviderStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$ProviderToJson(Provider instance) => <String, dynamic>{
      'providerId': instance.providerId,
      'companyName': instance.companyName,
      'contactPerson': instance.contactPerson,
      'email': instance.email,
      'phone': instance.phone,
      'place': instance.place,
      'password': instance.password,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'status': _$ProviderStatusEnumMap[instance.status],
    };

const _$ProviderStatusEnumMap = {
  ProviderStatus.REQUESTED: 'REQUESTED',
  ProviderStatus.ACTIVE: 'ACTIVE',
  ProviderStatus.DEACTIVATED: 'DEACTIVATED',
};

ContactPersonDetail _$ContactPersonDetailFromJson(Map<String, dynamic> json) =>
    ContactPersonDetail(
      name: json['name'] as String? ?? "",
      phoneNumber: json['phoneNumber'] as String? ?? "",
    );

Map<String, dynamic> _$ContactPersonDetailToJson(
        ContactPersonDetail instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
    };
