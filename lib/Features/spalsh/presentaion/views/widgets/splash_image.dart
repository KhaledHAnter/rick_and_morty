import 'package:flutter/material.dart';
import 'package:rick_and_morty/Core/utils/assets.dart';

class SplashImage extends StatelessWidget {
  const SplashImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1000 / 760,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesSplash),
          ),
        ),
      ),
    );
  }
}
