import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/usecase/base_usecase.dart';
import '../../../../error/failure.dart';
import '../entities/register_entitnes.dart';
import '../repository/base_register_repository.dart';

class RegisterUseCase extends BaseUseCase<RegisterData, RegisterParameters> {
  final BaseRegisterRepository baseRegisterRepository;

  RegisterUseCase(this.baseRegisterRepository);
  @override
  Future<Either<Failure, RegisterData>> call(RegisterParameters parameters) async {
    return await baseRegisterRepository.register(parameters);
  }
}

class RegisterParameters extends Equatable {
  final String fullname;
  final String phone;
  final String password;

  const RegisterParameters(
      {required this.fullname,
      required this.phone,
      required this.password});

  @override
  List<Object?> get props => [fullname, phone, password,];
}
