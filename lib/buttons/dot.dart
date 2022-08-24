import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class dots extends StatelessWidget {
  const dots({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        border: const Border(
          top: BorderSide(
            color: Colors.blue,
            width: 4,
          ),
          left: BorderSide(
            color: Colors.blue,
            width: 4,
          ),
          right: BorderSide(
            color: Colors.blue,
            width: 4,
          ),
          bottom: BorderSide(
            color: Colors.blue,
            width: 4,
          ),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
    );
  }
}
