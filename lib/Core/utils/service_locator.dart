import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/Core/utils/api_service.dart';
import 'package:rick_and_morty/Features/home/data/repos/character_repo_impl.dart';
import 'package:rick_and_morty/Features/search/data/repo/search_repo_impl.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );

  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(getIt.get<ApiService>()),
  );

  getIt.registerSingleton<CharacterRepoImpl>(
    CharacterRepoImpl(getIt.get<ApiService>()),
  );
}
