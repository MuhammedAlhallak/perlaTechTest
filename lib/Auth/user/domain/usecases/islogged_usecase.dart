import 'package:dartz/dartz.dart';
import 'package:perlatech/Auth/user/domain/repository/base_user_repository.dart';
import 'package:perlatech/core/usecase/base_usecase.dart';
import 'package:perlatech/error/failure.dart';


class IsLoggedUseCase extends BaseUseCase<bool, NoParameters> {
  final BaseUserInfoRepository baseUserInfoRepository;

  IsLoggedUseCase(this.baseUserInfoRepository);

  @override
  Future<Either<Failure, bool>> call(NoParameters parameters) async {
    return await baseUserInfoRepository.checkLogin();
  }
}
