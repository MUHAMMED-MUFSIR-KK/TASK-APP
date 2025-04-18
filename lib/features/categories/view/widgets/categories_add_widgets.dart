import 'package:flutter/material.dart';

class categoriesAddedWidget extends StatelessWidget {
  final VoidCallback onTap;
  const categoriesAddedWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 180,
      decoration: BoxDecoration(
          color: const Color.fromARGB(250, 55, 63, 74),
          boxShadow: [
            BoxShadow(
                color: const Color.fromARGB(255, 44, 44, 44),
                offset: Offset(0, 2),
                spreadRadius: 1.2)
          ]),
      child: Center(
        child: GestureDetector(
          onTap: onTap,
          child: CircleAvatar(
              radius: 25,
              child: Icon(
                Icons.add,
                size: 40,
              )),
        ),
      ),
    );
  }
}
