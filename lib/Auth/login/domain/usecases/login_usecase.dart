import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/usecase/base_usecase.dart';
import '../../../../error/failure.dart';
import '../../../user/domain/entities/user_info_entitnes.dart';
import '../repository/base_login_repository.dart';
class LoginUseCase extends BaseUseCase<UserInfo, LoginParameters> {
  final BaseLoginRepository baseLoginRepository;

  LoginUseCase(this.baseLoginRepository);
  @override
  Future<Either<Failure, UserInfo>> call(LoginParameters parameters) async {
    return await baseLoginRepository.login(parameters);
  }
}

class LoginParameters extends Equatable {
  final String phone;
  final String password;

  const LoginParameters({required this.phone, required this.password});

  @override
  List<Object?> get props => [phone, password];
}
