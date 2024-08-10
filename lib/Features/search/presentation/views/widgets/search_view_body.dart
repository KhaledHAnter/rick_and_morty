import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:rick_and_morty/Features/home/presentation/views/widgets/character_item.dart';
import 'package:rick_and_morty/Features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:rick_and_morty/Features/search/presentation/views/widgets/search_button.dart';
import 'package:rick_and_morty/Features/search/presentation/views/widgets/search_check_boxes.dart';
import 'package:rick_and_morty/Features/search/presentation/views/widgets/search_status_drop_down.dart';
import 'package:rick_and_morty/Features/search/presentation/views/widgets/search_text_field.dart';
import 'package:rick_and_morty/constants.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  String? name;
  String gender = "gender";
  String status = "All";

  search(String value) async {
    if (value.trim().isEmpty) {
      return;
    }
    await BlocProvider.of<SearchCubit>(context)
        .searchByCharacterName(value: value, gender: gender, status: status);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: SearchTextField(
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                    onSubmitted: search,
                  ),
                ),
                const Gap(16),
                Expanded(
                  child: SearchButton(
                    onTap: () {
                      search(name?.trim() ?? "");
                    },
                  ),
                ),
              ],
            ),
          ),
          const Gap(16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SearchCheckBoxes(
                  value1: gender == "Male",
                  value2: gender == "Female",
                  onChanged1: (value) {
                    gender = "Male";
                    setState(() {});
                  },
                  onChanged2: (value) {
                    gender = "Female";
                    setState(() {});
                  },
                ),
                const Gap(16),
                Expanded(
                  child: SearchStatusDropDown(
                      onChanged: (value) {
                        status = value.toString();
                        setState(() {});
                      },
                      status: status),
                )
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchLoading) {
                  return Center(
                      child: LoadingAnimationWidget.bouncingBall(
                          color: kPrimaryColor, size: 100));
                } else if (state is SearchSuccess) {
                  return ListView.builder(
                      itemCount: state.characters.length,
                      itemBuilder: (context, index) {
                        return CharacterItem(
                            character: state.characters[index]);
                      });
                } else if (state is SearchFailure) {
                  return const Center(child: Text("No results"));
                } else {
                  return const SizedBox();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
