import 'dart:io';
import 'package:bloc_ecom_app/bloc/cart/cart_bloc.dart';
import 'package:bloc_ecom_app/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_ecom_app/bloc/products/products_bloc.dart';
import 'package:bloc_ecom_app/bloc/switch/switch_bloc.dart';
import 'package:bloc_ecom_app/bloc/whitelist/whitelist_bloc.dart';
import 'package:bloc_ecom_app/repository/whitelist_repository.dart';
import 'package:bloc_ecom_app/utils/image_picker_utils.dart';
import 'package:bloc_ecom_app/utils/themes/light_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/app_bottom_navigation/app_bottom_navigation_bloc.dart';
import 'config/routes/routes.dart';
import 'config/routes/app_routes.dart';

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
      providers: [
      BlocProvider(create: (_) => AppBottomNavigationBloc()),
      BlocProvider(create: (_) => SwitchBloc()),
      BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtils())),
        BlocProvider(create: (_) => CartBloc()),
        BlocProvider(create: (_) => WhitelistBloc(WhitelistRepository())),
        BlocProvider(create: (_) => ProductsBloc()),
      ],
      child: MaterialApp(
        title: 'Bloc E-Commerce App',
        theme: lightTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.splashView,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
