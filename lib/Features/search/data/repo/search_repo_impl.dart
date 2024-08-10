import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rick_and_morty/Core/errors/failuars.dart';
import 'package:rick_and_morty/Core/utils/api_service.dart';
import 'package:rick_and_morty/Features/home/data/models/character_model/character_model.dart';
import 'package:rick_and_morty/Features/search/data/repo/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;
  SearchRepoImpl(this.apiService);

  List<CharacterModel> characters = [];

  @override
  Future<Either<Failure, List<CharacterModel>>> searchByCharacterName({
    required String value,
    required String gender,
    required String status,
  }) async {
    characters.clear();
    try {
      var data = await apiService.search(
        value: value,
        gender: gender,
        status: status,
      );
      for (var character in data["results"]) {
        characters.add(CharacterModel.fromJson(character));
      }
      return right(characters);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
