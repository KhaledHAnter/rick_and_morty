import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/Core/utils/service_locator.dart';
import 'package:rick_and_morty/Features/character_details/presentaion/views/character_details_view.dart';
import 'package:rick_and_morty/Features/home/data/models/character_model/character_model.dart';
import 'package:rick_and_morty/Features/home/presentation/views/home_view.dart';
import 'package:rick_and_morty/Features/search/data/repo/search_repo_impl.dart';
import 'package:rick_and_morty/Features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:rick_and_morty/Features/search/presentation/views/search_view.dart';
import 'package:rick_and_morty/Features/spalsh/presentaion/views/splash_view.dart';

abstract class AppRouter {
  static const kHome = '/homeView';
  static const kCharactersDetails = '/charactersDetailsView';
  static const kSearch = '/searchView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHome,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kCharactersDetails,
        builder: (context, state) => CharacterDetailsView(
          character: state.extra as CharacterModel,
        ),
      ),
      GoRoute(
        path: kSearch,
        builder: (context, state) => BlocProvider(
          create: (context) => SearchCubit(
            getIt.get<SearchRepoImpl>(),
          ),
          child: const SearchView(),
        ),
      ),
    ],
  );
}
