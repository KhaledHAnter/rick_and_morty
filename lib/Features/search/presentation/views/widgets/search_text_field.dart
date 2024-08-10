import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key, this.onChanged, this.onSubmitted});

  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      textInputAction: TextInputAction.search,
      onSubmitted: onSubmitted,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Enter character name",
      ),
    );
  }
}
