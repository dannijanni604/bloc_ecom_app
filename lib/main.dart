import 'package:bloc_ecom_app/utils/themes/light_theme.dart';
import 'package:bloc_ecom_app/views/home/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc E-Commerce App',
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}
