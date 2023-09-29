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
import '../../../login/presentation/components/custom_textfield.dart';
import '../controllers/register_bloc.dart';
import '../controllers/register_event.dart';
import '../controllers/register_state.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key, required this.formKey});

  final Key? formKey;

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listenWhen: (previous, current) =>
          previous.registerFormState != current.registerFormState,
      listener: (context, state) {
        if (state.registerFormState == RequestState.loaded) {
          sl<AppBloc>().setAppStatus(Status.authorized);
          IconSnackBar.show(
              context: context,
              snackBarType: SnackBarType.save,
              snackBarStyle: const SnackBarStyle(
                  labelTextStyle: TextStyle(overflow: TextOverflow.ellipsis)),
              label: state.registerMassage);
        }
        state.registerFormState == RequestState.error
            ? IconSnackBar.show(
                context: context,
                snackBarType: SnackBarType.fail,
                snackBarStyle: const SnackBarStyle(
                    labelTextStyle: TextStyle(overflow: TextOverflow.ellipsis)),
                label: state.registerMassage)
            : null;
      },
      child: Form(
        key: formKey,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.only(left: AppPading.p8.w),
            child: Text(
              AppStrings.fullName.tr(context),
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          SizedBox(height: AppSize.s12.h),
          _fullNameTextField(),
          SizedBox(height: AppSize.s24.h),

          //phone
          Padding(
            padding: EdgeInsets.only(left: AppPading.p8.w),
            child: Text(
              AppStrings.phone.tr(context),
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          SizedBox(height: AppSize.s12.h),
          _phoneTextField(),
          SizedBox(height: AppSize.s24.h),

          //password
          Padding(
            padding: EdgeInsets.only(left: AppPading.p8.w),
            child: Text(
              AppStrings.password.tr(context),
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          SizedBox(height: AppSize.s12.h),
          _passwordTextField(),
          SizedBox(height: AppSize.s24.h),

          //confirmPassword
          Padding(
            padding: EdgeInsets.only(left: AppPading.p8.w),
            child: Text(
              AppStrings.confirmPassword.tr(context),
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          SizedBox(height: AppSize.s12.h),
          _confirmPasswordTextField(),
        ]),
      ),
    );
  }

  Widget _fullNameTextField() {
    return BlocBuilder<RegisterBloc, RegisterState>(
      buildWhen: (previous, current) => previous.fullName != current.fullName,
      builder: (context, state) {
        log("rebuild fullname field");

        return CustomTextField(
          prefixIcon: ImagesAssets.fullName,
          textInputType: TextInputType.text,
          validator: (value) =>
              state.isValidfullName ? null : 'fullName Too Short',
          onChanged: (value) => context
              .read<RegisterBloc>()
              .add(RegisterFullNameChangedEvent(fullName: value)),
        );
      },
    );
  }

  Widget _phoneTextField() {
    return BlocBuilder<RegisterBloc, RegisterState>(
      buildWhen: (previous, current) => previous.phone != current.phone,
      builder: (context, state) {
        log("rebuild phone field");

        return CustomTextField(
          textInputType: TextInputType.phone,
          prefixIcon: ImagesAssets.phone,
          validator: (value) => state.isValidphone ? null : 'phone Too Short',
          onChanged: (value) => context
              .read<RegisterBloc>()
              .add(RegisterphoneChangedEvent(phone: value)),
        );
      },
    );
  }

  Widget _passwordTextField() {
    return BlocBuilder<RegisterBloc, RegisterState>(
        buildWhen: (previous, current) => previous.password != current.password,
        builder: (context, state) {
          return PasswordTextField(
            prefixIcon: ImagesAssets.lock,
            suffixIcon: ImagesAssets.crossedEye,
            validator: (value) =>
                state.isValidPassword ? null : 'Password too short',
            onChanged: (value) => context
                .read<RegisterBloc>()
                .add(RegisterPasswordChangedEvent(password: value)),
          );
        });
  }

  Widget _confirmPasswordTextField() {
    return BlocBuilder<RegisterBloc, RegisterState>(
        buildWhen: (previous, current) =>
            previous.confirmPassword != current.confirmPassword,
        builder: (context, state) {
          return PasswordTextField(
            prefixIcon: ImagesAssets.lock,
            suffixIcon: ImagesAssets.crossedEye,
            validator: (value) =>
                state.isValidconfirmPassword ? null : 'password not matched',
            onChanged: (value) => context.read<RegisterBloc>().add(
                RegisterConfirmPasswordChangedEvent(confirmPassword: value)),
          );
        });
  }
}
