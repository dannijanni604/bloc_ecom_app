import 'dart:io';

import 'package:bloc_ecom_app/app/routes/app_pages.dart';
import 'package:bloc_ecom_app/app/routes/app_routes.dart';
import 'package:bloc_ecom_app/utils/themes/light_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyAPNuWV5Gd_lCeNOfyZGylhxKZYuOpAaPk",
              appId: "1:839821671120:android:0aa1884a3d71273e9bbcd5",
              messagingSenderId: "839821671120",
              projectId: "bloc-ecommerce-app-acc95"),
        )
      : await Firebase.initializeApp();
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
