import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  String title;
  VoidCallback function;
  Button(this.title, this.function, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(title),
      onPressed: () => function,
    );
  }
}
