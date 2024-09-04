
import 'package:flutter/material.dart';
import '../../views/views.dart';
import 'app_routes.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashView:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case AppRoutes.loginView:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case AppRoutes.signupView:
        return MaterialPageRoute(builder: (context) => const SignupView());
      case AppRoutes.appBottomNav:
        return MaterialPageRoute(builder: (context) => const AppBottomNavigation());
      case AppRoutes.homeView:
        return MaterialPageRoute(builder: (context) => const HomeView());
      case AppRoutes.profileView:
        return MaterialPageRoute(builder: (context) => const ProfileView());
      case AppRoutes.cartView:
        return MaterialPageRoute(builder: (context) => const CartView());
      case AppRoutes.notificationsView:
        return MaterialPageRoute(builder: (context) => const NotificationsView());
      case AppRoutes.whiteListView:
        return MaterialPageRoute(builder: (context) => const WhiteListView());
      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(body: Center(child: Text('404: Not Found')));
        });
    }
  }
}