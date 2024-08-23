import 'package:flutter/material.dart';
import '../../app/custom_widgets/mobile/custom_app_bar.dart';

class WhiteListView extends StatefulWidget {
  const WhiteListView({super.key});

  @override
  State<WhiteListView> createState() => _WhiteListViewState();
}

class _WhiteListViewState extends State<WhiteListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [customAppBar(title: "ECOM",context: context), Text("Whitelist Screen")],
        ),
      )),
    );
  }
}
