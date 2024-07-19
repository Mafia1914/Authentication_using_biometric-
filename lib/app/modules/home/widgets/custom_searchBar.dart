import 'package:flutter/material.dart';

class CustomSearchbar extends StatelessWidget {
  final TextEditingController controller;

  const CustomSearchbar({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: 'Search',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30), // Set a circular border radius
          ),
          prefixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}
