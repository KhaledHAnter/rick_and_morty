import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rick_and_morty/Core/errors/failuars.dart';
import 'package:rick_and_morty/Core/utils/api_service.dart';
import 'package:rick_and_morty/Features/home/data/models/character_model/character_model.dart';
import 'package:rick_and_morty/Features/home/data/repos/character_repo.dart';

class CharacterRepoImpl implements CharacterRepo {
  final ApiService apiService;
  CharacterRepoImpl(this.apiService);

  int currentPage = 1;
  int? totalPages;
  List<CharacterModel> characters = [];

  @override
  Future<Either<Failure, List<CharacterModel>>> fetchAllCharacters() async {
    currentPage = 1;
    try {
      var data = await apiService.get(endpoint: "/character?page=$currentPage");
      totalPages = data["info"]["pages"];
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

  @override
  Future<Either<Failure, List<CharacterModel>>> fetchMoreCharacters() async {
    print(currentPage);
    // print(characters.length);
    if (currentPage == totalPages) {
      return right([]);
    }
    currentPage++;
    try {
      characters.clear();
      var data = await apiService.get(endpoint: "/character?page=$currentPage");
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
