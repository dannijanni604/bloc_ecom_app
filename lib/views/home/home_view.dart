import 'package:flutter/material.dart';

import '../../custom_widgets/mobile/custom_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [customAppBar(title: "ECOM"), Text("Home Screen")],
        ),
      )),
    );
  }
}
