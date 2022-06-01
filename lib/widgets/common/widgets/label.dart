import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  late final String text;
  late final double? fontSize;
  late final FontWeight? fontWeight;
  late final Color? color;

  Label(
    String text, {
    Color? color = Colors.black,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    this.text = text;
    this.fontSize = fontSize;
    this.fontWeight = fontWeight;
    this.color = color;
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Text(
        text,
        style: TextStyle(
            fontSize: fontSize ?? 16,
            fontWeight: this.fontWeight,
            color: this.color),
      ),
    );
  }
}
