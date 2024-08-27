
import 'package:flutter/material.dart';
import '../../views/views.dart';
import 'app_routes.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashView:
        return MaterialPageRoute(builder: (context) => const SplashView());
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

// static final RouteObserver observer = RouteObserver();
//
// static List<PageEntity> routes() {
//   return [
//     PageEntity(
//       path: AppRoutes.appBottomNav,
//       view: const AppBottomNavigation(),
//       bloc: BlocProvider(create: (_) => AppBottomNavigationBloc()),
//     ),
//     PageEntity(
//       path: AppRoutes.notificationsView,
//       view: const NotificationsView(),
//       bloc: BlocProvider(create: (_) => SwitchBloc()),
//     ),
//   ];
// }
//
// static List<dynamic> blocer(BuildContext context) {
//   List<dynamic> blocerList = [];
//
//   for (var blocks in routes()) {
//     blocerList.add(blocks.bloc);
//   }
//
//   return blocerList;
// }
//
// static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
//   // if (settings.name != null) {
//   //   var result = routes().where((element) => element.path == settings.name);
//   //   if (result.isNotEmpty) {}
//   // }
//   return MaterialPageRoute<void>(
//       builder: (_) => const AppBottomNavigation(), settings: settings);
// }
}

class PageEntity {
  String path;
  Widget view;
  dynamic bloc;

  PageEntity({
    required this.path,
    required this.view,
    required this.bloc,
  });
}
