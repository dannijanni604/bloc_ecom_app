import 'package:flutter/material.dart';
import '../../utils/themes/light_theme.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child:  Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: primaryColor),
            child: const Text('E Commerce App',style: TextStyle(color: lightThemeBg))),
      ),
    );
  }
}
