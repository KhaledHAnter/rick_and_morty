import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rick_and_morty/Features/home/data/models/character_model/character_model.dart';

class CharacterDetails extends StatelessWidget {
  const CharacterDetails({super.key, required this.character});

  final CharacterModel character;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          character.name ?? "Name",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
        ),
        const Gap(8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              character.status ?? "Status",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 24,
                color: character.status == "Alive" ? Colors.green : Colors.red,
              ),
            ),
            const Gap(8),
            Text(
              character.species ?? "Species",
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
            ),
            const Gap(8),
            Text(
              character.gender ?? "Gender",
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
            ),
          ],
        ),
      ],
    );
  }
}
