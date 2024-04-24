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
  final String? email;
  final String? phone;

  const Provider({
    this.providerId,
    this.companyName,
    this.email,
    this.phone,
  });

  factory Provider.fromJson(Map<String, dynamic> json) => _$ProviderFromJson(json);

  Map<String, dynamic> toJson() => _$ProviderToJson(this);
}
