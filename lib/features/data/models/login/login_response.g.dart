// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginResponseImpl _$$LoginResponseImplFromJson(Map<String, dynamic> json) =>
    _$LoginResponseImpl(
      accessToken: json['accessToken'] as String?,
      provider: json['provider'] == null
          ? null
          : Provider.fromJson(json['provider'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LoginResponseImplToJson(_$LoginResponseImpl instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'provider': instance.provider,
    };

_$ProviderImpl _$$ProviderImplFromJson(Map<String, dynamic> json) =>
    _$ProviderImpl(
      providerId: json['providerId'] as String?,
      companyName: json['companyName'] as String?,
      contactPerson: json['contactPerson'] == null
          ? const ContactPersonDetail()
          : ContactPersonDetail.fromJson(
              json['contactPerson'] as Map<String, dynamic>),
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      place: json['place'] as String?,
      bannerImageUrl: json['bannerImageUrl'] as String?,
      updatedAt: (json['updatedAt'] as num?)?.toInt(),
      createdAt: (json['createdAt'] as num?)?.toInt(),
      status: json['status'] == null
          ? ProviderStatus.REQUESTED
          : providerStatusFromJson(json['status'] as String),
    );

Map<String, dynamic> _$$ProviderImplToJson(_$ProviderImpl instance) =>
    <String, dynamic>{
      'providerId': instance.providerId,
      'companyName': instance.companyName,
      'contactPerson': instance.contactPerson,
      'email': instance.email,
      'phone': instance.phone,
      'place': instance.place,
      'bannerImageUrl': instance.bannerImageUrl,
      'updatedAt': instance.updatedAt,
      'createdAt': instance.createdAt,
      'status': providerStatusToJson(instance.status),
    };

_$UpdateProviderReqImpl _$$UpdateProviderReqImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateProviderReqImpl(
      companyName: json['companyName'] as String?,
      contactPerson: json['contactPerson'] == null
          ? const ContactPersonDetail()
          : ContactPersonDetail.fromJson(
              json['contactPerson'] as Map<String, dynamic>),
      place: json['place'] as String?,
      bannerImageUrl: json['bannerImageUrl'] as String?,
    );

Map<String, dynamic> _$$UpdateProviderReqImplToJson(
        _$UpdateProviderReqImpl instance) =>
    <String, dynamic>{
      'companyName': instance.companyName,
      'contactPerson': instance.contactPerson,
      'place': instance.place,
      'bannerImageUrl': instance.bannerImageUrl,
    };

_$ContactPersonDetailImpl _$$ContactPersonDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$ContactPersonDetailImpl(
      name: json['name'] as String? ?? '',
      phoneNumber: json['phoneNumber'] as String? ?? '',
    );

Map<String, dynamic> _$$ContactPersonDetailImplToJson(
        _$ContactPersonDetailImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
    };
