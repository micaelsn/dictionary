import 'package:flutter/material.dart';

ThemeData makeAppTheme() {
  final primaryColor = Colors.blue;
  final primaryColorDark = Colors.blueGrey;
  final primaryColorLight = Colors.blueAccent;
  return ThemeData(
      primaryColor: primaryColor,
      primaryColorDark: primaryColorDark,
      primaryColorLight: primaryColorLight,
      backgroundColor: Colors.black,
      textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: primaryColor),
          headline2: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: primaryColor),
          headline3: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor),
          bodyText1: TextStyle(fontSize: 15, color: primaryColor),
          bodyText2: TextStyle(fontSize: 14, color: primaryColor)),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: const TextStyle(color: Colors.grey),
        floatingLabelStyle: TextStyle(color: primaryColor),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: primaryColorLight),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
        ),
        alignLabelWithHint: true,
      ),
      buttonTheme: ButtonThemeData(
          colorScheme: ColorScheme.light(primary: primaryColor),
          buttonColor: primaryColor,
          splashColor: primaryColorLight,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          textTheme: ButtonTextTheme.primary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(primary: primaryColor)));
}
