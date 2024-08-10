import 'package:flutter/material.dart';
import 'package:rick_and_morty/Features/character_details/presentaion/views/widgets/character_details_view_body.dart';
import 'package:rick_and_morty/Features/home/data/models/character_model/character_model.dart';

class CharacterDetailsView extends StatelessWidget {
  const CharacterDetailsView({super.key, required this.character});

  final CharacterModel character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CharacterDetailsViewBody(
        character: character,
      ),
    );
  }
}
