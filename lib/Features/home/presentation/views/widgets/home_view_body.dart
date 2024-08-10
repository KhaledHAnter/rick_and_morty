import 'package:flutter/material.dart';
import 'package:rick_and_morty/Features/home/presentation/views/widgets/characters_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CharactersListView(),
      ],
    );
  }
}
