import 'package:flutter/material.dart';

class RecipeBookColors extends Color{
  static const primaryColor = "#ffffff";
  static const primaryDarkColor = "#c7c7c7";
  static const backgroundColor = "#81c784";
  static const lightBackgroundColor = "b2fab4";
  static const darkLightBackgroundColor = "#519657";
  static const textColor = "#000000";

  RecipeBookColors(final String hexValue) : super(_getColorFromHex(hexValue));

  static int _getColorFromHex(String hexColor){
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if(hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }
}