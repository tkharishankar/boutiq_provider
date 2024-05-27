import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    String? accessToken,
    Provider? provider,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
}

@freezed
class Provider with _$Provider {
  const factory Provider({
    String? providerId,
    String? companyName,
    required ContactPersonDetail contactPerson,
    String? email,
    String? phone,
    String? place,
    String? password,
    int? createdAt,
    int? updatedAt,
  }) = _Provider;

  factory Provider.fromJson(Map<String, dynamic> json) => _$ProviderFromJson(json);
}

@freezed
class ContactPersonDetail with _$ContactPersonDetail {
  const factory ContactPersonDetail({
    @Default('') String name,
    @Default('') String phoneNumber,
  }) = _ContactPersonDetail;

  factory ContactPersonDetail.fromJson(Map<String, dynamic> json) => _$ContactPersonDetailFromJson(json);
}
