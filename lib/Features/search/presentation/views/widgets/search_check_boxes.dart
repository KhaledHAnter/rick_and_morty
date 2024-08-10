import 'package:flutter/material.dart';

class SearchCheckBoxes extends StatelessWidget {
  const SearchCheckBoxes({
    super.key,
    required this.value1,
    required this.value2,
    required this.onChanged1,
    required this.onChanged2,
  });

  final bool? value1;
  final bool? value2;
  final void Function(bool?)? onChanged1;
  final void Function(bool?)? onChanged2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          child: Row(
            children: [
              Checkbox(
                value: value1,
                onChanged: onChanged1,
              ),
              const Text(
                "Male",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          child: Row(
            children: [
              Checkbox(
                value: value2,
                onChanged: onChanged2,
              ),
              const Text(
                "Female",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
