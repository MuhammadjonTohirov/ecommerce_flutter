import 'dart:math';

import 'package:ecommerce/helpers/colors.dart';
import 'package:ecommerce/helpers/global_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

enum SimpleButtonState {
  normal,
  pressed,
}

class SimpleButton extends StatelessWidget {
  final Widget child;
  final Function() onPressed;
  final Decoration? decoration;
  SimpleButton(
      {required this.child, required this.onPressed, this.decoration}) {}

  void changeStateTo(
      String localKey, SimpleButtonState state, Function(Function()) setState,
      {TapDownDetails? details}) {
    // setState(() => this.state = state);
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return InkWell(
        overlayColor: MaterialStateProperty.resolveWith(
          (states) => states.contains(MaterialState.pressed)
              ? ColorPack.primary.withOpacity(0.2)
              : Colors.transparent,
        ),
        onTap: onPressed,
        child: child,
      );
    });
  }
}
