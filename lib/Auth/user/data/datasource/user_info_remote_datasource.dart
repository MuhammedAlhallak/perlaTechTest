import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../core/network/api_constance.dart';
import '../../../../core/network/error_massage_model.dart';
import '../../../../error/exceptions.dart';

abstract class BaseUserInfoDataRemoteSource {
  Future<bool> logOut(String accessToken);
}

class UserInfoDataRemoteSource extends BaseUserInfoDataRemoteSource {
  @override
  Future<bool> logOut(String accessToken) async {
    final response = await Dio().get(ApiConstance.logOutPath,
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
          // headers: {"Content-Type": "application/json"},
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ));
    if (response.statusCode == 200) {
      return true;
    } else {
      var data = jsonDecode(response.data);

      throw ServerException(ErrorMassageModel.fromJson(data));
    }
  }
}
