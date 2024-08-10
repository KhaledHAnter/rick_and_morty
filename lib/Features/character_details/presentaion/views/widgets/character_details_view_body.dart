import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rick_and_morty/Features/character_details/presentaion/views/widgets/character_details.dart';
import 'package:rick_and_morty/Features/character_details/presentaion/views/widgets/character_episodes.dart';
import 'package:rick_and_morty/Features/character_details/presentaion/views/widgets/character_image.dart';
import 'package:rick_and_morty/Features/home/data/models/character_model/character_model.dart';

class CharacterDetailsViewBody extends StatelessWidget {
  const CharacterDetailsViewBody({super.key, required this.character});

  final CharacterModel character;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Hero(
            transitionOnUserGestures: true,
            tag: character.id.toString(),
            child: CharacterImage(character: character),
          ),
        ),
        const Gap(16),
        CharacterDetails(character: character),
        const Divider(
          height: 40,
          indent: 50,
          endIndent: 50,
        ),
        Expanded(child: CharacterEpisodes(character: character)),
      ],
    );
  }
}
