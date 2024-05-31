import 'package:dartz/dartz.dart';

import '../../../../core/network/api_error.dart';
import '../../data/datasource/remote/authentication_remote_firebase.dart';
import '../../data/models/login/login_response.dart';
import '../../data/models/registration/registration_response.dart';

abstract class AuthenticationRepo {
  Future<Either<ApiError, RegisterResponse>> createAccount(
      {required final Map<String, dynamic> body});

  Future<Either<ApiError, LoginResponse>> login(
      {required String phoneNumber, required String password});
}

class AuthenticationRepository implements AuthenticationRepo {
  late AuthenticationRemoteDataSource authenticationRemoteDataSource;

  AuthenticationRepository({required this.authenticationRemoteDataSource});

  @override
  Future<Either<ApiError, RegisterResponse>> createAccount(
      {required final Map<String, dynamic> body}) async {
    try {
      return await authenticationRemoteDataSource.createAccount(body);
    } on ApiError catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<ApiError, LoginResponse>> login(
      {required String phoneNumber, required String password}) async {
    try {
      return await authenticationRemoteDataSource.login(phoneNumber, password);
    } on ApiError catch (error) {
      return Left(error);
    }
  }
}
