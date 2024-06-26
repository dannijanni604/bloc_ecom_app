import 'package:flutter/material.dart';

const primaryColor = Color.fromARGB(255, 174, 127, 255);
const secondaryColor = Color.fromARGB(255, 255, 255, 255);
const lightThemeBg=Colors.white;

ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
    iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(
      iconColor: MaterialStatePropertyAll(primaryColor),
      iconSize: MaterialStatePropertyAll(24),
    )));
