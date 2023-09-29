import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:perlatech/Auth/login/domain/usecases/login_usecase.dart';
import 'package:perlatech/Auth/user/data/models/user_info_model.dart';
import 'package:perlatech/core/network/api_constance.dart';
import 'package:perlatech/core/network/error_massage_model.dart';
import 'package:perlatech/error/exceptions.dart';

abstract class BaseLoginDataSource {
  Future<UserInfoModel> login(LoginParameters parameters);
}

class LoginDataSource extends BaseLoginDataSource {
  @override
  Future<UserInfoModel> login(LoginParameters parameters) async {
    var object = {"phone": parameters.phone, "password": parameters.password};
    var param = jsonEncode(object);

    try {
      final response = await Dio().post(
        ApiConstance.loginPath,
        data: param,
        options: Options(
          headers: {'Content-Type': 'application/json'},
          followRedirects: true,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );

      if (response.statusCode == 200) {
        var data = response.data["data"];
        return UserInfoModel.fromJson(data);
      } else {
        var data = response.data;

        throw ServerException(ErrorMassageModel.fromJson(data));
      }
    } on DioException catch (e) {
      print('Dio error: $e');
      throw ServerException(ErrorMassageModel(message: e.message!, data: []));
    } on FormatException catch (e) {
      print('Format error: $e');
      throw ServerException(ErrorMassageModel(message: e.message, data: []));
    }
  }
}
