part of 'registration_bloc.dart';

@freezed
class RegistrationState with _$RegistrationState {
  const factory RegistrationState.initial() = _Initial;
  const factory RegistrationState.registrationError(String message) =
      _RegistrationError;
  const factory RegistrationState.loading() = _Loading;
  const factory RegistrationState.registrationSuccessful(String message) =
      _RegistrationSuccessful;
}
