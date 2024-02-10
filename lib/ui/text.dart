import 'package:flutter/material.dart';
import 'package:fludo/ui/style/text_style.dart';

class P100 extends Text {
  P100(
    String text, {
    required Color? color,
    Key? key,
  }) : super(
          text,
          style: P100Style(color: color),
          key: key,
        );
}
