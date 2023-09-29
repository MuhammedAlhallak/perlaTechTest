import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:perlatech/core/localization/app_lang.dart';
import 'package:perlatech/resources/font_manager.dart';
import 'package:perlatech/resources/strings_manager.dart';
import 'package:perlatech/resources/styles_manager.dart';

import '../../../app/bloc/app_bloc.dart';
import '../../../core/services/services_locator.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/values_manager.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});

  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: AppSize.s300.w,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPading.p24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              child: Container(
                width: AppSize.s45.h,
                height: AppSize.s45.h,
                margin: EdgeInsets.only(
                    top: AppMargin.m48.h, bottom: AppMargin.m32.h),
                // padding: EdgeInsets.all(AppPading.p10.w),
                decoration: BoxDecoration(
                  color: sl<ColorsManager>().textFieldBackground,
                  borderRadius: BorderRadius.circular(AppSize.s20.h),
                ),
                child: SvgPicture.asset(
                  ImagesAssets.menuVertical,
                  fit: BoxFit.scaleDown,
                  width: AppSize.s24.h,
                  height: AppSize.s24.h,
                ),
              ),
              onTap: () => _scaffoldState.currentState?.closeDrawer(),
            ),
            Text(
              AppStrings.userName.tr(context),
              style: getMediumMontesertStyle(
                  color: sl<ColorsManager>().darkGrey, fontSzie: FontSzie.s16),
            ),
            SizedBox(
              height: AppSize.s64.h,
            ),
            InkWell(
              onTap: () {
                print('ddsdsdsdsdsdsdsds');
                sl<AppBloc>().changeTheme();
              },
              child: Row(
                children: [
                  SvgPicture.asset(
                    ImagesAssets.darkMode,
                    width: AppSize.s25.h,
                    height: AppSize.s25.h,
                  ),
                  SizedBox(
                    width: AppSize.s12.w,
                  ),
                  Text(
                    AppStrings.darkMode.tr(context),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  SizedBox(
                    width: AppSize.s92.w,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: AppSize.s32.h,
            ),
            InkWell(
              onTap: (){
                sl<AppBloc>().changeLanguage();
              },
              child: Row(
                children: [
                  SvgPicture.asset(
                    ImagesAssets.global,
                    width: AppSize.s20.h,
                    height: AppSize.s20_5.h,
                  ),
                  SizedBox(
                    width: AppSize.s14.w,
                  ),
                  Text(
                    AppStrings.arabic.tr(context),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    AppStrings.slash,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    AppStrings.english.tr(context),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: AppSize.s32.h,
            ),
            InkWell(
              onTap: (){
                sl<AppBloc>().setAppStatus(Status.unauthorized);
              },
              child: Row(
                children: [
                  SvgPicture.asset(
                    ImagesAssets.exit,
                    width: AppSize.s20.h,
                    height: AppSize.s20.h,
                  ),
                  SizedBox(
                    width: AppSize.s14.w,
                  ),
                  Text(
                    AppStrings.logOut.tr(context),
                    style: getRegularMontesertStyle(
                        color: sl<ColorsManager>().orange, fontSzie: FontSzie.s14.sp),
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
