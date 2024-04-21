import 'package:flutter/material.dart';

const primyColor = Color.fromARGB(255, 174, 127, 255);
const secondaryColor = Color.fromARGB(255, 255, 255, 255);

ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
    iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(
      iconColor: MaterialStatePropertyAll(primyColor),
      iconSize: MaterialStatePropertyAll(24),
    )));
