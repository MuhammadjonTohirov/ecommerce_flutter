import 'package:ecommerce/widgets/common/widgets/buttons/rounded_segment.dart';
import 'package:flutter/material.dart';

class SegmentedControlItem {
  final Key key;
  final int id;
  final String title;

  SegmentedControlItem({
    required this.key,
    required this.id,
    required this.title,
  });
}

class SegmentedControl extends StatefulWidget {
  final List<SegmentedControlItem> items;
  int selectedId = 0;

  SegmentedControl({
    Key? key,
    required this.items,
  }) : super(key: key) {
    this.selectedId = items.first.id;
  }

  @override
  State<SegmentedControl> createState() => _SegmentedControlState();
}

class _SegmentedControlState extends State<SegmentedControl> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 0,
      children: widget.items.map((e) {
        return RoundedSegmentButton(e.id, e.title, (id) {
          setState(() {
            this.widget.selectedId = id;
          });
        }, this.widget.selectedId == e.id);
      }).toList(),
    );
  }
}
