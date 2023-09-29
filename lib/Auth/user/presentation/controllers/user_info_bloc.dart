import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perlatech/Auth/user/domain/usecases/islogged_usecase.dart';
import 'package:perlatech/Auth/user/domain/usecases/logout_usecase.dart';
import 'package:perlatech/Auth/user/presentation/controllers/user_info_event.dart';
import 'package:perlatech/Auth/user/presentation/controllers/user_info_state.dart';
import 'package:perlatech/core/usecase/base_usecase.dart';
import 'package:perlatech/core/utils/enum.dart';
import 'package:perlatech/resources/strings_manager.dart';


class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  final LogOutUseCase logOutUseCase;
  final IsLoggedUseCase isLoggedUseCase;
  UserInfoBloc(this.logOutUseCase, this.isLoggedUseCase)
      : super(UserInfoState()) {
    on<CheckLoggedEvent>(_checkLogged);
    on<LogOutEvent>(_logOut);
  }

  void _checkLogged(CheckLoggedEvent event, Emitter<UserInfoState> emit) async {
    var result = await isLoggedUseCase(const NoParameters());

    result.fold(
        (l) => emit(state.copyWith(
            isLogged: LoggedState.unLogged, logOutMassage: l.massage)),
        (r) => emit(state.copyWith(isLogged: LoggedState.logged)));
  }

  FutureOr<void> _logOut(LogOutEvent event, Emitter<UserInfoState> emit) async {
    final result = await logOutUseCase(const NoParameters());

    result.fold(
        (l) => emit(state.copyWith(
            isLogged: LoggedState.logged, logOutMassage: l.massage)),
        (r) => emit(state.copyWith(
            isLogged: LoggedState.unLogged,
            logOutMassage: AppStrings.loggedOutSuccesfuly)));
  }
}
