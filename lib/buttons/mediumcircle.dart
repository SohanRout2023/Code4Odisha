import 'package:flutter/material.dart';

class MediumCircle extends StatelessWidget {
  const MediumCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.blue,
            width: 6,
          ),
          left: BorderSide(
            color: Colors.blue,
            width: 6,
          ),
          right: BorderSide(
            color: Colors.blue,
            width: 6,
          ),
          bottom: BorderSide(
            color: Colors.blue,
            width: 6,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: const Icon(
        Icons.rocket,
        size: 30,
        color: Colors.white,
      ),
    );
  }
}
