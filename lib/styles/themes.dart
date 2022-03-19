import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

ThemeData DarkTheme = ThemeData(
    textTheme: TextTheme(
        bodyText1: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    )),
    primarySwatch: defautColor,
    scaffoldBackgroundColor: Colors.grey[900],
    appBarTheme: AppBarTheme(
      titleSpacing: 20,
      backgroundColor: Colors.grey[900],
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.grey[900],
          statusBarIconBrightness: Brightness.light),
      titleTextStyle: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.grey[900],
    ),
    iconTheme: IconThemeData(color: Colors.white));

ThemeData LightTheme = ThemeData(
    textTheme: TextTheme(
        bodyText1: TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    )),
    primarySwatch: defautColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      titleSpacing: 20,
      backgroundColor: Colors.white,
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark),
      titleTextStyle: TextStyle(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.grey,
    ),
    iconTheme: IconThemeData(color: Colors.black));
