import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Muli",
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecorationTheme inputDecorationTheme() {
  const outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(33)),
    borderSide: BorderSide(color: kTextColor),
    gapPadding: 5,
  );

  return const InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(
      horizontal: 30,
      vertical: 10,
    ),
    border: outlineInputBorder,
    focusedBorder: outlineInputBorder,
  );
}

TextTheme textTheme() {
  return const TextTheme(
    bodyLarge: TextStyle(color: kTextColor),
    bodyMedium: TextStyle(color: kTextColor),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    systemOverlayStyle: SystemUiOverlayStyle.light,
    titleTextStyle: TextStyle(
      color: Color(0XFF8B8B8B),
      fontSize: 20,
    ),
    centerTitle: true,
  );
}