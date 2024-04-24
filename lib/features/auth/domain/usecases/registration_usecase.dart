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
      body: params.body
    );
  }
}

class Params extends Equatable {
  final Map<String, dynamic> body;

  const Params({
    required this.body,
  });

  @override
  List<Object> get props => [body];
}
