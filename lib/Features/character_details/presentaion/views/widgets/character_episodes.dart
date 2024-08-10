import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rick_and_morty/Features/home/data/models/character_model/character_model.dart';

class CharacterEpisodes extends StatelessWidget {
  const CharacterEpisodes({super.key, required this.character});

  final CharacterModel character;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Episodes",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
        const Gap(8),
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4),
            physics: const BouncingScrollPhysics(),
            // scrollDirection: Axis.horizontal,
            itemCount: character.episode?.length ?? 0,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.withOpacity(0.15),
                ),
                child: Center(
                  child: Text(
                    character.episode?[index].toString().substring(40) ??
                        "Episodes",
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 24),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
