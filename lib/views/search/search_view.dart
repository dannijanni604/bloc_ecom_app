import 'package:flutter/material.dart';
import '../../config/custom_widgets/custom_app_bar.dart';

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
