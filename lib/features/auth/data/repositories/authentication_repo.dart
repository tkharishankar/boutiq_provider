import 'package:dartz/dartz.dart';

import '../../../../../core/network/api_error.dart';
import '../../../../core/local_storage/app_cache.dart';
import '../../../../di/injector.dart';
import '../../domain/entities/login_response.dart';
import '../../domain/entities/registration_response.dart';
import '../data_source/authentication_remote_firebase.dart';

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
      final registerResponse = await authenticationRemoteDataSource
          .createAccount(body);
      if (registerResponse.status == 400) {
        return Right(registerResponse);

      } else {
        return Left(
            ApiError(errorCode: "400", errorMessage: registerResponse.message!));
      }
    } on ApiError catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<ApiError, LoginResponse>> login(
      {required String phoneNumber, required String password}) async {
    try {
      final loginResponse =
          await authenticationRemoteDataSource.login(phoneNumber, password);
      if (loginResponse.status == 400) {
        return Left(
            ApiError(errorCode: "400", errorMessage: loginResponse.message));
      } else {
        final cache = sl<AppCache>();
        cache.setUserInfo(UserData(
            username: loginResponse.username,
            phoneNumber: phoneNumber,
            loggedAt: ""));
        return Right(loginResponse);
      }
    } on ApiError catch (error) {
      return Left(error);
    }
  }
}
