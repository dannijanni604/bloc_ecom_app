import 'dart:async';

import 'package:bloc_ecom_app/config/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    Timer(const Duration(seconds: 3), () => Navigator.pushNamedAndRemoveUntil(context, AppRoutes.loginView , (route) => false));
  }
}
