// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, unnecessary_null_comparison, unused_local_variable, use_build_context_synchronously, avoid_print, no_leading_underscores_for_local_identifiers, unused_element, unused_field
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IndexRHUM"),
      ),
    );
  }
}
