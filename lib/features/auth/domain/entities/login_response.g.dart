// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginResponseImpl _$$LoginResponseImplFromJson(Map<String, dynamic> json) =>
    _$LoginResponseImpl(
      message: json['message'] ?? '',
      status: json['status'] as int,
      username: json['username'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      loggedAt: json['loggedAt'] ?? '',
    );

Map<String, dynamic> _$$LoginResponseImplToJson(_$LoginResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'username': instance.username,
      'phoneNumber': instance.phoneNumber,
      'loggedAt': instance.loggedAt,
    };

_$UserDataImpl _$$UserDataImplFromJson(Map<String, dynamic> json) =>
    _$UserDataImpl(
      username: json['username'] as String,
      phoneNumber: json['phoneNumber'] as String,
      loggedAt: json['loggedAt'] as String,
    );

Map<String, dynamic> _$$UserDataImplToJson(_$UserDataImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'phoneNumber': instance.phoneNumber,
      'loggedAt': instance.loggedAt,
    };
