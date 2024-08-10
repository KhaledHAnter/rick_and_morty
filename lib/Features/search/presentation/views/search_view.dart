import 'package:flutter/material.dart';
import 'package:rick_and_morty/Features/search/presentation/views/widgets/search_view_body.dart';
import 'package:rick_and_morty/constants.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text(
          'Search for a character',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: const SearchViewBody(),
    );
  }
}
