import 'package:ecommerce/helpers/colors.dart';
import 'package:ecommerce/helpers/global_methods.dart';
import 'package:ecommerce/helpers/metrics.dart';
import 'package:ecommerce/widgets/common/widgets/buttons/reduceable_button.dart';
import 'package:flutter/material.dart';

class SideMenuItem {
  final String id;
  String title;
  bool isSelected;
  bool isHovering = false;
  String icon;

  void Function(String)? onHovering;
  void Function(String)? onClick;

  SideMenuItem(this.id, this.title, this.isSelected, this.icon,
      {this.isHovering = false, this.onHovering, this.onClick});

  Color get tintColor {
    if (isHovering && !isSelected) {
      return Colors.red;
    }

    return isSelected ? ColorPack.primary : ColorPack.icon.withOpacity(0.3);
  }

  Widget body(BuildContext context, bool isSelected,
      {bool isHovering = false}) {
    WidthType type = widthTypeWith(context);
    this.isSelected = isSelected;
    this.isHovering = isHovering;
    return ReduceableButton(
      widthType: type,
      title: title,
      iconName: icon,
      tintColor: tintColor,
      onTap: () {
        appLog("On click menu item");
        this.isSelected = true;
        if (this.onClick != null) {
          this.onClick!(this.id);
        }
      },
      onHover: (isHovering) {
        this.isHovering = isHovering;
        if (isHovering && this.onHovering != null) {
          this.onHovering!(this.id);
        }
      },
    );
  }
}
