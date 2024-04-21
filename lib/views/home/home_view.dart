import 'package:bloc_ecom_app/custom_widgets/mobile/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            customAppBar(title: "ECOM"),
          ],
        ),
      ),
    );
  }
}
