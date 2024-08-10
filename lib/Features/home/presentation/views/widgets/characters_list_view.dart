import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:rick_and_morty/Core/widgets/custom_error_widget.dart';
import 'package:rick_and_morty/Features/home/presentation/manager/all_characters_cubit/all_characters_cubit_cubit.dart';
import 'package:rick_and_morty/Features/home/presentation/views/widgets/character_item.dart';
import 'package:rick_and_morty/Features/home/presentation/views/widgets/load_more_button.dart';
import 'package:rick_and_morty/constants.dart';

class CharactersListView extends StatelessWidget {
  const CharactersListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllCharactersCubitCubit, AllCharactersCubitState>(
      builder: (context, state) {
        if (state is AllCharactersCubitSuccess) {
          return Expanded(
            child: ListView.builder(
              itemCount: state.characters.length + 1,
              itemBuilder: (context, index) {
                if (index == state.characters.length) {
                  if (state is MoreCharactersCubitLoading) {
                    Center(
                      child: LoadingAnimationWidget.waveDots(
                          color: kPrimaryColor, size: 100),
                    );
                  } else {
                    return GestureDetector(
                      onTap: () {
                        BlocProvider.of<AllCharactersCubitCubit>(context)
                            .fetchMoreCharacters();
                        // print(state.characters.length);
                      },
                      child: const LoadMoreButton(),
                    );
                  }
                }
                return CharacterItem(
                  character: state.characters[index],
                );
              },
            ),
          );
        } else if (state is AllCharactersCubitFailure) {
          return Center(child: CustomErrorWidget(errMessage: state.errMessage));
        } else {
          return Center(
            child: LoadingAnimationWidget.beat(color: kPrimaryColor, size: 100),
          );
        }
      },
    );
  }
}
