import 'package:flutter/cupertino.dart';
import 'package:perlatech/resources/font_manager.dart';

TextStyle _getMontesertTextStyle(
    double fontSzie, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSzie,
      fontWeight: fontWeight,
      color: color,
      fontFamily: FontConstants.montserratFontFamily);
}

TextStyle _getInterTextStyle(
    double fontSzie, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSzie,
      fontWeight: fontWeight,
      color: color,
      fontFamily: FontConstants.interFontFamily);
}

//regular TextStyle

TextStyle getRegularMontesertStyle(
    {double fontSzie = FontSzie.s16, required Color color}) {
  return _getMontesertTextStyle(fontSzie, FontWeightManager.regular, color);
}

TextStyle getRegularInterStyle(
    {double fontSzie = FontSzie.s12, required Color color}) {
  return _getInterTextStyle(fontSzie, FontWeightManager.regular, color);
}
//Medium TextStyle

TextStyle getMediumMontesertStyle(
    {double fontSzie = FontSzie.s16, required Color color}) {
  return _getMontesertTextStyle(fontSzie, FontWeightManager.medium, color);
}


// //bold TextStyle

// TextStyle getBoldStyle({double fontSzie = FontSzie.s12, required Color color}) {
//   return _getTextStyle(fontSzie, FontWeightManager.bold, color);
// }

// //semiBold TextStyle

// TextStyle getSemiBoldStyle(
//     {double fontSzie = FontSzie.s12, required Color color}) {
//   return _getTextStyle(fontSzie, FontWeightManager.semiBold, color);
// }
