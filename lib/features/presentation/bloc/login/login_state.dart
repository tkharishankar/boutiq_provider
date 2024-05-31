part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.loginError(String message) = _LoginError;
  const factory LoginState.loginSuccessful(String message) = _LoginSuccessful;
}
