import 'package:flutter/material.dart';
import 'package:rick_and_morty/constants.dart';

class SplashButton extends StatelessWidget {
  const SplashButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Center(
        child: Text(
          'Let\'s Start',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
