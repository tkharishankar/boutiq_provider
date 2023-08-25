// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoginResponse _$$_LoginResponseFromJson(Map<String, dynamic> json) =>
    _$_LoginResponse(
      message: json['message'] ?? '',
      status: json['status'] as int,
      username: json['username'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      loggedAt: json['loggedAt'] ?? '',
    );

Map<String, dynamic> _$$_LoginResponseToJson(_$_LoginResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'username': instance.username,
      'phoneNumber': instance.phoneNumber,
      'loggedAt': instance.loggedAt,
    };

_$_UserData _$$_UserDataFromJson(Map<String, dynamic> json) => _$_UserData(
      username: json['username'] as String,
      phoneNumber: json['phoneNumber'] as String,
      loggedAt: json['loggedAt'] as String,
    );

Map<String, dynamic> _$$_UserDataToJson(_$_UserData instance) =>
    <String, dynamic>{
      'username': instance.username,
      'phoneNumber': instance.phoneNumber,
      'loggedAt': instance.loggedAt,
    };
