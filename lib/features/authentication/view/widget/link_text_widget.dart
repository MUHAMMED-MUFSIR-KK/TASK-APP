import 'package:flutter/material.dart';

class LinkWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const LinkWidget({
    super.key,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
