import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/Features/home/data/models/character_model/character_model.dart';
import 'package:rick_and_morty/Features/home/data/repos/character_repo.dart';

part 'all_characters_cubit_state.dart';

class AllCharactersCubitCubit extends Cubit<AllCharactersCubitState> {
  AllCharactersCubitCubit(this.characterRepo)
      : super(AllCharactersCubitInitial());

  final CharacterRepo characterRepo;

  Future<void> fetchAllCharacters() async {
    emit(AllCharactersCubitLoading());
    var result = await characterRepo.fetchAllCharacters();
    result.fold((failure) {
      emit(AllCharactersCubitFailure(failure.errMessage));
    }, (characters) {
      emit(
        AllCharactersCubitSuccess(characters),
      );
    });
  }

  Future<void> fetchMoreCharacters() async {
    emit(MoreCharactersCubitLoading());
    var result = await characterRepo.fetchMoreCharacters();
    result.fold(
      (failure) {
        emit(AllCharactersCubitFailure(failure.errMessage));
      },
      (characters) {
        emit(AllCharactersCubitSuccess(characters));
      },
    );
  }
}
