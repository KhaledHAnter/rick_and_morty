import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errMessage});

  final String errMessage;

  @override
  Widget build(BuildContext context) {
    return Text(
      errMessage,
      style: const TextStyle(
          fontSize: 23, fontWeight: FontWeight.bold, color: Colors.red),
    );
  }
}
