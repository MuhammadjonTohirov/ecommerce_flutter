import 'package:ecommerce/helpers/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  SubmitButton(Key key, this.text, this.onPressed) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 36),
        decoration: BoxDecoration(
          color: ColorPack.primary,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}
