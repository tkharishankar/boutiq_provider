import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/network/api_error.dart';
import '../../../../../core/usecases/usecases.dart';
import '../../../data/models/registration/registration_response.dart';
import '../../repositories/authentication_repo.dart';

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
