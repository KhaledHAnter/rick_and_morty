import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/Core/utils/app_router.dart';
import 'package:rick_and_morty/Features/home/data/models/character_model/character_model.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({
    super.key,
    required this.character,
  });

  final CharacterModel character;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: AspectRatio(
        aspectRatio: 1,
        child: GestureDetector(
          onTap: () {
            GoRouter.of(context)
                .push(AppRouter.kCharactersDetails, extra: character);
          },
          child: Hero(
            transitionOnUserGestures: true,
            tag: character.id.toString(),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    character.image ??
                        "https://pixlr.com/images/index/product-image-one.webp",
                  ),
                ),
              ),
              child: Column(
                children: [
                  const Spacer(),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                      color: Colors.black.withOpacity(.25),
                    ),
                    child: Text(
                      character.name ?? "",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
