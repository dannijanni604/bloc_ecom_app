import 'package:bloc_ecom_app/custom_widgets/mobile/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            customAppBar(title: "ECOM"),
            Text("Home Screen")
            
          ],
        ),
      )),
      bottomNavigationBar: BottomNavigationBar(items: [
     BottomNavigationBarItem(icon:    Icon(Icons.home_outlined)),
     BottomNavigationBarItem(icon:    Icon(Icons.search_rounded)),
     BottomNavigationBarItem(icon:    Icon(Icons.favorite_border)),
      ],),
    );
  }
}
