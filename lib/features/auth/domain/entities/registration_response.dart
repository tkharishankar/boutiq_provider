// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'registration_response.freezed.dart';

import 'package:json_annotation/json_annotation.dart';

part 'registration_response.g.dart';

// @freezed
// class RegisterResponse with _$RegisterResponse {
//   const factory RegisterResponse({
//     @Default('') message,
//     required int status,
//   }) = _RegisterResponse;
//
//   factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
//       _$RegisterResponseFromJson(json);
// }

@JsonSerializable()
class RegisterResponse {
  final String? message;
  final int? status;

  const RegisterResponse({
    this.message,
    this.status,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) => _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}
