import 'package:flutter/material.dart';

class SearchStatusDropDown extends StatelessWidget {
  const SearchStatusDropDown(
      {super.key, required this.onChanged, required this.status});

  final void Function(String?)? onChanged;
  final String status;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      isExpanded: true,
      hint: Text(status == "All" ? "Status" : status),
      style: const TextStyle(
          fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
      items: const [
        DropdownMenuItem(
          value: "All",
          child: Text("All"),
        ),
        DropdownMenuItem(
          value: "Alive",
          child: Text("Alive"),
        ),
        DropdownMenuItem(
          value: "Dead",
          child: Text("Dead"),
        ),
        DropdownMenuItem(
          value: "Unknown",
          child: Text("Unknown"),
        ),
      ],
      onChanged: onChanged,
    );
  }
}
