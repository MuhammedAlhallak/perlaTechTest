import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:perlatech/core/localization/app_lang.dart';

import '../../../../core/navigation/routes.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/utils/enum.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/font_manager.dart';
import '../../../../resources/strings_manager.dart';
import '../../../../resources/styles_manager.dart';
import '../../../../resources/values_manager.dart';
import '../components/Register_form.dart';
import '../controllers/register_bloc.dart';
import '../controllers/register_event.dart';
import '../controllers/register_state.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: BlocProvider(
        create: (context) => sl<RegisterBloc>(),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const RangeMaintainingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: AppSize.s24.w,
                    top: AppSize.s96.h,
                    right: AppSize.s24.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        AppStrings.createAccount.tr(context),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        AppStrings.registerToGetStarted.tr(context),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: AppSize.s48.h,
                      ),
                      RegisterForm(formKey: _formkey),
                      SizedBox(
                        height: AppSize.s60.h,
                      ),
                      BlocBuilder<RegisterBloc, RegisterState>(
                        buildWhen: (previous, current) =>
                            previous.registerFormState !=
                            current.registerFormState,
                        builder: (context, state) {
                          return ElevatedButton(
                              onPressed: () {
                                if (_formkey.currentState!.validate() &&
                                    state.registerFormState !=
                                        RequestState.loading) {
                                  context
                                      .read<RegisterBloc>()
                                      .add(RegisterSubmittedEvent());
                                } else if (!_formkey.currentState!.validate() &&
                                    state.registerFormState !=
                                        RequestState.loading) {
                                  IconSnackBar.show(
                                      context: context,
                                      snackBarType: SnackBarType.alert,
                                      label: 'Data required',
                                      snackBarStyle: SnackBarStyle(
                                          labelTextStyle: TextStyle(
                                              color: sl<ColorsManager>()
                                                  .white)) // this one
                                      );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: state.registerFormState ==
                                          RequestState.loading
                                      ? sl<ColorsManager>().disabledGrey
                                      : sl<ColorsManager>().primary),
                              child: Text(AppStrings.register.tr(context)));
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: AppPading.p12.h, bottom: AppPading.p32.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(AppStrings.alreadyHaveAnAccount.tr(context),
                                style: getMediumMontesertStyle(
                                    color: sl<ColorsManager>().grey,
                                    fontSzie: FontSzie.s14.sp)),
                            InkWell(
                              child: Text(AppStrings.login.tr(context),
                                  style: getMediumMontesertStyle(
                                      color: sl<ColorsManager>().primary,
                                      fontSzie: FontSzie.s14.sp)),
                              onTap: () {
                                context.go(RoutesPath.loginPage);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
