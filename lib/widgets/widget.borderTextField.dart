import 'package:flutter/material.dart';

class BorderedTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const BorderedTextField({super.key, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.white, width: 1.0), // Default border color
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.white, width: 1.0), // Border color when focused
        ),
      ),
    );
  }
}
