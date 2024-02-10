import 'package:flutter/material.dart';

class Grid extends Padding {
  const Grid({
    required Widget child,
    Key? key,
  }) : super(
            child: child,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
            key: key);
}
