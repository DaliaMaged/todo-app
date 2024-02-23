import 'package:flutter/material.dart';

class TodoTheme {
  static Color primaryLight=Color(0xff5D9CEC);
  static Color secLight=Color(0xffDFECDB);
  static Color blackTextLight=Color(0xff303030);
  static Color customWhite=Color(0xffffffff);
  static Color secDark = Color(0xff060E1E);
  static Color customBlack = Color(0xff141922);
  static Color customGrey = Color(0xffC8C9CB);
static ThemeData todo_light = ThemeData(
  primaryColor: primaryLight,
  scaffoldBackgroundColor: secLight,
  appBarTheme:AppBarTheme(
    elevation: 0,
    backgroundColor: primaryLight,
    titleTextStyle: TextStyle(
      color: customWhite,
      fontSize: 20,
      fontWeight: FontWeight.bold
    )
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 0,
    backgroundColor:Colors.transparent,
    selectedItemColor: primaryLight
  ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryLight,
      shape: CircleBorder(
          side: BorderSide(
              color:customWhite,
            width: 3,
          )
      ),
    ),
);
static ThemeData todo_dark = ThemeData(
  primaryColor: primaryLight,
  scaffoldBackgroundColor: secDark,
  appBarTheme:AppBarTheme(
    elevation: 0,
    backgroundColor: primaryLight,
    titleTextStyle: TextStyle(
      color: customBlack,
      fontSize: 20,
      fontWeight: FontWeight.bold
    )
  ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
        backgroundColor: Colors.transparent,
        selectedItemColor: primaryLight
    ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: primaryLight,
    shape: CircleBorder(
        side: BorderSide(
            color:customGrey,
          width: 4,
        )
    ),
  )
);
}