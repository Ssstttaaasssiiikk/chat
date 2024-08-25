import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final Function(String)? onChanged;

  const Input({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
