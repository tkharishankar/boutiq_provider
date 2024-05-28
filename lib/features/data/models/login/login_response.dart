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

@JsonEnum(fieldRename: FieldRename.none)
enum ProviderStatus {
  REQUESTED,
  ACTIVE,
  DEACTIVATED,
}

extension ProviderStatusExtension on ProviderStatus {
  String get name {
    return this.toString().split('.').last;
  }
}

ProviderStatus providerStatusFromJson(String status) {
  return ProviderStatus.values.firstWhere(
        (e) => e.toString().split('.').last == status.toUpperCase(),
    orElse: () => ProviderStatus.REQUESTED,
  );
}

String providerStatusToJson(ProviderStatus status) {
  return status.name;
}

@freezed
class Provider with _$Provider {
  const factory Provider({
    String? providerId,
    String? companyName,
    @Default(ContactPersonDetail()) ContactPersonDetail contactPerson,
    String? email,
    String? phone,
    String? place,
    int? updatedAt,
    int? createdAt,
    @Default(ProviderStatus.REQUESTED) @JsonKey(fromJson: providerStatusFromJson, toJson: providerStatusToJson) ProviderStatus status,
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