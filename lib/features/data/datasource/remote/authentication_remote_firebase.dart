import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:retrofit/retrofit.dart';

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
      debugPrint("Provider Reg response ${response.response.statusCode}");

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
    // try {
    //   var db = FirebaseFirestore.instance;
    //   final userCollection = db.collection("users");
    //   QuerySnapshot querySnapshot = await userCollection
    //       .where("phone_number", isEqualTo: phoneNumber)
    //       .where("password", isEqualTo: password)
    //       .limit(1)
    //       .get();
    //
    //   if (querySnapshot.docs.isNotEmpty) {
    //     var username = "";
    //     var phoneNumber = "";
    //     for (var doc in querySnapshot.docs) {
    //       phoneNumber = doc["phone_number"];
    //       username = doc["username"];
    //     }
    //     final data = {
    //       "message": "Login success...",
    //       "status": 200,
    //       "phone_number": phoneNumber,
    //       "username": username
    //     };
    //     return LoginResponse.fromJson(data);
    //   } else {
    //     final data = {"message": "Incorrect Phone Number or Password", "status": 400};
    //     return LoginResponse.fromJson(data);
    //   }
    // } catch (e) {
    //   print(e);
    //   throw ServerException(message: 'Server error $e');
    // }

    try {
      final body = {"phoneNumber": "+91$phoneNumber", "password": password};

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
            errorMessage: "Error in registration"));
      }
    }
  }
}
