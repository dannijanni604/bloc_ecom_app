import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bloc.dart';
import 'config/config.dart';
import 'repository/repository.dart';
import 'utils/utils.dart';

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
      providers: blocPrviders(),
      child: MaterialApp(
        theme: lightTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.splashView,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}

List<BlocProvider> blocPrviders() {
  return [
    BlocProvider(create: (_) => AppBottomNavigationBloc()),
    BlocProvider(create: (_) => SwitchBloc()),
    BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtils())),
    BlocProvider(create: (_) => CartBloc()),
    BlocProvider(create: (_) => WhitelistBloc(WhitelistRepository())),
    BlocProvider(create: (_) => ProductsBloc())
  ];
}
