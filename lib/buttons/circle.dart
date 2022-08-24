import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  const Circle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.blue,
            width: 8,
          ),
          left: BorderSide(
            color: Colors.blue,
            width: 8,
          ),
          right: BorderSide(
            color: Colors.blue,
            width: 8,
          ),
          bottom: BorderSide(
            color: Colors.blue,
            width: 8,
          ),
        ),
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: const Icon(
        Icons.check,
        size: 80,
        color: Colors.white,
      ),
    );
  }
}
