
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/app_bottom_navigation/app_bottom_navigation_bloc.dart';
import '../views.dart';

class AppBottomNavigation extends StatelessWidget {
  const AppBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBottomNavigationBloc, AppBottomNavigationState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: appBottomNavView.elementAt(state.initialIndex),
          bottomNavigationBar: BottomNavigationBar(
            items: appBottomNavItems,
            currentIndex: state.initialIndex,
            onTap: (index) {
              BlocProvider.of<AppBottomNavigationBloc>(context)
                  .add(OnTapChage(tapIndex: index));
            },
          ),
        );
      },
    );
  }
}

List<BottomNavigationBarItem> appBottomNavItems = const [
  BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: "Home",
      activeIcon: Icon(Icons.home_rounded)),
  BottomNavigationBarItem(
      icon: Icon(Icons.search_rounded),
      label: "Search",
      activeIcon: Icon(Icons.saved_search)),
  BottomNavigationBarItem(
      icon: Icon(Icons.favorite_border),
      label: "Whitelist",
      activeIcon: Icon(Icons.favorite)),
];

List appBottomNavView = const [
  HomeView(),
  SearchView(),
  WhiteListView(),
];
