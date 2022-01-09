import 'package:ecommerce_app_project/View/Widgets/custom_text.dart';
import 'package:ecommerce_app_project/constants.dart';
import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    backgroundColor: Colors.grey[200],
    textTheme: lightTextTheme,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    cardColor: primaryColor,
    //cardTheme: CardTheme(
      //color: primaryColor,
    //),
  );

  static final dark = ThemeData.dark().copyWith(
    backgroundColor: Color(0xff121212),
    textTheme: darkTextTheme,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    cardColor: Colors.grey.shade800,
    //cardTheme: CardTheme(
      //color: Colors.black45,
    //),
  );

  static TextTheme lightTextTheme = TextTheme(
    bodyText1: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline1: TextStyle(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headline2: TextStyle(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline3: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headline4: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headline6: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyText1: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline1: TextStyle(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline2: TextStyle(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline3: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headline4: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headline6: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );
}