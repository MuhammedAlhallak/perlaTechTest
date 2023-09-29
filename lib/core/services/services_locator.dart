import 'package:get_it/get_it.dart';
import 'package:perlatech/Auth/login/data/datasource/login_remote_datasource.dart';
import 'package:perlatech/Auth/login/data/repository/login_repositort.dart';
import 'package:perlatech/Auth/login/domain/repository/base_login_repository.dart';
import 'package:perlatech/Auth/login/domain/usecases/login_usecase.dart';
import 'package:perlatech/Auth/login/presentation/controllers/login_bloc.dart';
import 'package:perlatech/Auth/register/data/datasource/register_remote_datasource.dart';
import 'package:perlatech/Auth/register/data/repository/register_repositort.dart';
import 'package:perlatech/Auth/register/domain/repository/base_register_repository.dart';
import 'package:perlatech/Auth/register/domain/usecases/register_usecase.dart';
import 'package:perlatech/Auth/register/presentation/controllers/register_bloc.dart';
import 'package:perlatech/Auth/user/data/datasource/user_info_local_datasource.dart';
import 'package:perlatech/Auth/user/data/datasource/user_info_remote_datasource.dart';
import 'package:perlatech/Auth/user/data/repository/user_repository.dart';
import 'package:perlatech/Auth/user/domain/repository/base_user_repository.dart';
import 'package:perlatech/Auth/user/domain/usecases/islogged_usecase.dart';
import 'package:perlatech/Auth/user/domain/usecases/logout_usecase.dart';
import 'package:perlatech/Auth/user/presentation/controllers/user_info_bloc.dart';
import 'package:perlatech/app/bloc/app_bloc.dart';
import 'package:perlatech/core/services/data_store.dart';
import 'package:perlatech/core/services/theme_store.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../home/domain/usecases/data_store_use_cases.dart';
import '../usecase/app_theme_usecases.dart';

final sl = GetIt.instance;

// class ServicesLocator {
Future<void> init() async {
  // BLOC
  // sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
  // sl.registerFactory(() => MovieDetailsBloc(sl(), sl()));

  //HRMaster

  sl.registerFactory(() => LoginBloc(sl(), sl()));
  sl.registerFactory(() => UserInfoBloc(sl(), sl()));
  sl.registerFactory(() => RegisterBloc(
        sl(),
      ));
  sl.registerLazySingleton<ThemeStore>(() => ThemeStore());
  sl.registerLazySingleton<SetAppThemeUseCase>(() => SetAppThemeUseCase(sl<ThemeStore>()));

  sl.registerLazySingleton<GetAppThemeUseCase>(() => GetAppThemeUseCase(sl<ThemeStore>()));
  sl.registerLazySingleton<AppBloc>(() => AppBloc());
  sl.registerLazySingleton<DataStore>(() => DataStore());
  sl.registerLazySingleton<SetDataUseCase>(() => SetDataUseCase(sl<DataStore>()));
  sl.registerLazySingleton<GetDataUseCase>(() => GetDataUseCase(sl<DataStore>()));
  sl.registerLazySingleton<DeleteDataUseCase>(() => DeleteDataUseCase(sl<DataStore>()));

  /// USECASE
  // sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
  // sl.registerLazySingleton(() => GetPopularMoveisUseCase(sl()));
  // sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
  // sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
  // sl.registerLazySingleton(() => GetMovieRecommendationsUseCase(sl()));

  //HRMaster
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => LogOutUseCase(sl()));
  sl.registerLazySingleton(() => IsLoggedUseCase(sl()));
  sl.registerLazySingleton(() => RegisterUseCase(sl()));

  ///REPOSITORY
  // sl.registerLazySingleton<BaseMoveisRepository>(
  //     () => MoviesRepository(sl()));
  //HRMaster
  sl.registerLazySingleton<BaseLoginRepository>(() => LoginRepository(sl(), sl()));
  sl.registerLazySingleton<BaseUserInfoRepository>(() => UserInfoRepository(sl(), sl()));
  sl.registerLazySingleton<BaseRegisterRepository>(() => RegisterRepository(sl(), sl()));

  /// DATA SOURCE
  // sl.registerLazySingleton<BaseMovieRemoteDataSource>(
  //     () => MovieRemoteDataSource());
  //HRMaster
  sl.registerLazySingleton<BaseLoginDataSource>(() => LoginDataSource());
  sl.registerLazySingleton<BaseUserInfoDataRemoteSource>(() => UserInfoDataRemoteSource());
  sl.registerLazySingleton<BaseUserInfoDataLocalSource>(() => UserInfoDataLocalSource());

  sl.registerLazySingleton<BaseRegisterDataSource>(() => RegisterDataSource());

// External Packages

  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
// }
