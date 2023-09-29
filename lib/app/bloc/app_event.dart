part of 'app_bloc.dart';

abstract class AppEvent {}

class AppThemeModeEvent extends AppEvent {
  final AppThemeMode? appThemeMode;

  AppThemeModeEvent({this.appThemeMode});
}

class LaunchAppEvent extends AppEvent {}

class SetAppStatusEvent extends AppEvent {
  final Status appStatus;

  SetAppStatusEvent(
    this.appStatus,
  );
}

class AppLanguageEvent extends AppEvent {
  final AppLanguages? languages;

  AppLanguageEvent({this.languages});
}
