import 'package:flutter/material.dart';
import '../../config/config.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "ECOM", context: context),
      body: const SingleChildScrollView(
        child: Column(
          children: [Text("Search Screen")],
        ),
      ),
    );
  }
}
