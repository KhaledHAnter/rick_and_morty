import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/Features/home/data/models/character_model/character_model.dart';

class CharacterImage extends StatelessWidget {
  const CharacterImage({
    super.key,
    required this.character,
  });

  final CharacterModel character;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(character.image ?? ""),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
