part of 'registration_bloc.dart';

class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object?> get props => [];

  @override
  bool get stringify => true;
}

class RegisterUser extends RegistrationEvent {
  final String phoneNumber;
  final String username;
  final String password;

  const RegisterUser({
    required this.phoneNumber,
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [phoneNumber, username, password];
}
