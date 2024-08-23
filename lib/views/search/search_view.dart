import 'package:bloc_ecom_app/app/custom_widgets/mobile/custom_app_bar.dart';
import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [customAppBar(title: "ECOM",context: context), Text("Search Screen")],
        ),
      )),
    );
  }
}
