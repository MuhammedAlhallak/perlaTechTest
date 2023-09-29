part of 'app_bloc.dart';

enum Status { startup, authorized, unauthorized }

class AppState extends Equatable {
  const AppState({
    this.appThemeMode = AppThemeMode.light,
    this.appStatus = Status.startup,
    this.language = AppLanguages.en,

  });

  final AppThemeMode appThemeMode;
  final Status appStatus;
  final AppLanguages language;

  get isEnglish => language == AppLanguages.en;


  AppState copyWith({
    AppThemeMode? appThemeMode,
    Status? appStatus,
    AppLanguages? language,

  }) {
    return AppState(
      appThemeMode: appThemeMode ?? this.appThemeMode,
      appStatus: appStatus ?? this.appStatus,
      language: language ?? this.language,

    );
  }

  @override
  List<Object?> get props => [appThemeMode, appStatus,language];
}
