import 'package:ecommerce/helpers/colors.dart';
import 'package:ecommerce/helpers/media_provider.dart';
import 'package:ecommerce/helpers/metrics.dart';
import 'package:ecommerce/widgets/common/widgets/buttons/iconed_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ReduceableButton extends StatelessWidget {
  // const CollapsableButton({Key? key}) : super(key: key);
  WidthType widthType = WidthType.medium;
  double collapsedWidth = 50;

  String? iconName;
  String title = "no_title";
  String? get firstText => title.characters.first;

  Color tintColor = ColorPack.icon;
  void Function()? onTap;
  void Function(bool)? onHover;

  ReduceableButton(
      {WidthType? widthType,
      String? title,
      String? iconName,
      Color? tintColor,
      Function()? onTap,
      Function(bool)? onHover}) {
    this.widthType = widthType ?? this.widthType;
    this.iconName = iconName;
    this.title = title ?? this.title;
    this.tintColor = tintColor ?? this.tintColor;
    this.onTap = onTap;
    this.onHover = onHover;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withOpacity(0),
      child: InkWell(
        child: Container(
          padding: EdgeInsets.all(4),
          child: body(context),
        ),
        onTap: this.onTap == null ? () {} : this.onTap,
        onHover: this.onHover == null ? (val) => {} : this.onHover,
      ),
    );
  }

  Widget body(BuildContext context) {
    return LayoutBuilder(builder: (a, frame) {
      bool shouldMinimize = widthType == WidthType.small;
      MediaQuery.of(context).size.width;
      return Container(
        child: shouldMinimize
            ? iconOrText(context)
            : IconedButton(
                this.title,
                iconName: this.iconName,
                tintColor: this.tintColor,
              ),
      );
    });
  }

  Widget iconOrText(BuildContext context) {
    if (iconName == null) {
      return Text(
        firstText ?? " ",
        style: TextStyle(color: this.tintColor),
      );
    }

    return Image.asset(
      iconName!,
      height: 24,
      width: 24,
      color: this.tintColor,
    );
  }
}
