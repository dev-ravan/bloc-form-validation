import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  const MyButton({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            fixedSize: const Size(double.maxFinite, 50),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        onPressed: onTap,
        child: Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white),
        ));
  }
}
