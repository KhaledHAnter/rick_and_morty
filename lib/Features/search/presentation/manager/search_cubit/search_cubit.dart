import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/Features/home/data/models/character_model/character_model.dart';
import 'package:rick_and_morty/Features/search/data/repo/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());

  final SearchRepo searchRepo;

  Future<void> searchByCharacterName({
    required String value,
    required String gender,
    required String status,
  }) async {
    emit(SearchLoading());
    var result = await searchRepo.searchByCharacterName(
        value: value, status: status, gender: gender);
    result.fold((failure) {
      emit(SearchFailure());
    }, (characters) {
      emit(SearchSuccess(characters));
    });
  }
}
