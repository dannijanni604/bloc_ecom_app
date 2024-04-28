import 'package:bloc_ecom_app/app/routes/app_pages.dart';
import 'package:bloc_ecom_app/app/routes/app_routes.dart';
import 'package:bloc_ecom_app/utils/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.blocer(context)],
      child: MaterialApp(
        title: 'Bloc E-Commerce App',
        theme: lightTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.appBottomNav,
        onGenerateRoute: AppPages.generateRouteSettings,
      ),
    );
  }
}
