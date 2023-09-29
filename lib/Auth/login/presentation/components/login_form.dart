import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:perlatech/core/localization/app_lang.dart';

import '../../../../app/bloc/app_bloc.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/utils/enum.dart';
import '../../../../resources/assets_manager.dart';
import '../../../../resources/strings_manager.dart';
import '../../../../resources/values_manager.dart';
import '../controllers/login_bloc.dart';
import '../controllers/login_event.dart';
import '../controllers/login_state.dart';
import 'custom_textfield.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key, required this.formKey});
  final Key? formKey;
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (previous, current) =>
          previous.loginFormState != current.loginFormState,
      listener: (context, state) {
        if (state.loginFormState == RequestState.loaded) {
          sl<AppBloc>().setAppStatus(Status.authorized);
          IconSnackBar.show(
              context: context,
              snackBarType: SnackBarType.save,
              snackBarStyle: const SnackBarStyle(
                  labelTextStyle: TextStyle(overflow: TextOverflow.ellipsis)),
              label: state.loginMassage);
        }
        state.loginFormState == RequestState.error
            ? IconSnackBar.show(
                context: context,
                snackBarType: SnackBarType.fail,
                snackBarStyle: const SnackBarStyle(
                    labelTextStyle: TextStyle(overflow: TextOverflow.ellipsis)),
                label: state.loginMassage)
            : null;
      },
      child: Form(
        key: formKey,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: AppPading.p8.w),
                child: Text(
                  AppStrings.phone.tr(context),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              SizedBox(height: AppSize.s12.h),
              _usernameTextField(),
              SizedBox(height: AppSize.s38.h),
              Padding(
                padding: EdgeInsets.only(left: AppPading.p8.w),
                child: Text(
                  AppStrings.password.tr(context),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              SizedBox(height: AppSize.s12.h),
              _passwordTextField(),
            ],
          ),
        ]),
      ),
    );
  }

  Widget _usernameTextField() {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        log("rebuild username field");

        return CustomTextField(
          prefixIcon: ImagesAssets.phone,
          validator: (value) =>
              state.isValidUsername ? null : 'Username Too Short',
          onChanged: (value) => context
              .read<LoginBloc>()
              .add(LoginUsernameChangedEvent(username: value)),
        );
      },
    );
  }

  Widget _passwordTextField() {
    return BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) => previous.password != current.password,
        builder: (context, state) {
          return PasswordTextField(
            prefixIcon: ImagesAssets.lock,
            suffixIcon: ImagesAssets.crossedEye,
            validator: (value) =>
                state.isValidPassword ? null : 'Password Too Short',
            onChanged: (value) => context
                .read<LoginBloc>()
                .add(LoginPasswordChangedEvent(password: value)),
          );
        });
  }
}
