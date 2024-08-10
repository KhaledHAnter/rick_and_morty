import 'package:dartz/dartz.dart';
import 'package:rick_and_morty/Core/errors/failuars.dart';
import 'package:rick_and_morty/Features/home/data/models/character_model/character_model.dart';

abstract class CharacterRepo {
  Future<Either<Failure, List<CharacterModel>>> fetchAllCharacters();
  Future<Either<Failure, List<CharacterModel>>> fetchMoreCharacters();
}
