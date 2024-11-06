import 'dart:async';
import 'package:flutter/cupertino.dart';
import '../../config/config.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.loginView, (route) => false));
  }
}
