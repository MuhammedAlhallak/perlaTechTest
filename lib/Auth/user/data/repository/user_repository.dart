
import 'package:dartz/dartz.dart';
import 'package:perlatech/Auth/user/data/datasource/user_info_local_datasource.dart';
import 'package:perlatech/Auth/user/data/datasource/user_info_remote_datasource.dart';
import 'package:perlatech/Auth/user/data/models/user_info_model.dart';
import 'package:perlatech/Auth/user/domain/repository/base_user_repository.dart';
import 'package:perlatech/error/exceptions.dart';
import 'package:perlatech/error/failure.dart';



class UserInfoRepository extends BaseUserInfoRepository {
  final BaseUserInfoDataRemoteSource baseUserInfoDataRemoteSource;
  final BaseUserInfoDataLocalSource baseUserInfoDataLocalSource;

  UserInfoRepository(
      this.baseUserInfoDataRemoteSource, this.baseUserInfoDataLocalSource);

  @override
  Future<Either<Failure, bool>> logOut() async {
    String accessToken = await getAccessToken();

    try {
      bool result = await baseUserInfoDataRemoteSource.logOut(accessToken);
      await deleteUserInfo();

      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMassageModel.message));
    }
  }

  @override
  Future<void> deleteUserInfo() async {
    await baseUserInfoDataLocalSource.deleteUserInfo();
  }

  @override
  Future<String> getAccessToken() async {
    return await baseUserInfoDataLocalSource.getAccessToken();
  }

  @override
  Future<void> saveUserInfo(UserInfoModel userInfoModel) async {
    return await baseUserInfoDataLocalSource.saveUserInfo(userInfoModel);
  }

  @override
  Future<Either<Failure, bool>> checkLogin() async {
    try {
      var result = await baseUserInfoDataLocalSource.checkLogin();
      return Right(result);
    } on DataBaseException catch (failure) {
      return Left(DataBaseFailure(failure.massage));
    }
  }
}
