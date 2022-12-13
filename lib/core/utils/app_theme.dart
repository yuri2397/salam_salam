import 'package:flutter/material.dart';
import 'package:salam_salam/core/utils/colors.dart';

class AppTheme1 {
  static ThemeData get theme => ThemeData(
        primaryColor: Color(primaryColor),
        accentColor: Color(accentColor),
        scaffoldBackgroundColor: Color(scaffoldBackgroundColor),
        backgroundColor: Color(backgroundColor),
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Color(textColor),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            color: Color(textColor),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          headline3: TextStyle(
            color: Color(textColor),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          headline4: TextStyle(
            color: Color(textColor),
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          headline5: TextStyle(
            color: Color(textColor),
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          headline6: TextStyle(
            color: Color(textColor),
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
          bodyText1: TextStyle(
            color: Color(textColor),
            fontSize: 16,
          ),
          bodyText2: TextStyle(
            color: Color(textColor),
            fontSize: 14,
          ),
          subtitle1: TextStyle(
            color: Color(textColor),
            fontSize: 12,
          ),
          subtitle2: TextStyle(
            color: Color(textColor),
            fontSize: 10,
          ),
          button: TextStyle(
            color: Color(textColor),
            fontSize: 14,
          ),
          caption: TextStyle(
            color: Color(textColor),
            fontSize: 12,
          ),
          overline: TextStyle(
            color: Color(textColor),
            fontSize: 10,
          ),
        ),
      );
}
