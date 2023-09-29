
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/enum.dart';
import '../../../../resources/strings_manager.dart';
import '../../../user/domain/repository/base_user_repository.dart';
import '../../domain/usecases/login_usecase.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final BaseUserInfoRepository baseUserInfoRepository;
  final LoginUseCase loginUseCase;
  LoginBloc(this.loginUseCase, this.baseUserInfoRepository)
      : super(LoginState()) {
    on<LoginUsernameChangedEvent>(_changeUsername);

    on<LoginPasswordChangedEvent>(_changePassword);

    on<LoginSubmittedEvent>(_loginSubmit);
  }
  void _changeUsername(
      LoginUsernameChangedEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(username: event.username));
  }

  void _changePassword(
      LoginPasswordChangedEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _loginSubmit(LoginSubmittedEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(loginFormState: RequestState.loading));
    final result = await loginUseCase(
        LoginParameters(phone: state.username, password: state.password));

    result.fold(
        (l) => emit(
              state.copyWith(
                loginMassage: l.massage,
                loginFormState: RequestState.error,
              ),
            ),
        (r) => emit(
              state.copyWith(
                  loginMassage: AppStrings.loggedInSuccesfuly,
                  loginFormState: RequestState.loaded),
            ));
  }
}
