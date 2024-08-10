import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/Core/utils/app_router.dart';
import 'package:rick_and_morty/Features/spalsh/presentaion/views/widgets/splash_button.dart';
import 'package:rick_and_morty/Features/spalsh/presentaion/views/widgets/splash_image.dart';
import 'package:rick_and_morty/Features/spalsh/presentaion/views/widgets/splash_text.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        const SplashImage(),
        const Gap(32),
        const SplashText(),
        const Spacer(),
        GestureDetector(
          onTap: () => GoRouter.of(context).pushReplacement(AppRouter.kHome),
          child: const SplashButton(),
        ),
        const Gap(40)
      ],
    );
  }
}
