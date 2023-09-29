import 'package:flutter/material.dart';
enum AppThemeMode { dark, light }

abstract class ColorsManager {
  Color get primary;

  Color get grey;

  Color get darkGrey;

  Color get white;

  Color get lightGrey;

  Color get orange;

  Color get textFieldBackground;

  Color get tableTitleBackground;

  Color get divider;


  Color get lightPrimary;

  Color get lightGreyOpacity50;

  Color get darkPrimary;

  Color get lightPrimaryOpacity5;

  Color get grey1;

  Color get disabledGrey;

  Color get error;
}

class LightColorsManager extends ColorsManager{
  @override
  Color get primary => const Color(0xff6C63FF);

  @override
  Color get grey => const Color(0xffB1B1B1);

  @override
  Color get darkGrey => const Color(0xff333333);

  @override
  Color get white => const Color(0xFFFFFFFF);

  @override
  Color get lightGrey => const Color(0xffC7C7C7);

  @override
  Color get orange => const Color(0xFFFF5757);

  @override
  Color get textFieldBackground => const Color(0xFFF5F5F5);

  @override
  Color get tableTitleBackground => const Color(0xFFF3F4F6);

  @override
  Color get divider => const Color(0xF3F4F6CC);


  @override
  Color get lightPrimary => const Color.fromRGBO(105, 99, 226, 1);

  @override
  Color get lightGreyOpacity50 => const Color(0x80707070);

  @override
  Color get darkPrimary => const Color(0xff5A1899);

  @override
  Color get lightPrimaryOpacity5 => const Color(0x0D9C4EDC);

  @override
  Color get grey1 => const Color(0xFF707070);

  @override
  Color get disabledGrey => const Color(0xFFD9D9D9);

  @override
  Color get error => const Color(0XFFB50000);
}

class DarkColorsManager extends ColorsManager {
  @override
  Color get primary => const Color(0xff6C63FF);

  @override
  Color get grey => const Color(0xffB1B1B1);

  @override
  Color get darkGrey => const Color(0xffffffff);

  @override
  Color get white => const Color(0xFFFFFFFF);

  @override
  Color get lightGrey => const Color(0xffC7C7C7);

  @override
  Color get orange => const Color(0xFFffffff);

  @override
  Color get textFieldBackground => const Color(0xFFF5F5F5);

  @override
  Color get tableTitleBackground => const Color(0xFFF3F4F6);

  @override
  Color get divider => const Color(0xF3ffffff);


  @override
  Color get lightPrimary => const Color(0xff6C63FF);

  @override
  Color get lightGreyOpacity50 => const Color(0x80707070);

  @override
  Color get darkPrimary => const Color(0xff6C63FF);

  @override
  Color get lightPrimaryOpacity5 => const Color(0x0D9C4EDC);

  @override
  Color get grey1 => const Color(0xFFffffff);

  @override
  Color get disabledGrey => const Color(0xFFD9D9D9);

  @override
  Color get error => const Color(0xFFB50000);
}

class ThemeFactory {
  static ColorsManager colorModeFactory(AppThemeMode appThemeMode) {
    switch (appThemeMode) {
      case AppThemeMode.light:
        return LightColorsManager();
      case AppThemeMode.dark:
        return DarkColorsManager();
      default:
        return LightColorsManager();
    }
  }

  static ThemeMode currentTheme(AppThemeMode appThemeMode) {
    return appThemeMode == AppThemeMode.dark ? ThemeMode.dark : ThemeMode.light;
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
