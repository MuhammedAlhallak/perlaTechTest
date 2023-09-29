import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:perlatech/resources/color_manager.dart';
import 'package:perlatech/resources/font_manager.dart';
import 'package:perlatech/resources/styles_manager.dart';
import 'package:perlatech/resources/values_manager.dart';

ThemeData getApplicationTheme(
    ColorsManager colorsManager, Brightness brightness) {
  print('colorsManager ${colorsManager}');
  return ThemeData(
    //main colors
    primaryColor: colorsManager.primary,
    primaryColorLight: colorsManager.lightPrimary,
    primaryColorDark: colorsManager.darkPrimary,
    disabledColor: colorsManager.grey1,
    splashColor: colorsManager.lightPrimary,

    brightness: brightness,
    //card Theme
    cardTheme: CardTheme(
        color: colorsManager.white,
        shadowColor: colorsManager.grey,
        elevation: AppSize.s4),
    //appbar Theme
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: colorsManager.primary,
        elevation: AppSize.s4,
        shadowColor: colorsManager.lightPrimary,
        titleTextStyle: getRegularMontesertStyle(
            fontSzie: FontSzie.s16, color: colorsManager.white)),
    //button Theme

    buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(),
        disabledColor: colorsManager.grey1,
        buttonColor: colorsManager.primary,
        splashColor: colorsManager.lightPrimary),

    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            fixedSize: Size(AppSize.s342.w, AppSize.s48.h),
            textStyle: getMediumMontesertStyle(
                color: colorsManager.white, fontSzie: FontSzie.s16.sp),
            backgroundColor: colorsManager.primary,
            //    disabledBackgroundColor: ColorsManager.disabledGrey,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s12.h)))),

    //text theme
    textTheme: TextTheme(
        titleLarge: getMediumMontesertStyle(
            color: colorsManager.primary, fontSzie: FontSzie.s24.sp),
        titleMedium: getMediumMontesertStyle(
            color: colorsManager.grey, fontSzie: FontSzie.s16.sp),
        titleSmall: getRegularMontesertStyle(
            color: colorsManager.darkGrey, fontSzie: FontSzie.s14.sp),
        bodySmall: getRegularInterStyle(
            color: colorsManager.darkGrey, fontSzie: FontSzie.s12.sp)),

    //input decoration theme (Text Form Field)
    inputDecorationTheme: InputDecorationTheme(
      fillColor: colorsManager.textFieldBackground,
      filled: true,
      isDense: true,
      //content padding
      contentPadding: EdgeInsets.all(AppPading.p12.w),
      //hint style
      hintStyle: getRegularMontesertStyle(
          color: colorsManager.lightGrey, fontSzie: FontSzie.s16.sp),
//label style
      labelStyle: getRegularMontesertStyle(
          color: colorsManager.lightGrey, fontSzie: FontSzie.s16.sp),

//error style
      errorStyle: getRegularMontesertStyle(
          color: colorsManager.error, fontSzie: FontSzie.s12.sp),

      errorMaxLines: 1,

//enabledBorder style
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8.h)),
      ),

      //focusedBorder style
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8.h)),
      ),

      //errorBorder style
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: colorsManager.error,
          width: AppSize.s0_5.w,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8.h)),
      ),

      //focusedErrorBorder style
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8.h)),
      ),
    ),
  );
}
