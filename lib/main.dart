import 'package:fludo/ui/style/grid.dart';
import 'package:flutter/material.dart';
import 'package:fludo/ui/button.dart';

void main() => runApp(const FludoApp());

class FludoApp extends StatelessWidget {
  const FludoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Grid(
          child: UIButton(
            text: "Add new task",
            icon: Icons.arrow_outward_rounded,
          ),
        ),
      ),
    );
  }
}
