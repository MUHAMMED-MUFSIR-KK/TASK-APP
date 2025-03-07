import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  const ButtonWidget({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: const Color.fromARGB(200, 84, 115, 187),
        height: 50,
        width: double.infinity,
        child: Center(
            child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
          ),
        )),
      ),
    );
  }
}
