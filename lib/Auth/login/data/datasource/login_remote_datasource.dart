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
      var data = jsonDecode(response.data["data"]);
//response 200
      ///response i have not like the documnets ?!
      // {
      //   data:
      //   {
      //     user:
      //     {
      //       id: 292,
      //       username: user1  ,
      //       points: 0,
      //       phone: 954339974,
      //       image_path: ,
      //       timestamp: 2023-09-29 14:28:45.746707,
      //       user_type:
      //     },
      //     token: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjkyLCJ1c2VybmFtZSI6InVzZXIxIiwibG9naW4iOiI5NTQzMzk5NzQiLCJ0aW1lc3RhbXAiOiIyMDIzLTA5LTI5IDE0OjI4OjQ1Ljc0NjcwNyJ9.QNf2qQoERJbHel5OHEgqXSH8SLKXtmZToxfrEZ0BrWw
      //     }
      // }

      if (response.statusCode == 200) {
        return UserInfoModel.fromJson(data);
      } else {
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
