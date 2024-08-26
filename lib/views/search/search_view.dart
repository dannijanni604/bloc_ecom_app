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
      appBar: customAppBar(title: "ECOM",context: context),
      body: SingleChildScrollView(
              child: Column(
      children: [ Text("Search Screen")],
              ),
            ),
    );
  }
}
