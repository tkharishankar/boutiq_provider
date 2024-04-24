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
      email: json['email'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$ProviderToJson(Provider instance) => <String, dynamic>{
      'providerId': instance.providerId,
      'companyName': instance.companyName,
      'email': instance.email,
      'phone': instance.phone,
    };
