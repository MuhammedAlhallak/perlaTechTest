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
import '../components/login_form.dart';
import '../controllers/login_bloc.dart';
import '../controllers/login_event.dart';
import '../controllers/login_state.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: BlocProvider(
        create: (context) => sl<LoginBloc>(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const RangeMaintainingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: AppSize.s24,
                        top: AppSize.s96,
                        right: AppSize.s24,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            AppStrings.welcomeback.tr(context),
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            AppStrings.enterYourDataToContinue.tr(context),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          SizedBox(
                            height: AppSize.s48.h,
                          ),
                          LoginForm(formKey: _formkey),
                          SizedBox(
                            height: AppSize.s60.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: AppPading.p32.h,
              child: Column(
                children: [
                  BlocBuilder<LoginBloc, LoginState>(
                    buildWhen: (previous, current) =>
                        previous.loginFormState != current.loginFormState,
                    builder: (context, state) {
                      return ElevatedButton(
                          onPressed: () {
                            if (_formkey.currentState!.validate() &&
                                state.loginFormState != RequestState.loading) {
                              context
                                  .read<LoginBloc>()
                                  .add(LoginSubmittedEvent());
                            } else if (!_formkey.currentState!.validate() &&
                                state.loginFormState != RequestState.loading) {
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
                              backgroundColor:
                                  state.loginFormState == RequestState.loading
                                      ? sl<ColorsManager>().disabledGrey
                                      : sl<ColorsManager>().primary),
                          child: Text(
                            AppStrings.login.tr(context),
                            style: getMediumMontesertStyle(
                                color: sl<ColorsManager>().grey,
                                fontSzie: FontSzie.s16.sp),
                          ));
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: AppPading.p12.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AppStrings.dontHaveAnAccount.tr(context),
                            style: getMediumMontesertStyle(
                                color: sl<ColorsManager>().grey,
                                fontSzie: FontSzie.s14.sp)),
                        InkWell(
                          child: Text(AppStrings.register.tr(context),
                              style: getMediumMontesertStyle(
                                  color: sl<ColorsManager>().primary,
                                  fontSzie: FontSzie.s14.sp)),
                          onTap: () {
                            context.go(RoutesPath.register);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
