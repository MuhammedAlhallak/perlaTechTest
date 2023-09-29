

import 'package:dartz/dartz.dart';

import '../../../../error/exceptions.dart';
import '../../../../error/failure.dart';
import '../../../user/domain/repository/base_user_repository.dart';
import '../../domain/entities/register_entitnes.dart';
import '../../domain/repository/base_register_repository.dart';
import '../../domain/usecases/register_usecase.dart';
import '../datasource/register_remote_datasource.dart';

class RegisterRepository extends BaseRegisterRepository {
  final BaseRegisterDataSource baseRegisterDataSource;
  final BaseUserInfoRepository baseUserInfoRepository;
  RegisterRepository(this.baseRegisterDataSource, this.baseUserInfoRepository);

  @override
  Future<Either<Failure, RegisterData>> register(RegisterParameters parameters) async {
    try {
      final result = await baseRegisterDataSource.register(parameters);
    
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMassageModel.message));
    }
  }
}
