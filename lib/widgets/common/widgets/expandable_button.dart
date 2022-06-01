import 'package:ecommerce/helpers/colors.dart';
import 'package:ecommerce/helpers/media_provider.dart';
import 'package:ecommerce/widgets/common/widgets/label.dart';
import 'package:flutter/material.dart';

class ExpandableButton extends StatefulWidget {
  late final String text;
  late final List<Widget> children;

  ExpandableButton(String text, List<Widget> children) {
    this.text = text;
    this.children = children;
  }

  @override
  State<ExpandableButton> createState() => _ExpandableButtonState();
}

class _ExpandableButtonState extends State<ExpandableButton> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 32,
            child: MaterialButton(
              child: Row(
                children: [
                  Container(
                    child: leftIcon(),
                    width: 24,
                    height: 24,
                  ),
                  SizedBox(width: 4),
                  Label(
                    widget.text,
                    color: ColorPack.text,
                  ),
                ],
              ),
              onPressed: () => {
                setState(
                  () => {
                    isVisible = !isVisible,
                  },
                ),
              },
            ),
          ),
          childView()
        ],
      ),
    );
  }

  Widget leftIcon() {
    if (isVisible) {
      return Image.asset(Media.iconChevronDown);
    }

    return Image.asset(Media.iconChevronRight);
  }

  Widget childView() {
    if (isVisible) {
      return Container(
        padding: EdgeInsets.only(left: 16),
        child: Column(
          children: widget.children,
        ),
      );
    }
    return SizedBox(
      height: 0,
      width: 0,
    );
  }
}
