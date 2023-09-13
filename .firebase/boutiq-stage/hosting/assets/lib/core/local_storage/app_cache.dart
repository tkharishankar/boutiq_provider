import 'package:get_storage/get_storage.dart';

import '../../features/auth/domain/entities/login_response.dart';
import '../common/error/exceptions.dart';

class AppCacheKey {
  static const String introState = 'introState';
  static const String userData = 'userData';
}

abstract class AppCache {
  setIntroState(bool state);
  bool getIntroState();
  setUserInfo(UserData userData);
  UserData? getUserInfo();
}

class AppCacheImpl implements AppCache {
  final box = GetStorage();

  @override
  UserData? getUserInfo() {
    try {
      final userData = box.read(AppCacheKey.userData);
      if (userData != null) {
        return UserData.fromJson(userData);
      } else {
        return null;
      }
    } on CacheException {
      throw CacheException();
    }
  }

  @override
  setUserInfo(UserData userData) async {
    try {
      await box.write(AppCacheKey.userData, userData.toJson());
    } on CacheException {
      throw CacheException();
    }
  }

  @override
  setIntroState(bool state) async {
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
}
