import 'package:dartz/dartz.dart';

import 'package:perlatech/Auth/user/data/models/user_info_model.dart';
import 'package:perlatech/error/failure.dart';


abstract class BaseUserInfoRepository {
  Future<String> getAccessToken();
  Future<Either<Failure, bool>> checkLogin();
  Future<void> saveUserInfo(UserInfoModel userInfoModel);

  Future<void> deleteUserInfo();
  Future<Either<Failure, bool>> logOut();
}
