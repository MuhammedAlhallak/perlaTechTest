import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../Auth/user/domain/usecases/islogged_usecase.dart';
import '../../core/localization/app_lang.dart';
import '../../core/services/services_locator.dart';
import '../../core/usecase/app_theme_usecases.dart';
import '../../core/usecase/base_usecase.dart';
import '../../resources/color_manager.dart';

part 'app_event.dart';

part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    on<AppThemeModeEvent>(_onAppThemeMode);
    on<LaunchAppEvent>(_onLaunchApp);
    on<SetAppStatusEvent>(_onAppStatusChanged);
    on<AppLanguageEvent>(_onAppLanguage);
  }

  void _onLaunchApp(LaunchAppEvent event, Emitter<AppState> emit) async {
    final appTheme = await sl<GetAppThemeUseCase>()(NoParams());
    emit(state.copyWith(appThemeMode: appTheme));
    final result = await sl<IsLoggedUseCase>()(const NoParameters());
    await Future.delayed(const Duration(seconds: 7));

    result.fold((l) => emit(state.copyWith(appStatus: Status.unauthorized)),
        (r) => state.copyWith(appStatus: Status.authorized));
  }

  void _onAppLanguage(AppLanguageEvent event, Emitter<AppState> emit) {
    late AppLanguages appLanguages;
    if (event.languages == null) {
      appLanguages =
          state.language == AppLanguages.en ? AppLanguages.ar : AppLanguages.en;
    } else {
      appLanguages = event.languages!;
    }
    emit(state.copyWith(language: appLanguages));
  }

  void _onAppThemeMode(AppThemeModeEvent event, Emitter<AppState> emit) async {
    AppThemeMode appThemeMode = _getContraryTheme(state.appThemeMode);

    emit(state.copyWith(appThemeMode: event.appThemeMode ?? appThemeMode));
    await sl<SetAppThemeUseCase>()(
        ThemeParams(event.appThemeMode ?? appThemeMode));
  }

  void _onAppStatusChanged(
      SetAppStatusEvent event, Emitter<AppState> emit) async {
    if (event.appStatus == Status.authorized) {}
    emit(state.copyWith(
      appStatus: event.appStatus,
    ));
  }

  AppThemeMode _getContraryTheme(AppThemeMode currentMode) {
    return currentMode == AppThemeMode.dark
        ? AppThemeMode.light
        : AppThemeMode.dark;
  }

  void changeTheme({AppThemeMode? appThemeMode}) {
    add(AppThemeModeEvent(appThemeMode: appThemeMode));
  }

  void setAppStatus(Status appStatus) {
    add(SetAppStatusEvent(appStatus));
  }

  void changeLanguage({AppLanguages? languages}) {
    add(AppLanguageEvent(languages: languages));
  }
}
