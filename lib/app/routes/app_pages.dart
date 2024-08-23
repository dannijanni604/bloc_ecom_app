import 'package:bloc_ecom_app/app/routes/app_routes.dart';
import 'package:bloc_ecom_app/bloc/switch/switch_bloc.dart';
import 'package:bloc_ecom_app/views/notifications/notifications_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/app_bottom_navigation/app_bottom_navigation_bloc.dart';
import '../../views/app_bottom_navigation/app_bottom_navigation.dart';

class AppPages {
  static final RouteObserver observer = RouteObserver();

  static List<PageEntity> routes() {
    return [
      PageEntity(
        path: AppRoutes.appBottomNav,
        view: const AppBottomNavigation(),
        bloc: BlocProvider(create: (_) => AppBottomNavigationBloc()),
      ),
      PageEntity(
        path: AppRoutes.notificationsView,
        view: const NotificationsView(),
        bloc: BlocProvider(create: (_) => SwitchBloc()),
      ),
    ];
  }

  static List<dynamic> blocer(BuildContext context) {
    List<dynamic> blocerList = [];

    for (var blocks in routes()) {
      blocerList.add(blocks.bloc);
    }

    return blocerList;
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    // if (settings.name != null) {
    //   var result = routes().where((element) => element.path == settings.name);
    //   if (result.isNotEmpty) {}
    // }
    return MaterialPageRoute<void>(
        builder: (_) => const AppBottomNavigation(), settings: settings);
  }
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
