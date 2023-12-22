import 'package:flutter/material.dart';
import 'package:fludo/ui/switch.dart';

void main() => runApp(const FludoApp());

class FludoApp extends StatelessWidget {
  const FludoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const SwitchButton(),
    );
  }
}
