import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/network/api_error.dart';
import '../../../../core/usecases/usecases.dart';
import '../../data/repositories/authentication_repo.dart';
import '../entities/login_response.dart';

class LoginUsecase implements UseCase<LoginResponse, Params> {
  final AuthenticationRepo authenticationRepo;

  LoginUsecase(this.authenticationRepo);

  @override
  Future<Either<ApiError, LoginResponse>> call(Params params) async {
    return await authenticationRepo.login(
      phoneNumber: params.phoneNumber,
      password: params.password,
    );
  }
}

class Params extends Equatable {
  final String phoneNumber;
  final String password;

  const Params({
    required this.phoneNumber,
    required this.password,
  });

  @override
  List<Object> get props => [phoneNumber,password];
}
