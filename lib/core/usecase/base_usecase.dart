import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:perlatech/error/failure.dart';

abstract class BaseUseCase<T, Parameters> {
  Future<Either<Failure, T>> call(Parameters parameters);
}

abstract class UseCase<Type, Params> {
  Type call(Params params);
}

class NoParameters extends Equatable {
  const NoParameters();

  @override
  List<Object?> get props => [];
}
