import 'dart:convert';
import 'package:dio/dio.dart';

import '../../../../core/network/api_constance.dart';
import '../../../../core/network/error_massage_model.dart';
import '../../../../error/exceptions.dart';
import '../../domain/usecases/register_usecase.dart';
import '../models/register_model.dart';

abstract class BaseRegisterDataSource {
  Future<RegisterDataModel> register(RegisterParameters parameters);
}

class RegisterDataSource extends BaseRegisterDataSource {
  @override
  Future<RegisterDataModel> register(RegisterParameters parameters) async {
    var object = {
      "full_name": parameters.fullname,
      "phone": parameters.phone,
      "password": parameters.password,
    };

    var param = jsonEncode(object);
    try {
      final response = await Dio().post(ApiConstance.register,
          data: param,
          options: Options(
            headers: {"Content-Type": "application/json"},
            followRedirects: true,
            validateStatus: (status) {
              return status! < 500;
            },
          ));
      var data = jsonDecode(response.data);
      if (response.statusCode == 200) {
        return RegisterDataModel.fromJson(data);
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
