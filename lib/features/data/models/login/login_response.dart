import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final String? accessToken;
  final Provider? provider;

  const LoginResponse({this.accessToken, this.provider});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class Provider {
  final String? providerId;
  final String? companyName;
  final ContactPersonDetail contactPerson;
  final String? email;
  final String? phone;
  final String? place;
  final String? password;
  final int? createdAt;
  final int? updatedAt;
  final ProviderStatus? status;

  const Provider({
    this.providerId,
    this.companyName,
    required this.contactPerson,
    this.email,
    this.phone,
    this.place,
    this.password,
    this.createdAt,
    this.updatedAt,
    this.status,
  });

  factory Provider.fromJson(Map<String, dynamic> json) => _$ProviderFromJson(json);

  Map<String, dynamic> toJson() => _$ProviderToJson(this);
}

@JsonSerializable()
class ContactPersonDetail {
  final String name;
  final String phoneNumber;

  const ContactPersonDetail({
    this.name = "",
    this.phoneNumber = "",
  });

  factory ContactPersonDetail.fromJson(Map<String, dynamic> json) => _$ContactPersonDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ContactPersonDetailToJson(this);
}

enum ProviderStatus { REQUESTED, ACTIVE, DEACTIVATED}
