import 'dart:convert';
import 'dart:developer';

import 'package:perlatech/Auth/user/data/models/user_info_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../error/exceptions.dart';

abstract class BaseUserInfoDataLocalSource {
  Future<String> getAccessToken();
  Future<void> saveUserInfo(UserInfoModel userInfoModel);
  Future<void> deleteUserInfo();
  Future<bool> checkLogin();
}

class UserInfoDataLocalSource implements BaseUserInfoDataLocalSource {
  static const String _jsonObjectKey = 'jsonObjectKey';

  @override
  Future<String> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    String jsonObject = prefs.getString(_jsonObjectKey) ?? '';

    if (jsonObject != '') {
      UserInfoModel userInfoModel =
          UserInfoModel.fromJson(jsonDecode(jsonObject));
      return userInfoModel.token;
    } else {
      return '';
    }
  }

  @override
  Future<void> saveUserInfo(UserInfoModel userInfoModel) async {
  String jsonObject = jsonEncode(userInfoModel.toJson());
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_jsonObjectKey, jsonObject);
  }

  @override
  Future<void> deleteUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(_jsonObjectKey);
  }

  @override
  Future<bool> checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final stringObject = prefs.getString(_jsonObjectKey);
    log("stringObject: $stringObject");
    if (stringObject != null) {
      return true;
    } else {
      throw DataBaseException(massage: "massage");
    }
  }
}
