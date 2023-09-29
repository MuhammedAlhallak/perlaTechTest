import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:perlatech/Auth/user/domain/entities/user_info_entitnes.dart';

import '../../../../error/exceptions.dart';
import '../../../../error/failure.dart';
import '../../../user/domain/repository/base_user_repository.dart';
import '../../domain/repository/base_login_repository.dart';
import '../../domain/usecases/login_usecase.dart';
import '../datasource/login_remote_datasource.dart';

class LoginRepository extends BaseLoginRepository {
  final BaseLoginDataSource baseLoginDataSource;
  final BaseUserInfoRepository baseUserInfoRepository;
  LoginRepository(this.baseLoginDataSource, this.baseUserInfoRepository);

  @override
  Future<Either<Failure, UserInfo>> login(LoginParameters parameters) async {
    try {
      final result = await baseLoginDataSource.login(parameters);
      log("message");
      baseUserInfoRepository.saveUserInfo(result);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMassageModel.message));
    }
  }
}
