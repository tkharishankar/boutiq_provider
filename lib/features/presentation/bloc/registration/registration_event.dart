part of 'registration_bloc.dart';

class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object?> get props => [];

  @override
  bool get stringify => true;
}

class RegisterUser extends RegistrationEvent {
  final String companyName;
  final String phoneNumber;
  final String email;
  final String password;

  const RegisterUser({
    required this.phoneNumber,
    required this.companyName,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [phoneNumber, companyName, email,password];
}
