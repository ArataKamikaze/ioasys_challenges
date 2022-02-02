import 'package:flutter/material.dart';

class CustomBoxShadow extends BoxShadow {
  const CustomBoxShadow({Key? key, required Color color})
      : super(
          color: color,
          offset: const Offset(0, 4),
          blurRadius: 8,
          spreadRadius: 0,
        );
}
