import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:perlatech/Auth/login/presentation/screens/login_view.dart';
import 'package:perlatech/Auth/register/presentation/screens/register_view.dart';
import 'package:perlatech/home/presentation/screens/home.dart';
import 'package:perlatech/splash/splash_view.dart';

import '../../app/bloc/app_bloc.dart';
import '../services/services_locator.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final sectionNavigatorKey = GlobalKey<NavigatorState>();

class RoutesPath {
  static String get splashScreen => '/';

  static String get loginPage => '/login';

  static String get register => '$loginPage/register';

  static String get rootPage => '/home';
}

final router = GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: rootNavigatorKey,
  routes: routes,
  initialLocation: RoutesPath.splashScreen,
  refreshListenable: GoRouterRefreshStream(sl<AppBloc>().stream),
);

final List<RouteBase> routes = [
  GoRoute(
    parentNavigatorKey: rootNavigatorKey,
    name: "splash",
    path: "/",
    builder: (context, state) {
      return const SplashView();
    },
    redirect: (context, goState) {
      if (sl<AppBloc>().state.appStatus == Status.unauthorized &&
          goState.location == RoutesPath.splashScreen) {
        return RoutesPath.loginPage;
      } else if (sl<AppBloc>().state.appStatus == Status.authorized &&
          goState.location == RoutesPath.splashScreen) {
        return RoutesPath.rootPage;
      }
      return null;
    },
  ),

  // GoRoute(
  //     parentNavigatorKey: rootNavigatorKey,
  //     name: 'serverScreen',
  //     path: '/auth',
  //     builder: (context, state) => const ServerConfigurationScreen(),
  //     redirect: (context, goRouterState) {
  //       if (locator<AppBloc>().state.appStatus == Status.authorized &&
  //           goRouterState.path == RoutesPath.serverPage) {
  //         return RoutesPath.rootPage;
  //       }
  //       return null;
  //     },
  //     routes: [

  GoRoute(
    name: 'homeScreen',
    path: '/home',
    builder: (context, state) => HomeView(),
    redirect: (context, goRouterState) {
      print('authauthauth');
      if (sl<AppBloc>().state.appStatus == Status.unauthorized) {
        return RoutesPath.loginPage;
      }
      return null;
    },
  ),
  GoRoute(
      name: 'loginScreen',
      path: '/login',
      builder: (context, state) => LoginView(),
      redirect: (context, goRouterState) {
        print('authauthauth');
        if (sl<AppBloc>().state.appStatus == Status.authorized &&
            goRouterState.path == RoutesPath.loginPage) {
          return RoutesPath.rootPage;
        }
        return null;
      },
      routes: [
        GoRoute(
          name: 'registerScreen',
          path: 'register',
          builder: (context, state) => RegisterView(),
          redirect: (context, goRouterState) {
            print('authauthauth');
            if (sl<AppBloc>().state.appStatus == Status.authorized &&
                goRouterState.path == RoutesPath.register) {
              return RoutesPath.rootPage;
            }
            return null;
          },
        ),
      ])
  //           routes: [
  //             GoRoute(
  //                 path: 'forget-password',
  //                 builder: (context, state) {
  //                   return const ForgetPasswordScreen();
  //                 },
  //                 routes: [
  //                   GoRoute(
  //                       path: 'verify-code',
  //                       builder: (context, state) {
  //                         return const VerifyCodeScreen();
  //                       },
  //                       routes: [
  //                         GoRoute(
  //                             path: 'reset-password',
  //                             builder: (context, state) {
  //                               return const ResetPasswordScreen();
  //                             },
  //                             routes: [
  //                               GoRoute(
  //                                 redirect: (context, state) {},
  //                                 path: 'change-success',
  //                                 builder: (context, state) {
  //                                   return const ChangePasswordSuccessScreen();
  //                                 },
  //                               )
  //                             ])
  //                       ])
  //                 ]),
  //           ]),
  //     ]),
];

class GoRouterRefreshStream extends ChangeNotifier {
  late final StreamSubscription<dynamic> _subscription;

  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
