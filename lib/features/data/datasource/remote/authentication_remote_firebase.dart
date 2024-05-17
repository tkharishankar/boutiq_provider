import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/common/error/exceptions.dart';
import '../../../../core/local_storage/app_cache.dart';
import '../../../../core/network/api_error.dart';
import '../../../../core/network/api_service.dart';
import '../../../../di/injector.dart';
import '../../models/login/login_response.dart';
import '../../models/registration/registration_response.dart';

abstract class AuthenticationRemoteDataSource {
  Future<Either<ApiError, RegisterResponse>> createAccount(Map<String, dynamic> body);

  Future<Either<ApiError, LoginResponse>> login(String phoneNumber, String password);
}

class IAuthenticationRemoteDataSource implements AuthenticationRemoteDataSource {
  final ApiService? apiService;

  IAuthenticationRemoteDataSource({required this.apiService});

  @override
  Future<Either<ApiError, RegisterResponse>> createAccount(Map<String, dynamic> body) async {
    try {
      final response = await apiService!.providerRegistration(body);

      if (response.response.statusCode == 200) {
        final data = {
          "status": 200,
          "message": "Registration success...",
        };
        return Right(RegisterResponse.fromJson(data));
      } else {
        return Left(ApiError(
            errorCode: response.response.statusCode.toString(),
            errorMessage: "Error in registration"));
      }
    } on DioException catch (error) {
      if (error.response?.statusCode == 400) {
        log('Bad request: ${error.response?.data}');
        final errorMessage = error.response!.data['statusMessage'] ?? 'Unknown error';
        return Left(ApiError(errorCode: "400", errorMessage: errorMessage));
      } else {
        log('Dio error: $error');
        return Left(ApiError(
            errorCode: error.response!.statusCode.toString(),
            errorMessage: "Error in registration"));
      }
    }
  }

  Future<void> addUser(String username, String phoneNumber, String password) async {
    try {
      var db = FirebaseFirestore.instance;
      final userCollection = db.collection("users");
      await userCollection.add({
        "username": username,
        "phone_number": phoneNumber,
        "password": password,
      });
    } catch (e) {
      throw ServerException(message: 'Server Error');
    }
  }

  @override
  Future<Either<ApiError, LoginResponse>> login(String phoneNumber, String password) async {
    try {
      final body = {"phoneNumber": phoneNumber, "password": password};

      final response = await apiService!.providerLogin(body);
      if (response.response.statusCode == 200) {
        final cache = sl<AppCache>();
        final loginResponse = LoginResponse.fromJson(response.response.data);
        cache.setUserInfo(loginResponse);
        return Right(LoginResponse.fromJson(response.response.data));
      } else if (response.response.statusCode == 400) {
        return Left(ApiError(errorCode: "400", errorMessage: "Error in login"));
      } else {
        return Left(ApiError(errorCode: "400", errorMessage: "Error in login"));
      }
    }on DioException catch (error) {
      if (error.response?.statusCode == 400) {
        log('Bad request: ${error.response?.data}');
        final errorMessage = error.response!.data['statusMessage'] ?? 'Unknown error';
        return Left(ApiError(errorCode: "400", errorMessage: errorMessage));
      } else {
        log('Dio error: $error');
        return Left(ApiError(
            errorCode: error.response!.statusCode.toString(),
            errorMessage: "Error in login"));
      }
    }
  }
}
