// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RegisterResponse _$$_RegisterResponseFromJson(Map<String, dynamic> json) =>
    _$_RegisterResponse(
      message: json['message'] ?? '',
      status: json['status'] as int,
    );

Map<String, dynamic> _$$_RegisterResponseToJson(_$_RegisterResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
