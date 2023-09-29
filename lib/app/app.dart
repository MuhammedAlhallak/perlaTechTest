import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/localization/app_lang.dart';
import '../core/navigation/routes.dart';
import '../core/services/services_locator.dart';
import '../resources/color_manager.dart';
import '../resources/theme_manager.dart';
import 'bloc/app_bloc.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();

  static const MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final bloc = sl<AppBloc>();

  @override
  void initState() {
    bloc.add(LaunchAppEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      bloc: bloc,
      builder: (context, state) {
        if (sl.isRegistered<ColorsManager>()) {
          sl.unregister<ColorsManager>();
        }
        sl.registerFactory<ColorsManager>(() => ThemeFactory.colorModeFactory(state.appThemeMode));

        return ScreenUtilInit(
          designSize: const Size(390, 844),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (BuildContext context, Widget? child) => MaterialApp.router(
            debugShowCheckedModeBanner: false,
            locale: LocalizationManager.localeFactory(state.language),
            localizationsDelegates: LocalizationManager.createLocalizationsDelegates,
            supportedLocales: LocalizationManager.createSupportedLocals,
            theme: getApplicationTheme(sl<ColorsManager>(),
                state.appThemeMode == AppThemeMode.light ? Brightness.light : Brightness.dark),
            routerConfig: router,

            // ),
          ),
        );
      },
    );
  }
}
