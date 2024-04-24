import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/common/error/exceptions.dart';
import '../../../../core/network/api_service.dart';
import '../../domain/entities/login_response.dart';
import '../../domain/entities/registration_response.dart';

abstract class AuthenticationRemoteDataSource {
  Future<RegisterResponse> createAccount(Map<String, dynamic> body);

  Future<LoginResponse> login(String phoneNumber, String password);
}

class IAuthenticationRemoteDataSource implements AuthenticationRemoteDataSource {
  final ApiService? apiService;

  IAuthenticationRemoteDataSource({required this.apiService});

  @override
  Future<RegisterResponse> createAccount(Map<String, dynamic> body) async {
    try {
      final response = await apiService!.providerRegistration(body);

      // var db = FirebaseFirestore.instance;
      // final userCollection = db.collection("users");
      //
      // QuerySnapshot querySnapshot = await userCollection
      //     .where("phone_number", isEqualTo: phoneNumber)
      //     .limit(1)
      //     .get();
      //
      // if (querySnapshot.docs.isNotEmpty) {
      //   final data = {
      //     "status": 400,
      //     "message": "User already register to the system",
      //   };
      //   return RegisterResponse.fromJson(data);
      // } else {
      //   await addUser(username, phoneNumber, password); // Use 'await' here
      //   final data = {
      //     "status": 200,
      //     "message": "Registration success...",
      //   };
      //   return RegisterResponse.fromJson(data);
      // }

      debugPrint("Provider Reg response ${response.toString()}");

      if (response.response.statusCode == 200) {
        final data = {
          "status": 200,
          "message": "Registration success...",
        };
        return RegisterResponse.fromJson(data);
      } else if (response.response.statusCode == 400) {
        final data = {
          "status": 400,
          "message": "User already register to the system",
        };
        return RegisterResponse.fromJson(data);
      } else {
        //await addUser(username, phoneNumber, password); // Use 'await' here
        final data = {
          "status": response.response.statusCode,
          "message": "Something went wrong ",
        };
        return RegisterResponse.fromJson(data);
      }
    } catch (e) {
      throw ServerException(message: "Something went wrong, pls try again later");
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
  Future<LoginResponse> login(String phoneNumber, String password) async {
    try {
      var db = FirebaseFirestore.instance;
      final userCollection = db.collection("users");
      QuerySnapshot querySnapshot = await userCollection
          .where("phone_number", isEqualTo: phoneNumber)
          .where("password", isEqualTo: password)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        var username = "";
        var phoneNumber = "";
        for (var doc in querySnapshot.docs) {
          phoneNumber = doc["phone_number"];
          username = doc["username"];
        }
        final data = {
          "message": "Login success...",
          "status": 200,
          "phone_number": phoneNumber,
          "username": username
        };
        return LoginResponse.fromJson(data);
      } else {
        final data = {"message": "Incorrect Phone Number or Password", "status": 400};
        return LoginResponse.fromJson(data);
      }
    } catch (e) {
      print(e);
      throw ServerException(message: 'Server error $e');
    }
  }
}
