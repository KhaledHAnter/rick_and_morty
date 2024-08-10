import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/Core/utils/app_router.dart';
import 'package:rick_and_morty/Core/utils/service_locator.dart';
import 'package:rick_and_morty/Features/home/data/repos/character_repo_impl.dart';
import 'package:rick_and_morty/Features/home/presentation/manager/all_characters_cubit/all_characters_cubit_cubit.dart';

void main() {
  setup();
  runApp(const RickAndMorty());
}

class RickAndMorty extends StatelessWidget {
  const RickAndMorty({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AllCharactersCubitCubit(getIt.get<CharacterRepoImpl>())
            ..fetchAllCharacters(),
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        title: 'Rick and Morty',
      ),
    );
  }
}
