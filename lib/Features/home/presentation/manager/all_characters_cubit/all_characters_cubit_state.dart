part of 'all_characters_cubit_cubit.dart';

abstract class AllCharactersCubitState extends Equatable {
  const AllCharactersCubitState();

  @override
  List<Object> get props => [];
}

class AllCharactersCubitInitial extends AllCharactersCubitState {}

class AllCharactersCubitLoading extends AllCharactersCubitState {}

class AllCharactersCubitSuccess extends AllCharactersCubitState {
  final List<CharacterModel> characters;

  const AllCharactersCubitSuccess(this.characters);
}

class AllCharactersCubitFailure extends AllCharactersCubitState {
  final String errMessage;

  const AllCharactersCubitFailure(this.errMessage);
}

class MoreCharactersCubitLoading extends AllCharactersCubitState {}
