import 'package:flutter/material.dart';
import 'package:rick_and_morty/constants.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: const Icon(Icons.search),
      ),
    );
  }
}
