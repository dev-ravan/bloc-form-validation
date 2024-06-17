import 'package:flutter/material.dart';

class MyField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  const MyField({
    super.key,
    required this.hint,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please fill required field $hint";
        }
        return null;
      },
      decoration: InputDecoration(hintText: hint),
    );
  }
}
