import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perlatech/Auth/register/presentation/controllers/register_event.dart';
import 'package:perlatech/Auth/register/presentation/controllers/register_state.dart';

import '../../../../core/utils/enum.dart';
import '../../../../resources/strings_manager.dart';
import '../../domain/usecases/register_usecase.dart';
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase registerUseCase;
  RegisterBloc(this.registerUseCase
      )
      : super(RegisterState()) {
    on<RegisterFullNameChangedEvent>(_changeFullName);
    on<RegisterphoneChangedEvent>(_changePhone);

    on<RegisterPasswordChangedEvent>(_changePassword);
    on<RegisterConfirmPasswordChangedEvent>(_changeConfirmPassword);

    on<RegisterSubmittedEvent>(_registerSubmit);
  }
  void _changeFullName(
      RegisterFullNameChangedEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(fullName: event.fullName));
  }

  FutureOr<void> _changePhone(
      RegisterphoneChangedEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(phone: event.phone));
  }

  void _changePassword(
      RegisterPasswordChangedEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(password: event.password));
  }

  FutureOr<void> _changeConfirmPassword(
      RegisterConfirmPasswordChangedEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(confirmPassword: event.confirmPassword));
  }

  void _registerSubmit(
      RegisterSubmittedEvent event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(registerFormState: RequestState.loading));
    final result = await registerUseCase(
      RegisterParameters(
        fullname: state.fullName,
        password: state.password,
        phone: state.phone));

    result.fold(
        (l) => emit(
              state.copyWith(
                registerMassage: l.massage,
                registerFormState: RequestState.error,
              ),
            ),
        (r) => emit(
              state.copyWith(
                  registerMassage: AppStrings.registeredSuccesfuly,
                  registerFormState: RequestState.loaded),
            ));
  }
}
