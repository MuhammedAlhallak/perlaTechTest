import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Auth/user/presentation/controllers/user_info_bloc.dart';
import '../Auth/user/presentation/controllers/user_info_event.dart';
import '../Auth/user/presentation/controllers/user_info_state.dart';
import '../core/services/services_locator.dart';
import '../resources/assets_manager.dart';
import '../resources/constant_manager.dart';
import '../resources/values_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  _startDelay(Function() routeCallback) {
    _timer = Timer(
      const Duration(seconds: AppConstants.splashDelay),
      routeCallback,
    );
  }


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UserInfoBloc>()..add(CheckLoggedEvent()),
      child: Scaffold(
        body: Center(
          child: SizedBox(
            height: AppSize.s229_75.h,
            width: AppSize.s177_34.w,
            child: BlocListener<UserInfoBloc, UserInfoState>(
              listener: (context, state) {

              },
              child: Image.asset(ImagesAssets.slpashLogo),
            ),
          ),
        ),
      ),
    );
  }
}
