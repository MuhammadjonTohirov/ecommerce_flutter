import 'package:ecommerce/helpers/colors.dart';
import 'package:ecommerce/widgets/common/widgets/fields/field_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PriceField extends StatefulWidget {
  late final TextEditingController controller;
  late final String hint;

  PriceField(this.controller, this.hint);

  @override
  State<PriceField> createState() => _PriceFieldState();
}

class _PriceFieldState extends State<PriceField> {
  @override
  Widget build(BuildContext context) {
    return FieldContainer(
        TextField(
          controller: this.widget.controller,
          onTap: () {},
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            hintText: "0",
            prefixText: "\$",
            prefixStyle: TextStyle(color: ColorPack.text),
            hintStyle: TextStyle(color: ColorPack.secondaryText.withAlpha(120)),
            border: InputBorder.none,
          ),
        ),
        widget.hint);
  }
}
