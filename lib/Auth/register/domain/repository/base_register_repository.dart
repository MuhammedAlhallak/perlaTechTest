import 'package:dartz/dartz.dart';

import '../../../../error/failure.dart';
import '../entities/register_entitnes.dart';
import '../usecases/register_usecase.dart';


abstract class BaseRegisterRepository {
  Future<Either<Failure, RegisterData>> register(RegisterParameters parameters);
}
