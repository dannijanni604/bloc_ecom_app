import 'package:bloc_ecom_app/views/splash/splash_services.dart';
import 'package:flutter/material.dart';
import '../../utils/utils.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final SplashServices _splashServices = SplashServices();

  @override
  void initState() {
    super.initState();
    _splashServices.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: primaryColor),
            child: const Text('E Commerce App',
                style: TextStyle(color: lightThemeBg))),
      ),
    );
  }
}
