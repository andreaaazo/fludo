import 'package:flutter/material.dart';

class UIIcon extends Icon {
  const UIIcon(
    IconData icon, {
    required int type,
    required Color color,
    Key? key,
  }) : super(
          icon,
          key: key,
          size: type == 1 ? 24 : 16,
          weight: 300,
          color: color,
        );
}
