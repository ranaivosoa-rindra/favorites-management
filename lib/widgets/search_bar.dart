// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, unnecessary_null_comparison, unused_local_variable, use_build_context_synchronously, avoid_print, no_leading_underscores_for_local_identifiers, unused_element, unused_field, prefer_final_fields, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChange;
  final String hintText;
  const SearchBar(
      {Key? key,
      required this.controller,
      required this.onChange,
      required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Icon(
            Icons.search,
            size: 19,
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 16),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide(color: Colors.black, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide(color: Colors.black, width: 1),
        ),
      ),
      style: const TextStyle(fontSize: 16),
      onChanged: onChange,
    );
  }
}
