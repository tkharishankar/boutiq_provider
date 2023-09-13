import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/network/api_error.dart';
import '../../../../../core/usecases/usecases.dart';
import '../../data/repositories/authentication_repo.dart';
import '../entities/registration_response.dart';

class RegisterUsecase implements UseCase<RegisterResponse, Params> {
  final AuthenticationRepo authenticationRepo;

  RegisterUsecase(this.authenticationRepo);

  @override
  Future<Either<ApiError, RegisterResponse>> call(Params params) async {
    return await authenticationRepo.createAccount(
      username: params.username,
      phoneNumber: params.phoneNumber,
      password: params.password,
    );
  }
}

class Params extends Equatable {
  final String username;
  final String phoneNumber;
  final String password;
  const Params({
    required this.phoneNumber,
    required this.username,
    required this.password,
  });

  @override
  List<Object> get props => [phoneNumber, username,password];
}
