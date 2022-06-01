import 'package:ecommerce/helpers/colors.dart';
import 'package:flutter/material.dart';

class FieldContainer extends StatelessWidget {
  late final Widget child;
  late final String hint;

  FieldContainer(this.child, this.hint);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Container(
            padding: EdgeInsets.only(left: 8),
            transform: Matrix4.translationValues(0, -1, 0),
            child: child,
          ),
          decoration: BoxDecoration(
            color: ColorPack.background,
            borderRadius: BorderRadius.all(Radius.circular(8)),
            border: Border.all(
              color: Colors.grey.withAlpha(125),
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(color: ColorPack.background),
          transform: Matrix4.translationValues(10, -8, 0),
          padding: EdgeInsets.all(2),
          child: Text(
            hint,
            style: TextStyle(
                fontSize: 12, foreground: Paint()..color = ColorPack.text),
          ),
        )
      ],
    );
  }
}
