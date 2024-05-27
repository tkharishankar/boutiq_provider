import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import '../../features/data/models/login/login_response.dart';
import '../common/error/exceptions.dart';

class AppCacheKey {
  static const String introState = 'introState';
  static const String providerId = 'providerId';
  static const String userData = 'userData';
}

abstract class AppCache {
  Future<void> setIntroState(bool state);

  bool getIntroState();

  Future<void> setUserInfo(LoginResponse userData);

  LoginResponse? getUserInfo();

  Future<void> setProviderId(String id);

  String getProviderId();
}

class AppCacheImpl implements AppCache {
  final box = GetStorage();

  @override
  LoginResponse? getUserInfo() {
    try {
      final userData = box.read(AppCacheKey.userData);
      if (userData != null) {
        // Convert userData to Map<String, dynamic>
        Map<String, dynamic>? jsonUserData;
        if (userData is Map<String, dynamic>) {
          jsonUserData = userData;
        } else if (userData is String) {
          // If userData is a String, try parsing it as JSON
          jsonUserData = json.decode(userData);
        }

        if (jsonUserData != null) {
          return LoginResponse.fromJson(jsonUserData);
        }
      }

      return null;
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> setUserInfo(LoginResponse userData) async {
    try {
      setProviderId(userData.provider?.providerId ?? "");
      await box.write(AppCacheKey.userData, userData.toJson());
    } on CacheException {
      throw CacheException();
    }
  }

  @override
  Future<void> setIntroState(bool state) async {
    try {
      await box.write(AppCacheKey.introState, state);
    } on CacheException {
      throw CacheException();
    }
  }

  @override
  bool getIntroState() {
    try {
      final state = box.read(AppCacheKey.introState);
      if (state != null) {
        return state;
      } else {
        return false;
      }
    } on CacheException {
      throw CacheException();
    }
  }

  @override
  String getProviderId() {
    try {
      final state = box.read(AppCacheKey.providerId);
      if (state != null) {
        return state;
      } else {
        return "";
      }
    } on CacheException {
      throw CacheException();
    }
  }

  @override
  Future<void> setProviderId(String id) async {
    try {
      await box.write(AppCacheKey.providerId, id);
    } on CacheException {
      throw CacheException();
    }
  }
}
