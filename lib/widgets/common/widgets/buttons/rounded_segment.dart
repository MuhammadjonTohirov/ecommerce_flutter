import 'package:ecommerce/helpers/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedSegmentButton extends StatefulWidget {
  final int id;
  final String title;
  final Function(int) onPress;
  final bool isSelected;
  const RoundedSegmentButton(this.id, this.title, this.onPress, this.isSelected,
      {Key? key})
      : super(key: key);

  @override
  State<RoundedSegmentButton> createState() => _RoundedSegmentButtonState();
}

class _RoundedSegmentButtonState extends State<RoundedSegmentButton> {
  @override
  Widget build(BuildContext context) {
    return roundedButton(widget.title, (e) => widget.onPress(e),
        isSelected: widget.isSelected);
  }

  Widget roundedButton(String title, Function(int) onPress,
      {bool isSelected = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        child: CupertinoButton(
          padding: EdgeInsets.only(left: 0),
          child: Container(
            width: 100,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(
                  color: isSelected
                      ? ColorPack.primary
                      : Colors.grey.withAlpha(100)),
            ),
            child: Text(title,
                style: TextStyle(fontSize: 14, color: ColorPack.text)),
          ),
          onPressed: () {
            setState(() {
              var id = widget.id;
              var isSelected = widget.isSelected;
              print("on click $id $isSelected");
              onPress(id);
            });
          },
        ),
      ),
    );
  }
}
