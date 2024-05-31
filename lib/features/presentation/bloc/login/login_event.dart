part of 'login_bloc.dart';

class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];

  @override
  bool get stringify => true;
}

class LoginUser extends LoginEvent {
  final String phoneNumber;
  final String password;

  const LoginUser({
    required this.phoneNumber,
    required this.password,
  });

  @override
  List<Object?> get props => [phoneNumber,password];
}
