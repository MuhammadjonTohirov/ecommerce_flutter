import 'package:ecommerce/helpers/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class IconedButton extends StatelessWidget {
  String? iconName;
  String title = "no_title";

  Color tintColor = ColorPack.icon;

  IconedButton(String title, {Key? key, String? iconName, Color? tintColor}) {
    this.title = title;
    this.iconName = iconName;
    this.tintColor = tintColor ?? this.tintColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          (iconName != null)
              ? Image.asset(iconName!, width: 24, height: 24, color: tintColor)
              : SizedBox.shrink(),
          Container(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              title,
              style: TextStyle(color: tintColor),
            ),
          )
        ],
      ),
    );
  }
}
