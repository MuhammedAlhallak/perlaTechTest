import 'package:dartz/dartz.dart';
import 'package:perlatech/Auth/user/domain/entities/user_info_entitnes.dart';

import '../../../../error/failure.dart';
import '../usecases/login_usecase.dart';


abstract class BaseLoginRepository {
  Future<Either<Failure, UserInfo>> login(LoginParameters parameters);
}
